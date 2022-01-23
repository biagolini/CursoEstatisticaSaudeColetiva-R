# Gabarito Atividade aula 06

# Limpar memoria do R
rm(list=ls())

############################################### 
#############    Importar tabela   ############ 
############################################### 
### Opção 1: via Google Drive
LinkAcessoDrive<-"https://docs.google.com/spreadsheets/d/e/2PACX-1vS6YtVn0-KUqPD3OuhEl5Ckfa3ewnDjBufzI9QcnB3PPolK-Gqv7-u6YqaoIQAFJVfFr0ZqQJYT--4_/pub?output=csv"; tabela1<-read.csv(url(LinkAcessoDrive), sep = ",",dec = ".")



# Exemplos de dados com distribuição aparentemente normal
hist(tabela1$Albumina)

# Exemplos de dados com distribuição aparentemente não normal
hist(tabela1$B12)
