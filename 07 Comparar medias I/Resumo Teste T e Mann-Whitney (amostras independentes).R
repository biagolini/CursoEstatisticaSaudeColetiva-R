# Resumo: Teste T e teste de Mann-Whitney para amostras independentes
# NOTA: Como usar esse modelo de Script? R. Primeiro, substitua Variavel_estudada para exatamente o mesmo nome que você usou no titulo da coluna com os dados da varável numerica (na sua tabela do Excel). Em seguida, substitua Grupos para exatamente o mesmo nome que você usou no titulo da coluna com os dados da categorica (na sua tabela do Excel).

## Defina sua pasta de trabalho (onde o R vai buscar sua planilha)
setwd(choose.dir())

## Importar tabela
install.packages("openxlsx") # Você só precisa rodar essa linha se nunca instalou o pacote antes
library(openxlsx) # Comando para carregar o pacote
tabela1=read.xlsx("NOME DA SUA TABELA.xlsx")  # Comando para carregar sua tabela com os dados

## Antes de você escolher a analise, você precisa saber
# 1. Dados tem distribuição normal?
# 2. As variâncias são iguais?

# Avaliação 1. Dados tem distribuição normal?
hist(tabela1$Variavel_estudada) 
boxplot(tabela1$Variavel_estudada~tabela1$Grupos) 

# Avaliação. As variâncias são iguais?
boxplot(tabela1$Variavel_estudada~tabela1$Grupos) 


## Executar o teste
# Se os dados tem distibuição normal e as variâncias são iguais, use o código:
t.test(tabela1$Variavel_estudada~tabela1$Grupos, var.equal = T)

# Se os dados tem distibuição normal e as variâncias são diferentes, use o código:
t.test(tabela1$Variavel_estudada~tabela1$Grupos, var.equal = F)

# Se os dados tem não tem distibuição normal, use o código:
wilcox.test(tabela1$Variavel_estudada~tabela1$Grupos)


# Interpretação
# p maior que 0.05 = não existe diferença entre as médias
# p menor que 0.05 = existe diferença entre as médias