# CURSO: ESTATÍSTICA PARA SAÚDE COLETIVA
# TUTORIAL: Comparar médias para amostras independentes

# Por segurança: Limpar memoria do R
rm(list=ls())

#_________________________________________________________________________
#### Importar seu conjunto de dados para o R
## Opção 1: via Google Drive
LinkAcessoDrive<-"https://docs.google.com/spreadsheets/d/e/2PACX-1vSCs8v24iihB5rt6nTymB9XzC09FntNgqeG9IwlBUQVctM13ysoAZqllo-m6nQ86Q/pub?gid=943653026&single=true&output=csv"; tabela1<-read.csv(url(LinkAcessoDrive), sep = ",",dec = ".");rm(LinkAcessoDrive); tabela1$Sexo<-as.factor(tabela1$Sexo)


## Opção 2: Importar tabela via documento salvo no seu computador
# Definir diretorio 
setwd(choose.dir())

# Importar tabela (xlsx) 
install.packages("openxlsx")
library(openxlsx)
tabela1=read.xlsx("Dados para aulas 7 e 8.xlsx")

#_________________________________________________________________________
# Pegunta 1. Existe diferença na quantidade de vitamina B12 antes e depois de um experimento?
# Pontos que você precisa saber
# 1. Amostras são pareadas ou independentes?
# 2. As diferenças tem distribuição normal?

# 1. Amostras são pareadas ou independentes?
# Dependentes

# 2.  As diferenças tem distribuição normal?
diferenca<-tabela1$B12A-tabela1$B12D
hist(diferenca) 
boxplot(diferenca)


# Aplicar o teste, para teste pareado informe na formula paired=T 
t.test(tabela1$B12A, tabela1$B12D, paired=T) 

# Nota: teste unicaudal
t.test(tabela1$B12A, tabela1$B12D, paired=T, alternative ="greater") # A é maior que B?
t.test(tabela1$B12A, tabela1$B12D, paired=T, alternative ="less")    # A é menor que B?

#_________________________________________________________________________
# Pegunta 2. Existe diferença na quantidade de vitamina B6 antes e depois de um experimento?
# Pontos que você precisa saber
# 1. Amostras são pareadas ou independentes?
# 2. As diferenças tem distribuição normal?

# 1. Amostras são pareadas ou independentes?
# Dependentes

# 2.  As diferenças tem distribuição normal?
diferenca<-tabela1$B6A-tabela1$B6D
hist(diferenca) 
boxplot(diferenca)


# Aplicar o teste, para teste pareado informe na formula paired=T 
wilcox.test(tabela1$B6A,tabela1$B6D, paired = T)
