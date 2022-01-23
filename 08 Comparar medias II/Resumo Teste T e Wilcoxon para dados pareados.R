# Resumo Teste T e Teste Wilcoxon para amostras pareadas
# NOTA: Como usar esse modelo de Script? R. Substitua  Coluna1 e Coluna2 para o nome das colunas da sua tabela do Excel. Atenção: o R é sensivel a letras maiusculas e minusculas, tome cuidado para introduzir o nome da coluna exatamente como está na sua tabela do Excel.


## Defina sua pasta de trabalho (onde o R vai buscar sua planilha)
setwd(choose.dir())

## Importar tabela
install.packages("openxlsx") # Você só precisa rodar essa linha se nunca instalou o pacote antes
library(openxlsx) # Comando para carregar o pacote
tabela1=read.xlsx("NOME DA SUA TABELA.xlsx")  # Comando para carregar sua tabela com os dados

## Antes de você escolher a analise, você precisa avaliar normalidade da diferença entre as observações
diferenca = tabela1$Coluna1 - tabela1$Coluna2
hist(diferenca) 
boxplot(diferenca)

## A diferença parece ter distribuição normal?
# Se sim, aplicar o teste t para amostras pareadas
t.test(tabela1$Coluna1, tabela1$Coluna2, paired=T)

# Se não, aplicar o teste de Wilcoxon para amostras pareadas
wilcox.test(tabela1$Coluna1, tabela1$Coluna2, paired=T) 

# Interpretação
# p maior que 0.05 = não existe diferença entre as médias
# p menor que 0.05 = existe diferença entre as médias