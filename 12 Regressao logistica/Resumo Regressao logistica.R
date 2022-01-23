# Resumo Regressao logistica
# NOTA: Como usar esse modelo de Script? Substitua respectivamente  VarResposta e VarPreditora para exatamente o mesmo nome titulo das colunas relacionadas a sua variávels resposta e variavel preditora na sua tabela do Excel.

## Defina sua pasta de trabalho (onde o R vai buscar sua planilha)
setwd(choose.dir())

# Importar seu conjunto de dados para o R
install.packages("openxlsx") # Você só precisa rodar essa linha se nunca instalou o pacote antes
library(openxlsx) # Comando para carregar o pacote
tabela1=read.xlsx("NOME DA SUA TABELA.xlsx")  # Comando para carregar sua tabela com os dados

# Descrever a formula da sua regressao
Form <- formula(VarResposta ~ VarPreditora)

# Desenvolva o modelo de regressão logistica
B1 <- glm(Form, family = binomial,data = tabela1)

# Observe os resultados
summary(B1)

# Odds
exp(coef(B1))