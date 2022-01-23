# Resumo Regressao linear simples
# NOTA: Como usar esse modelo de Script? Substitua respectivamente  VarResposta e VarPreditora para exatamente o mesmo nome titulo das colunas relacionadas a sua variávels resposta e variavel preditora na sua tabela do Excel.

## Defina sua pasta de trabalho (onde o R vai buscar sua planilha)
setwd(choose.dir())

# Importar seu conjunto de dados para o R
install.packages("openxlsx") # Você só precisa rodar essa linha se nunca instalou o pacote antes
library(openxlsx) # Comando para carregar o pacote
tabela1=read.xlsx("NOME DA SUA TABELA.xlsx")  # Comando para carregar sua tabela com os dados

# Fazer o modelo
modelo<-lm(tabela1$VarResposta ~ tabela1$VarPreditora)

# Testar a significancia do modelo
summary(modelo)

# Veja gráfico de dispersão
plot(tabela1$VarResposta ~ tabela1$VarPreditora)
abline(modelo, col="red", lwd=2)

# Verificar  residuos
residuos <- resid(modelo)
valoresprevistos <- predict(modelo, type = "response")

op <- par(mfrow = c(2, 2), mar = c(5, 4, 2, 2))
# Fazer um gráfico de resíduos vs valores previstos para avaliar se: I) A relação é linear; II)Existe homocedasticidade (pontos estão igualmente distribuídos igualmente em toda a área do gráfico)

plot(residuos~valoresprevistos,xlab = "Valores previstos",ylab = "Residuos", main = "Residuos vs valores previstos", cex.main=.75) # Aqui vamos ver a homocedasticidade. Se  estiver tudo certo, você deve observar pontos uniformemente distirbuidos ao redor da linha que corta o eixo x em 0.  
abline(0,0, col="red", lty=2, lwd =2)

# Avaliar por histograma/boxplot se os resíduos tem distribuição normal
hist(residuos, xlab = "Residuos", main = "Histograma dos resíduos", cex.main=.75)
boxplot(residuos, xlab = "Residuos", main = "Boxplot dos resíduos", cex.main=.75)

# Resíduos vs. variável explanatória (para testar independência)
plot(residuos~tabela1$VarPreditora, main = "Resíduos vs. variável explanatória", xlab = "Valores observados da variável preditora",ylab = "Residuos", cex.main=.75)
abline(0,0, col="red", lty=2, lwd =2)