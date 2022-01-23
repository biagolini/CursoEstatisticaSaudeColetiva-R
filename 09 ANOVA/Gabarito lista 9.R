# gabarito lista 9

# importar tabela
LinkAcessoDrive<-"https://docs.google.com/spreadsheets/d/e/2PACX-1vTNICAmWcF6tGHRhXif7_8uG-dBLQza9zi9kCte3XFEbx9kv9m4nR0NG9YmbR45sHHp01CSvFRIyHl9/pub?output=csv"; tabela1<-read.csv(url(LinkAcessoDrive), sep = ",",dec = "."); rm(LinkAcessoDrive); tabela1$Sexo<-as.factor(tabela1$Sexo)


# Dados Normais
hist(tabela1$Plaquetas)
boxplot(tabela1$Plaquetas~tabela1$UF)  

# Executa a análise
modelo<-aov(tabela1$Hematocrito~tabela1$UF)

# Observa os resultados
summary(modelo)


# Não normal
hist(tabela1$Insulina)
boxplot(tabela1$Insulina~tabela1$UF)  

# Executa a análise
kruskal.test(tabela1$Insulina, tabela1$UF)
