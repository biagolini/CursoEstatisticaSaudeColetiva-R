# Resumo Correlacoes
# NOTA: Como usar esse modelo de Script? Substitua Variavel1 e Variavel2 para exatamente o mesmo nome titulo das colunas da sua tabela.

## Defina sua pasta de trabalho (onde o R vai buscar sua planilha)
setwd(choose.dir())

## Importar tabela
install.packages("openxlsx") # Você só precisa rodar essa linha se nunca instalou o pacote antes
library(openxlsx) # Comando para carregar o pacote
tabela1=read.xlsx("NOME DA SUA TABELA.xlsx")  # Comando para carregar sua tabela com os dados

# As duas variáveis são quantitativas continuas?
# Se sim, avalie se as variáveis apresentam distribuição normal 
# Verificar pressuposto de normalidade
shapiro.test(tabela1$Variavel1) # p > 0.05 é indicativo de que a distribuição é normal
shapiro.test(tabela1$Variavel2)

# Inspição visual
boxplot(tabela1$Variavel1) 
boxplot(tabela1$Variavel2)

# Se as variáveis apresentaram distribuição normal, faça um teste de correlação de Pearson
cor.test(tabela1$Variavel1,tabela1$Variavel2)

# Se as variáveis não apresenta distribuição normal, faça um teste de correlação de Spearman
cor.test(tabela1$Variavel1,tabela1$Variavel, method="spearman")

# Se uma das variáveis é categorica ou há empates, faça um teste de correlação de Kendall
cor.test(tabela1$Variavel1,tabela1$Variavel, method="kendall")

# Interpretação
# p maior que 0.05 = H0 é verdadeira, portanto: não há correlação entre as variáveis
# p menor que 0.05 = H1 é verdadeira, portanto: há (SIM) correlação entre as variáveis