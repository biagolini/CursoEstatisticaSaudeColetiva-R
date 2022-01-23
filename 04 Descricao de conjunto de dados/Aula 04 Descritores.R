# CURSO: ESTATÍSTICA PARA SAÚDE COLETIVA
# TUTORIAL: INTRODUÇÃO AO SOFTWARE R

# Limpar memoria do R
rm(list=ls())

# Definir diretorio 
setwd(choose.dir())

# Importar tabela (xlsx) com os dados 
library(openxlsx)
tabela1=read.xlsx("suatabela.xlsx")

# Gráfico
hist(tabela1$EDV) # Histograma

# Descrição de dados
mean(tabela1$EDV) # Media
median(tabela1$EDV) # Mediana
boxplot(tabela1$EDV) # Boxplot
min(tabela1$EDV) # Minimo
max(tabela1$EDV) # Maximo
sd(tabela1$EDV) # Desvio padrão