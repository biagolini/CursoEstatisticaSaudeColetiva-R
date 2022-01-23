# CURSO: ESTATÍSTICA PARA SAÚDE COLETIVA
# TUTORIAL: Quiquadrado de independencia

# Por segurança: Limpar memoria do R
rm(list=ls())

#___________________________________________________________________________________
#### Importar seu conjunto de dados para o R
## Opção 1: via Google Drive
LinkAcessoDrive<-"https://docs.google.com/spreadsheets/d/e/2PACX-1vTNICAmWcF6tGHRhXif7_8uG-dBLQza9zi9kCte3XFEbx9kv9m4nR0NG9YmbR45sHHp01CSvFRIyHl9/pub?output=csv"; tabela1<-read.csv(url(LinkAcessoDrive), sep = ",",dec = "."); rm(LinkAcessoDrive); tabela1$Sexo<-as.factor(tabela1$Sexo)

LinkAcessoDrive<-"https://docs.google.com/spreadsheets/d/e/2PACX-1vSrCHHI_LfZ_7JmppmMOejz6M99WBP1lUZBLsRcOr8ivhqdlMZb7iE5oitlMkTh2UmU1Uz3-yxefPwq/pub?gid=0&single=true&output=csv"; tabela2<-read.csv(url(LinkAcessoDrive), sep = ",",dec = "."); rm(LinkAcessoDrive)


## Opção 2: Importar tabela via documento salvo no seu computador
# Definir diretorio 
setwd(choose.dir())

# Importar tabela (xlsx) 
library(openxlsx)
tabela1=read.xlsx("Dados Fleury.xlsx")
tabela2=read.xlsx("DadosAula11.xlsx")

#_________________________________________________________________________
### Pegunta 1. O diagnostico de COVID está associado com o sexo?

# Criar tabela de contingencia
TabCont = table(tabela1$Covid19PCR,tabela1$Sexo) 

#### Mosaic plot(não é obrigatorio, mas te ajuda a visualizar as proporções esperadas e observadas) 
mosaicplot(TabCont, color=TRUE,las = 1, cex.axis=1.5,main =NULL)

#### Teste de chi-quadrado de independencia
modelo<-chisq.test(TabCont)
modelo

# Pré-requisito: conferir qual era o numero esperado de observações para os grupos estudados
modelo$expected



#_________________________________________________________________________
### Pegunta 2. O risco de pegar COVID é influeniado pelo uso de mascara?
# Criar tabela de contingencia
TabCont = table(tabela2$COVID,tabela2$Mascara) 
TabCont

#### Mosaic plot(não é obrigatorio, mas te ajuda a visualizar as proporções esperadas e observadas) 
mosaicplot(TabCont, color=TRUE,las = 1, cex.axis=.75,main =NULL)


#### Teste de chi-quadrado de independencia
modelo<-chisq.test(TabCont)
modelo

# Pré-requisito: conferir qual era o numero esperado de observações para os grupos estudados
modelo$expected

#_________________________________________________________________________
### Pegunta 3. A percepção de qualidade do atendimento depende do sexo do paciente?
# Criar tabela de contingencia
TabCont = table(tabela2$Sexo,tabela2$QualidadeAtendimento) 
TabCont

#### Mosaic plot(não é obrigatorio, mas te ajuda a visualizar as proporções esperadas e observadas) 
mosaicplot(TabCont, color=c("red", "yellow","darkgreen","darkblue"),las = 1, cex.axis=.75,main =NULL)


#### Teste de chi-quadrado de independencia
modelo<-chisq.test(TabCont)
modelo

# Pré-requisito: conferir qual era o numero esperado de observações para os grupos estudados
modelo$expected
