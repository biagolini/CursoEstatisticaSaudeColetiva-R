# Resumo Quiquadrado de independencia
# NOTA: Como usar esse modelo de Script? Substitua Variavel1 e Variavel2 para exatamente o mesmo nome titulo das colunas da sua tabela.

## Defina sua pasta de trabalho (onde o R vai buscar sua planilha)
setwd(choose.dir())

## Importar tabela
install.packages("openxlsx") # Você só precisa rodar essa linha se nunca instalou o pacote antes
library(openxlsx) # Comando para carregar o pacote
tabela1=read.xlsx("NOME DA SUA TABELA.xlsx")  # Comando para carregar sua tabela com os dados

# Criar tabela de contingencia
TabCont = table(tabela1$Variavel1,tabela1$Variavel2) 

##  Pré-teste, confira o pré-requisito de que o numero esperado de observações para todos as células é maior que 5 
modelo<-chisq.test(TabCont)
modelo$expected

## Resultado do teste de chi-quadrado de independencia
modelo

# Interpretação
# p maior que 0.05 = H0 é verdadeira, portanto: não há associação entre as variáveis estudadas
# p menor que 0.05 = H1 é verdadeira, portanto: há (SIM) associação entre as variáveis estudadas