# CURSO: ESTATÍSTICA PARA SAÚDE COLETIVA
# TUTORIAL: Extra de teste de Normalidade

# Limpar memoria do R
rm(list=ls())

#___________________________________________________________________________________
#### Importar seu conjunto de dados para o R
### Opção 1: via Google Drive
LinkAcessoDrive<-"https://docs.google.com/spreadsheets/d/e/2PACX-1vS6YtVn0-KUqPD3OuhEl5Ckfa3ewnDjBufzI9QcnB3PPolK-Gqv7-u6YqaoIQAFJVfFr0ZqQJYT--4_/pub?output=csv"; tabela1<-read.csv(url(LinkAcessoDrive), sep = ",",dec = ".")

### Opção 2: Importar tabela via documento salvo no seu computador
# Definir diretorio 
# setwd(choose.dir())
setwd("D:/Nuvem/Dropbox/UNISA/2020 Estatistica aplicada a saude publica/06 Fundamentos do teste de hipótese/Script aula")

# Importar tabela (xlsx) 
library(openxlsx)
tabela1=read.xlsx("Dados COVID Hospital Sirio-Libanes.xlsx")


#___________________________________________________________________________________
##### Observe como gradualmente a probabilidade de encontrar que sua distribuição não é normal aumenta conforme você aumenta o numero de dados
# O problema em relação aos testes é que quando o n é grande, existe uma chance muito grande de não ser normal
dados1<-tabela1$HDL.Colesterol[!is.na(tabela1$HDL.Colesterol)]
shapiro.test(sample(1:length(dados1),10))
shapiro.test(sample(1:length(dados1),20))
shapiro.test(sample(1:length(dados1),50))
shapiro.test(sample(1:length(dados1),75))
shapiro.test(sample(1:length(dados1),100))
shapiro.test(sample(1:length(dados1),200))

# Teste Kolmogorov-Smirnov. Esse teste é usado para comparar se dois conjuntos de dados tem uma distribuição semelhante. Portanto, você pode comparar a distribuição dos seus dados com umas ditribuição conhecida (ex. normal)

#___________________________________________________________________________________
##### Teste Kolmogorov-Smirnov
## HDL.Colesterol
# Conheça a variavel HDL.Colesterol
summary(tabela1$HDL.Colesterol) # média igual a 52
sd(tabela1$HDL.Colesterol, na.rm = T)# desvio igual a 14

# Aplicar teste Kolmogorov-Smirnov
dados.simulados <- rnorm(200, 52, 14 )
ks.test(tabela1$HDL.Colesterol, dados.simulados)

## Creatinina
# Conheça a variavel Creatinina
summary(tabela1$Creatinina) # média igual a 1.2
sd(tabela1$Creatinina, na.rm = T)# # desvio igual a 1
# Aplicar teste Kolmogorov-Smirnov
dados.simulados <- rnorm(200, 1.2 ,1)
ks.test(tabela1$HDL.Colesterol,tabela1$Creatinina)