# CURSO: ESTATÍSTICA PARA SAÚDE COLETIVA
# TUTORIAL: Quiquadrado

# Por segurança: Limpar memoria do R
rm(list=ls())

#___________________________________________________________________________________
#### Importar seu conjunto de dados para o R
## Opção 1: via Google Drive
# Tabela 1
LinkAcessoDrive<-"https://docs.google.com/spreadsheets/d/e/2PACX-1vQA6SOAsyB7u6ey9IkGyI5jOAWAf8mD_xshhn03ttr4upOLbYn45UzNv0SEoiua0QMf9o_MEg_FvU99/pub?output=csv"; tabela1<-read.table(url(LinkAcessoDrive),header =T, sep = ","); rm(LinkAcessoDrive)

# Tabela 2
LinkAcessoDrive<-"https://docs.google.com/spreadsheets/d/e/2PACX-1vR2cQkv2U2DTMSxOxh1LHKYu79_03xF-ERO9ZJKZZ19Q5x01tCRLN1umba70S_9hdH3MJp8d3ZPyS-D/pub?output=csv"; tabela2<-read.table(url(LinkAcessoDrive),header =T, sep = ","); rm(LinkAcessoDrive)


## Opção 2: Importar tabela via documento salvo no seu computador
# Definir diretorio 
setwd(choose.dir())

# Importar tabela (xlsx) 
library(openxlsx)
tabela1=read.xlsx("DadosHospital.xlsx")
tabela2=read.xlsx("DadosEstadoCivil.xlsx")

#_________________________________________________________________________
### Pegunta 1. A COVID foi proporcionalmente distribuída  entre os diferentes profissionais da saúde de um hospital?
View(tabela1)

#### Mosaic plot(não é obrigatorio, mas te ajuda a visualizar as proporções esperadas e observadas) 
# Calcular frequencias esperadas e observadas
fEsp<- tabela1$NumeroFuncionarios/sum(tabela1$NumeroFuncionarios)
fObs<- tabela1$InfectadosCovid/sum(tabela1$InfectadosCovid)

# Criar tabela para fazer a figura
DadosGrafico<-rbind(fEsp,fObs)
rownames(DadosGrafico)<-c("Esperada", "Observada")
colnames(DadosGrafico)<-tabela1$Profissao

# Gerar a figura
mosaicplot(DadosGrafico,main="Proporção", color=c("blue", "yellow","red","green","pink"), ylab="Profissao",las = 1) 

#### Teste de chi-quadrado de aderência
modelo<-chisq.test(x = tabela1$InfectadosCovid , p = tabela1$NumeroFuncionarios , rescale.p = T)
modelo

# Pré-requisito: conferir qual era o numero esperado de observações para os grupos estudados
modelo$expected

# Interpretação
# p maior que 0.05 = H0 é verdadeira, portanto: A distribuição das frequências observas NÃO difere das frequências esperadas
# p menor que 0.05 = H1 é verdadeira, portanto: A distribuição das frequências observas difere (SIM) das frequências esperadas


#_________________________________________________________________________
### Pegunta 2. A obesidade está proporcionalmente distribuída entre pessoas com diferentes estado civil?
View(tabela2)

#### Mosaic plot(não é obrigatorio, mas te ajuda a visualizar as proporções esperadas e observadas) 
# Calcular frequencias esperadas e observadas
fEsp<- tabela2$ProporcaoIBGE 
fObs<- tabela2$TotalObesidae/sum(tabela2$TotalObesidae)

# Criar tabela para fazer a figura
DadosGrafico<-rbind(fEsp,fObs)
rownames(DadosGrafico)<-c("Esperada", "Observada")
colnames(DadosGrafico)<-tabela2$EstadoCivil

# Gerar a figura
mosaicplot(DadosGrafico,main="Proporção", color=TRUE, ylab="Estado civil",las = 1, cex.axis=0.75)

#### Teste de chi-quadrado de aderência
## Aplicar o teste
modelo<- chisq.test(x = tabela2$TotalObesidae , p = tabela2$ProporcaoIBGE , rescale.p = T)  
modelo

# Pré-requisito: conferir qual era o numero esperado de observações para os grupos estudados
modelo$expected

# Agora que já rodamos o teste, e sabemos onde está a diferença, vamos encontrar quais são os grupos que apresentam de fato a diferença. 
significancia<-0.05 # definir seu valor de alfa (normalmente se usa 5%)
correcaop <- significancia/(modelo$parameter+1)
linhaCorte<-qnorm(correcaop/2)
testeDif<-abs(modelo$stdres)>abs(linhaCorte)
names(testeDif)<- tabela2$EstadoCivil  # Coloque aqui a coluna com a identificação dos seus dados

# Resultado
testeDif
# interpretação: onde aparecer TRUE(verdadeiro) são os grupos onde há diferença real entre a proporção esperada e obervada

############# Extra, como exportar figura  em alta resolução
# Salvar arquivo em formato JPG
jpeg("Fig 1 (JPG) Mosaicplot.jpg",  width = 2000,height = 1500, res = 300) 

mosaicplot(DadosGrafico,main="Proporção", color=c("blue", "yellow","red","green","pink"), ylab="Estado civil",las = 1, cex.axis=0.75)

dev.off()

# Parametros: width = largura em numero de pixels; height= altura em numero de pixels; Res= resolução em numero de pixels por polegada quadrada
# Link para consultar uma lista com nome de cores no R https://www.datanovia.com/en/blog/awesome-list-of-657-r-color-names/ 



# Salvar sua figura em um formato editavel (SVG)
# O formato svg é o formato usado pelo software inkscape https://inkscape.org/release/inkscape-1.0.1/
install.packages("svglite")
library(svglite)
svglite("Fig 1 (SVG) Mosaicplot.svg",  height = 6,width = 8, bg = "white")

mosaicplot(DadosGrafico,main="Proporção", color = TRUE, ylab="Profissao",las = 1) 

dev.off()