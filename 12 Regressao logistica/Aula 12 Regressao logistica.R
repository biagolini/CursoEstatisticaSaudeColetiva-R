# CURSO: ESTATÍSTICA PARA SAÚDE COLETIVA
# TUTORIAL: Regressão logística

# Por segurança: Limpar memoria do R
rm(list=ls())

#___________________________________________________________________________________
#### Importar seu conjunto de dados para o R
## Opção 1: via Google Drive
LinkAcessoDrive<-"https://docs.google.com/spreadsheets/d/e/2PACX-1vQ_g3TsHbdFUOKiYP8HSfX8CeK9XRSh_AaxUGFNbtjoy6kKC-isrrGSY5SGv21EkKdPCrA5qh2Y5eOa/pub?output=csv"; tabela1<-read.csv(url(LinkAcessoDrive), sep = ",",dec = "."); rm(LinkAcessoDrive)

## Opção 2: Importar tabela via documento salvo no seu computador
# Definir diretorio 
setwd(choose.dir())

# Importar tabela (xlsx) 
library(openxlsx)
tabela1=read.xlsx("DadosAula12.xlsx")

#_________________________________________________________________________
### Pegunta 1. A distância ao trabalho influencia no risco de contrair COVID?
# Descrever a formula da sua regressao
Form <- formula(COVID ~ DistanciaTrabalho)

# Regressão logistica
B1 <- glm(Form, family = binomial,data = tabela1)

# Resultados
summary(B1)

# Odds
exp(coef(B1))

# Figura
DadosEsperados <- data.frame(DistanciaTrabalho = seq(from = 0,to = 100, by = .5))
Previsto <- predict(B1, newdata = DadosEsperados, type = "response")
plot(x = tabela1$DistanciaTrabalho, y = tabela1$COVID)
lines(DadosEsperados$DistanciaTrabalho, Previsto)

#_________________________________________________________________________
### Pegunta 2. O risco de morte por COVID em pacientes internados é influenciado pela pratica de atividade física (previa) ?
# Descrever a formula da sua regressao
Form <- formula(AcidenteTransito ~ Sono)

# Regressão logistica
B1 <- glm(Form, family = binomial,data = tabela1)

# Resultados
summary(B1)

# Odds
exp(coef(B1))

# Figura
DadosEsperados <- data.frame(Sono = seq(from = 0,to = 10, by = .05))
Previsto <- predict(B1, newdata = DadosEsperados, type = "response")
plot(x = tabela1$Sono, y = tabela1$AcidenteTransito)
lines(DadosEsperados$Sono, Previsto)