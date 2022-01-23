# CURSO: ESTATÍSTICA PARA SAÚDE COLETIVA
# TUTORIAL: Regressao linear simples

# Por segurança: Limpar memoria do R
rm(list=ls())

#___________________________________________________________________________________
#### Importar seu conjunto de dados para o R
## Opção 1: via Google Drive
LinkAcessoDrive<-"https://docs.google.com/spreadsheets/d/e/2PACX-1vRgOxi1wKclt9M3egcOnrArCngx5JTnotb8P00Zr7Fj4aYnMsd-TxSjk3egBY-RMof-os3OTN1AoE4j/pub?gid=0&single=true&output=csv"; tabela1<-read.csv(url(LinkAcessoDrive), sep = ",",dec = "."); rm(LinkAcessoDrive)

## Opção 2: Importar tabela via documento salvo no seu computador
# Definir diretorio 
setwd(choose.dir())

# Importar tabela (xlsx) 
library(openxlsx)
tabela1=read.xlsx("DadosAula14.xlsx")

#_________________________________________________________________________
### Pegunta 1. A pressão sanguínea diastólica pode ser prevista pelo tempo em repouso, após a pratica de atividade física? 
# Fazer o modelo
modelo<-lm(tabela1$Pressao~tabela1$Repouso)
# Testar a significancia do modelo
summary(modelo)
# Veja gráfico de dispersão
plot(tabela1$Pressao~tabela1$Repouso, xlab="Tempo em repouso após atividade fisica",ylab="Pressão diastólica")

#_________________________________________________________________________
### Pegunta 2 A pressão sanguínea diastólica pode ser prevista quantidade de sódio consumida na ultima hora? 
# Fazer o modelo
modelo<-lm(tabela1$Pressao~tabela1$Sodio)
# Testar a significancia do modelo
summary(modelo)

# Veja gráfico de dispersão
plot(tabela1$Pressao~tabela1$Sodio, xlab="Quantidade de sódio consumido (g)",ylab="Pressão diastólica")
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
plot(residuos~tabela1$Sodio, main = "Resíduos vs. variável explanatória", xlab = "Valores observados de sódio",ylab = "Residuos", cex.main=.75)
abline(0,0, col="red", lty=2, lwd =2)

# Voltar a area de plotar imagem para apenas 1 imagem por vez
par(mfrow = c(1, 1))