# CURSO: ESTATÍSTICA PARA SAÚDE COLETIVA
# TUTORIAL: Intervalo de confiança

# Limpar memoria do R
rm(list=ls())

### Importar tabela via Google Drive
LinkAcessoDrive<-"https://docs.google.com/spreadsheets/d/e/2PACX-1vS6YtVn0-KUqPD3OuhEl5Ckfa3ewnDjBufzI9QcnB3PPolK-Gqv7-u6YqaoIQAFJVfFr0ZqQJYT--4_/pub?output=csv"; tabela1<-read.csv(url(LinkAcessoDrive), sep = ",",dec = ".")

### Importar tabela via documento salvo no seu computador
# Definir diretorio 
setwd(choose.dir())

# Importar tabela (xlsx) com os dados 
library(openxlsx)
tabela1=read.xlsx("Dados Zinco-B12.xlsx")

#### Estatística descritiva
summary(tabela1$Zinco)

### Intervalos de confiança
#  Intervalo de confiança de 95%
t.test(x = tabela1$Zinco,  conf.level = 0.95) 
# Resultado: nesse exemplo o intervalo de confiança vai de  0.7317115 até 0.8392689

# Intervalo de confiança de 90%
t.test(x = tabela1$Zinco,  conf.level = 0.9) # para mudar o nível de confiança: especifique o valor desejado pelo parâmetro conf.level; OBS: 0.90 = 90% 
# Resultado: nesse exemplo o intervalo de confiança vai de 0.7406183  até 0.8303621

# Intervalo de confiança de 99%
t.test(x = tabela1$Zinco,  conf.level = 0.99)  # ppara mudar o nível de confiança: especifique o valor desejado pelo parâmetro conf.level; OBS: 0.99 = 99% 
# Resultado: nesse exemplo o intervalo de confiança vai de 0.7137929  até 0.8571874

### Como calcular os intervalos para homens e mulheres separadamente?
# Existem varias opções, a mais simples é:
# Criar um objeto para receber os dados de cada grupo
dados.homens<-subset(tabela1$Zinco, tabela1$Sexo=="M")
dados.mulheres<-subset(tabela1$Zinco, tabela1$Sexo=="F")

# Calcular os intervalos de confiança 
t.test(x = dados.homens,  conf.level = 0.95) 
t.test(x = dados.mulheres,  conf.level = 0.95) 


### Extra: Criar grafico de barras com intervalo de confiança para comparar intervalos entre grupos
## Grafico 1: Comparar Homens e Mulheres
dados<-matrix(NA,ncol=2,nrow=3)
colnames(dados)<- c("Homens","Mulheres")
rownames(dados)<-c("Media","Intervalo inferior","Intervalo superior")

# Preencher a matrix com dados
# Medias
dados[1,1]<-summary(dados.homens)[4]
dados[1,2]<-summary(dados.mulheres)[4]
# Intervalos
dados[2:3,1]<-t.test(x = dados.homens,  conf.level = 0.5)$conf.int
dados[2:3,2]<-t.test(x = dados.mulheres,  conf.level = 0.9)$conf.int

# Criar grafico de barra simples 
xs<-barplot(dados[1,],ylim=c(0,1), main="Media + intervalos de confiança")

# Introduzir as barras de intervalo de confiança 
arrows(xs,dados[2,],xs,dados[3,], code=3, angle=90, lwd =4) # Apresentando o intervalo de confiança

# Introduzir o tamanho da amostra
tamanho_amostra_homens<-sum(!is.na(dados.homens))
tamanho_amostra_mulheres<-sum(!is.na(dados.mulheres))
text(xs,dados[3,]+0.1, labels=paste("n=", c(tamanho_amostra_homens,tamanho_amostra_mulheres) ,sep='')) #Colocar sobre cada barra os valores de n  


## Grafico 2: Comparar intervalos com níveis de confiança diferentes 
# Criar uma matrix para receber os dados relacionados a esse grafico
dados<-matrix(NA,ncol=4,nrow=3)
colnames(dados)<- c("50%","90%","95%","99%")
rownames(dados)<-c("Media","Intervalo inferior","Intervalo superior")

# Preencher a matrix com dados
dados[1,]<-summary(tabela1$Zinco)[4]

dados[2:3,1]<-t.test(x = tabela1$Zinco,  conf.level = 0.5)$conf.int
dados[2:3,2]<-t.test(x = tabela1$Zinco,  conf.level = 0.9)$conf.int
dados[2:3,3]<-t.test(x = tabela1$Zinco,  conf.level = 0.95)$conf.int
dados[2:3,4]<-t.test(x = tabela1$Zinco,  conf.level = 0.99)$conf.int

# Criar grafico de barra simples 
xs<-barplot(dados[1,],ylim=c(0,1), main="Media + intervalos de confiança")

# Introduzir as barras de intervalo de confiança 
arrows(xs,dados[2,],xs,dados[3,], code=3, angle=90, lwd =4) # Apresentando o intervalo de confiança

# Introduzir o tamanho da amostra
tamanho_amostra<-sum(!is.na(tabela1$Zinco))
text(xs,dados[3,]+0.1, labels=paste("n=", tamanho_amostra,sep='')) #Colocar sobre cada barra os valores de n 
