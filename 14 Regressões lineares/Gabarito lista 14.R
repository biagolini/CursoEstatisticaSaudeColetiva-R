
#_________________________________________________________________________
### Pegunta 6 

# peso do bebe ~ duração da gestação
# Fazer o modelo
modelo<-lm(tabela1$PesoBebe~tabela1$DuracaoGestacao)
# Testar a significancia do modelo
summary(modelo)

# Veja gráfico de dispersão
par(mfrow = c(1, 1))
plot(tabela1$PesoBebe~tabela1$DuracaoGestacao, xlab="Duração da gestação (em dias)",ylab="Peso do bebê")
#abline(modelo, col="red", lwd=2)


#_________________________________________________________________________
### Pegunta 7 

# peso do bebe ~ altura da mãe
# Fazer o modelo
modelo<-lm(tabela1$PesoBebe~tabela1$AlturaMae)
# Testar a significancia do modelo
summary(modelo)

# Veja gráfico de dispersão
par(mfrow = c(1, 1))
plot(tabela1$PesoBebe~tabela1$AlturaMae, xlab="Altura da mãe (cm)",ylab="Peso do bebê")
abline(modelo, col="red", lwd=2)


### Verificar modelo
# Verificar  residuos
residuos <- resid(modelo)
valoresprevistos <- predict(modelo, type = "response")


par(mfrow = c(1, 3))
# Fazer um gráfico de resíduos vs valores previstos para avaliar se: I) A relação é linear; II)Existe homocedasticidade (pontos estão igualmente distribuídos igualmente em toda a área do gráfico)

plot(residuos~valoresprevistos,xlab = "Valores previstos",ylab = "Residuos", main = "Residuos vs valores previstos", cex.main=.75) # Aqui vamos ver a homocedasticidade. Se  estiver tudo certo, você deve observar pontos uniformemente distirbuidos ao redor da linha que corta o eixo x em 0.  
abline(0,0, col="red", lty=2, lwd =2)

# Avaliar por histograma/boxplot se os resíduos tem distribuição normal
boxplot(residuos, xlab = "Residuos", main = "Boxplot dos resíduos", cex.main=.75)

# Resíduos vs. variável explanatória (para testar independência)
plot(residuos~tabela1$Sodio, main = "Resíduos vs. variável explanatória", xlab = "Valores observados de sódio",ylab = "Residuos", cex.main=.75)
abline(0,0, col="red", lty=2, lwd =2)

# Voltar a area de plotar imagem para apenas 1 imagem por vez
par(mfrow = c(1, 1))