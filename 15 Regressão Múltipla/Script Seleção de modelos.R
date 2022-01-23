# Seleção de modelos

# Por segurança: Limpar memoria do R
rm(list=ls())

# Definir diretorio 
setwd("D:/Nuvem/Dropbox/UNISA/2020 Estatistica aplicada a saude publica/15 Regressão Múltipla/Imagens para Slides")

# Importar tabela (xlsx) 

dados<-read.xlsx("Howell2012.xlsx")

names(dados)


#######################################
# Modelo 1 - Regressão linear simples #
#######################################
modelo1 <- lm(SAT ~ Expend, data=dados)
summary(modelo1)

#######################################
# Modelo 2 - Regressão linear multipla#
#######################################
modelo2 <- lm(SAT ~ Expend + LogPctSAT, data=dados)
summary(modelo2)


#######################################
# Modelo 3 - Regressão linear multipla#
#######################################
modelo3 <- lm(SAT ~ Expend + LogPctSAT + Salary, data=dados)
summary(modelo3)


#######################################
# Modelo 4 - modelo nulo
#######################################
modelo4 <- lm(SAT ~ 1, data=dados)
summary(modelo1)
plot(dados$SAT ~ 1, ylab="SAT", xlab="Expend")
abline(modelo4, col="red", lwd=2)

#### AIC
AIC(modelo1,modelo2,modelo3,modelo4)

#BIC
BIC(modelo1,modelo2,modelo3,modelo4)



# Stepwise model selection 
step(modelo3)

# Forward model selection 
ModeloVazio = lm(SAT~1,data=dados)
ModeloCompleto<- formula(SAT ~ Expend + LogPctSAT + Salary)

step(ModeloVazio, direction = "forward", scope=ModeloCompleto)
