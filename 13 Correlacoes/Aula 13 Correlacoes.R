# CURSO: ESTATÍSTICA PARA SAÚDE COLETIVA
# TUTORIAL: Correlacoes

# Por segurança: Limpar memoria do R
rm(list=ls())

#___________________________________________________________________________________
#### Importar seu conjunto de dados para o R
## Opção 1: via Google Drive
LinkAcessoDrive<-"https://docs.google.com/spreadsheets/d/e/2PACX-1vST88TT3YI8A_6Ck0WgCxHsUCLuGa0qFFiSN0XIc4ltPwD-vNaqKrNpmi5u_JCOfsep7RY5ipDdWT_Q/pub?gid=0&single=true&output=csv"; tabela1<-read.csv(url(LinkAcessoDrive), sep = ",",dec = "."); rm(LinkAcessoDrive)

LinkAcessoDrive<-"https://docs.google.com/spreadsheets/d/e/2PACX-1vTNICAmWcF6tGHRhXif7_8uG-dBLQza9zi9kCte3XFEbx9kv9m4nR0NG9YmbR45sHHp01CSvFRIyHl9/pub?output=csv"; tabela2<-read.csv(url(LinkAcessoDrive), sep = ",",dec = "."); rm(LinkAcessoDrive); tabela2$Sexo<-as.factor(tabela2$Sexo)

## Opção 2: Importar tabela via documento salvo no seu computador
# Definir diretorio 
setwd(choose.dir())

# Importar tabela (xlsx) 
library(openxlsx)
tabela1=read.xlsx("DadosAula13.xlsx")
tabela2=read.xlsx("Dados Fleury.xlsx")


#_________________________________________________________________________
### Pegunta 1. Existe correlação entre número de horas que uma pessoa fica sentado e o nível de estresse? 
# Verificar pressuposto de normalidade
shapiro.test(tabela1$HorasSentado) # p > 0.05 é indicativo de que a distribuição é normal
shapiro.test(tabela1$NivelEstresse)

# Inspição visual
boxplot(tabela1$HorasSentado) 
boxplot(tabela1$NivelEstresse)

# Teste de correlação de Pearson
cor.test(tabela1$HorasSentado,tabela1$NivelEstresse)

# Grafico de dispersão
plot(tabela1$NivelEstresse,tabela1$HorasSentado,ylab="Numero de horas sentado todos os dias",xlab="Cortisol sanguineo: Micrograma (µg) por decilitro de sangue (dL)", las=1)


#_________________________________________________________________________
### Pegunta 2. Existe correlação entre o nível de estresse e a pratica de atividade física
# Verificar pressuposto de normalidade
shapiro.test(tabela1$AtividadeFisica) # p < 0.05 é indicativo de que a distribuição não é normal
# Inspição visual
boxplot(tabela1$AtividadeFisica) 

# Teste de correlação de Spearman  (coeficiente = rho)
cor.test(tabela1$AtividadeFisica,tabela1$NivelEstresse,method="spearman") # Note que surgiu um erro. Empates = mais de uma observação apresentrou o mesmo valor

# Dado a existencia de empates, recomenda-se a correlação Kendall (coeficiente = tau)
cor.test(tabela1$NivelEstresse,tabela1$AtividadeFisica,method="kendall")

# Grafico de dispersão
plot(tabela1$NivelEstresse,tabela1$AtividadeFisica,ylab="Numero de horas de pratica de atividade física",xlab="Cortisol sanguineo: Micrograma (µg) por decilitro de sangue (dL)", las=1)


#_________________________________________________________________________
### Pegunta 3. Existe correlação entre numero de horas sentado e relato de dor nas costas? 
# Antes, vamos informar ao R qual é a ordem das categorias da variável dor nas costas. 
tabela1$DoresCostas<- factor(tabela1$DoresCostas,levels = c("SemDor","Leve","Moderada","Intensa" ))

# Dado a existencia de empates (porque as pessoas só podiam votar em 4 categorias), recomenda-se a correlação Kendall (coeficiente = tau)
cor.test(rank(c(tabela1$DoresCostas)), tabela1$HorasSentado,method="kendall")

# Box plot para ilustrar a relação
boxplot(tabela1$HorasSentado~tabela1$DoresCostas,ylab="Número de horas sentado",xlab="Relato de dor nas costas", las=1)    

#_________________________________________________________________________
### Pegunta 4. Existe correlação entre a glicose sanguinea e insulina? 
# Exemplo para ilustrar o que acontece quando o n é grande
# Teste de correlação de Pearson
cor.test(tabela2$Glicose,tabela2$Insulina)
# Grafico de dispersão
plot(tabela2$Glicose,tabela2$Insulina,xlab="Glicose",ylab="Insulina", las=1)