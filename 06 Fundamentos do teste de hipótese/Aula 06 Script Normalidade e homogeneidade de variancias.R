# CURSO: ESTATÍSTICA PARA SAÚDE COLETIVA
# TUTORIAL: Teste de Normalidade + Comparar variâncias

# Por segurança: Limpar memoria do R
rm(list=ls())

#___________________________________________________________________________________
#### Importar seu conjunto de dados para o R
## Opção 1: via Google Drive
LinkAcessoDrive<-"https://docs.google.com/spreadsheets/d/e/2PACX-1vS6YtVn0-KUqPD3OuhEl5Ckfa3ewnDjBufzI9QcnB3PPolK-Gqv7-u6YqaoIQAFJVfFr0ZqQJYT--4_/pub?gid=0&single=true&output=csv"; tabela1<-read.csv(url(LinkAcessoDrive), sep = ",",dec = "."); tabela1$Sexo<-as.factor(tabela1$Sexo)

## Opção 2: Importar tabela via documento salvo no seu computador
# Definir diretorio 
setwd(choose.dir())

# Importar tabela (xlsx) 
library(openxlsx)
tabela1=read.xlsx("Dados COVID Hospital Sirio-Libanes.xlsx")
tabela1$Sexo<-as.factor(tabela1$Sexo) # corrigir a coluna Sexo para que R entenda que é um fator

#___________________________________________________________________________________
#### Topico I. Avaliar Normalidade 
### Opção 1: Avaliação visual (opção que eu recomendo você fazer com seus dados)
## Exemplo de dados com distribuição aparentemente normal
hist(tabela1$HDL.Colesterol)

## Exemplo de dados com distribuição aparentemente não normal
hist(tabela1$Testosterona)


### Opção 2: Avaliação por teste de hipótese (Teste de shapiro).  Avaliar a normalidade por teste de hipotese é interessante porque torna a avaliação menos subjetiva. Mas tem o problema que se seu numero de amostras for grande, é mais provavel que o teste indique que sua distribuição não é normal. 
## Exemplos de dados com distribuição aparentemente normal (sabemos disso pelo histograma visto anteriormente)
shapiro.test(tabela1$HDL.Colesterol) 
# veja que se eu sortear só alguns numeros desse conjunto, o teste passará a indicar que os dados são normais
dados1<-tabela1$HDL.Colesterol[!is.na(tabela1$HDL.Colesterol)]
dados1<-sample(dados1, 40)
shapiro.test(dados1) 



## Exemplos de dados com distribuição aparentemente não normal
shapiro.test(tabela1$Testosterona)
# veja que se eu sortear só alguns numeros desse conjunto, o teste continua indicando que os dados não são normais
dados1<-tabela1$Testosterona[!is.na(tabela1$Testosterona)]
dados1<-sample(dados1, 40)
shapiro.test(dados1) 


#___________________________________________________________________________________
#### Topico II. Comparar variâncias
### Opção 1: Avaliação visual (opção que eu recomendo você fazer com seus dados)- boxplot

## Exemplo de dados divididos em dois grupos com aparentemente variâncias iguais
boxplot(tabela1$HDL.Colesterol~tabela1$Sexo, na.rm = T)
# Veja informações sobre média para cada um dos grupos
with(tabela1, tapply(HDL.Colesterol, Sexo, mean, na.rm = T))
# Veja informações sobre desvio para cada um dos grupos
with(tabela1, tapply(HDL.Colesterol, Sexo, sd, na.rm = T))


## Exemplo de dados divididos em dois grupos com aparentemente variâncias desiguais
boxplot(tabela1$Testosterona~tabela1$Sexo, na.rm = T)
# Veja informações sobre média para cada um dos grupos
with(tabela1, tapply(Testosterona, Sexo, mean, na.rm = T))
# Veja informações sobre desvio para cada um dos grupos
with(tabela1, tapply(Testosterona, Sexo, sd, na.rm = T))



### Opção 2: Avaliação por teste de hipótese. Avaliar por teste de hipotese é interessante porque torna a avaliação menos subjetiva. Mas tem o problema de que com muitos dados, a tendencia é sempre surgir evidencia de que a variância é desigual.
## Exemplo de dados divididos em dois grupos com aparentemente variâncias iguais(sabemos disso pelo boxplot visto anteriormente)
var.test(tabela1$HDL.Colesterol~tabela1$Sexo, na.rm = T)
# Veja que se eu sortear só alguns numeros desse conjunto, o teste passará a indicar que as variâncias são iguais
dados1<-subset(tabela1, !is.na(tabela1$HDL.Colesterol)) # corta a tabela apenas para as linhas que temos todos os dados
numeros_linhas<-sample(1:length(dados1[,1]), 40) # sorteia alguns numero para linhas aleatorias na tabela cortada
dados1<-dados1[numeros_linhas,] # atualiza o objeto que tem a tabela desejada só para as linhas sorteadas 
var.test(dados1$HDL.Colesterol~dados1$Sexo) # teste com um tamanho menor de amostras



## Exemplo de dados divididos em dois grupos com aparentemente variâncias desiguais
var.test(tabela1$Testosterona~tabela1$Sex, na.rm = T)
# Veja que se mesmo sorteando só alguns numeros desse conjunto, o teste continua a indicar que as variâncias são desiguais
dados1<-subset(tabela1, !is.na(tabela1$Testosterona)) # corta a tabela apenas para as linhas que temos todos os dados
numeros_linhas<-sample(1:length(dados1[,1]), 40) # sorteia alguns numero para linhas aleatorias na tabela cortada
dados1<-dados1[numeros_linhas,] # atualiza o objeto que tem a tabela desejada só para as linhas sorteadas 
var.test(dados1$Testosterona~dados1$Sexo) # teste com um tamanho menor de amostras