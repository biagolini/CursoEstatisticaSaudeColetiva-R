# Gabarito Lista 12

# Pergunta 5
# Descrever a formula da sua regressao
Form <- formula(Morte ~ AtividadePrevia)

# Desenvolva o modelo de regressão logistica
B1 <- glm(Form, family = binomial,data = tabela1)
# Observe os resultados
summary(B1)

# Voce pode fazer uma figura para plotar seu modelo pelo codigo a seguir.
DadosEsperados <- data.frame(AtividadePrevia = seq(from = 0,to = 10, by = .05))
Previsto <- predict(B1, newdata = DadosEsperados, type = "response")
plot(x = tabela1$AtividadePrevia, y = tabela1$Morte, ylab="Morreu?", xlab="Frequência de atividade previa")
lines(DadosEsperados$AtividadePrevia, Previsto, col="darkgreen", lwd =5)



# Pergunta 6
Form <- formula(ProcedimentoEstetico ~ HorasRedeSocial)

B1 <- glm(Form, family = binomial,data = tabela1)

summary(B1)

# Voce pode fazer uma figura para plotar seu modelo pelo codigo a seguir.
DadosEsperados <- data.frame(HorasRedeSocial = seq(from = 0,to = 50, by = .05))
Previsto <- predict(B1, newdata = DadosEsperados, type = "response")
plot(x = tabela1$HorasRedeSocial, y = tabela1$ProcedimentoEstetico, ylab="Realizou procedimento estético?", xlab="Horas de uso de rede social")
lines(DadosEsperados$HorasRedeSocial, Previsto, col="darkgreen", lwd =5)

