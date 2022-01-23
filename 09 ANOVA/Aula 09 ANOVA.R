# CURSO: ESTATÍSTICA PARA SAÚDE COLETIVA
# TUTORIAL: ANOVA

# Por segurança: Limpar memoria do R
rm(list=ls())

#___________________________________________________________________________________
#### Importar seu conjunto de dados para o R
## Opção 1: via Google Drive
 LinkAcessoDrive<-"https://docs.google.com/spreadsheets/d/e/2PACX-1vTNICAmWcF6tGHRhXif7_8uG-dBLQza9zi9kCte3XFEbx9kv9m4nR0NG9YmbR45sHHp01CSvFRIyHl9/pub?output=csv"; tabela1<-read.csv(url(LinkAcessoDrive), sep = ",",dec = "."); rm(LinkAcessoDrive); tabela1$Sexo<-as.factor(tabela1$Sexo)

## Opção 2: Importar tabela via documento salvo no seu computador
# Definir diretorio 
setwd(choose.dir())

# Importar tabela (xlsx) 
library(openxlsx)
tabela1=read.xlsx("Dados Fleury.xlsx")
# Definir fatores (forçar com que o R entenda que algumas variaveis são categoricas)
tabela1$Sexo<-as.factor(tabela1$Sexo); tabela1$UF<-as.factor(tabela1$UF) ; tabela1$CategoriaIdade<-as.factor(tabela1$CategoriaIdade) 


#_________________________________________________________________________
### Pegunta 1. Existe diferença na quantidade Plaquetas em relação ao estado? (Ex. ANOVA de uma entrada)
# Avaliar pressupostos (normalidade, variancias iguais, outliers)
hist(tabela1$Plaquetas)
boxplot(tabela1$Plaquetas~tabela1$UF)  

# Executa a análise
modelo<-aov(tabela1$Plaquetas~tabela1$UF)

# Observa os resultados
summary(modelo)

# Interpretação
# p>0.05 = houve diferença em ao menos 1 grupo com os demais
# p<0.05 = todos os grupos tem a mesma média

# OBS: Alguns autores defendem que a validacao do modelo deve ser feita com base nos residuos do modelo, nesse caso seria
hist(resid(modelo))

#_________________________________________________________________________
###  Pegunta 2. Existe diferença na quantidade Plaquetas em relação a categoria de idade? (Ex. teste de Tukey)
# Avaliar pressupostos (normalidade, variancias iguais, outliers)
boxplot(tabela1$Plaquetas~tabela1$CategoriaIdade) # Para fins didaticos vamos assumir que está tudo bem

# Executa a análise
modelo<-aov(tabela1$Plaquetas~tabela1$CategoriaIdade)

# Observa os resultados
summary(modelo)

# Interpretação
# p>0.05 = houve diferença em ao menos 1 grupo com os demais
# p<0.05 = todos os grupos tem a mesma média

# Pos-teste
TukeyHSD(modelo)

# OBS: Alguns autores defendem que a validacao do modelo deve ser feita com base nos residuos do modelo, nesse caso seria
hist(resid(modelo))

#_________________________________________________________________________
###   Pegunta 3. Existe diferença na quantidade testosterona em relação a categoria de idade? (Ex. Teste não-parametrico)
# Nesse exemplo vamos usar apenas os dados de pacientes do sexo masculino, dado conhecida influencia do sexo na testosterona
# Avaliar pressupostos (normalidade, variancias iguais, outliers)
tabelaCortada<-subset(tabela1, tabela1$Sexo=="M")
hist(tabelaCortada$Testosterona)
boxplot(tabelaCortada$Testosterona~tabelaCortada$CategoriaIdade)

# Executa a análise
kruskal.test(Testosterona ~ CategoriaIdade, data = tabelaCortada)

# Pos teste
install.packages("rstatix")
library(rstatix)
dunn_test(Testosterona ~ CategoriaIdade, data = tabelaCortada, p.adjust.method = "bonferroni")

# Veja a mediana de testosterona nos grupos
with(tabelaCortada, tapply(Testosterona, CategoriaIdade, median))

#_________________________________________________________________________
# Pegunta 4. Existe diferença na glicose em relação a idade e registro de infecção por COVID? (Ex. ANOVA duas entradas)
# Avaliar normalidade e homogenidade de variâncias
hist(tabela1$Glicose)
boxplot(tabela1$Glicose~tabela1$CategoriaIdade:tabela1$Covid19PCR)  
# Para fins didaticos vamos assumir que está tudo bem

# Executa a análise
modelo<-aov(tabela1$Glicose~tabela1$CategoriaIdade+tabela1$Covid19PCR) 

# Observa os resultados
summary(modelo)

# Pós teste
TukeyHSD(modelo)

#_________________________________________________________________________
# Grafico de barras
# Veja a media de glicose nos grupos
with(tabela1, tapply(Glicose, CategoriaIdade, mean)) # Media
with(tabela1, tapply(Glicose, CategoriaIdade, sd)) # Desvio

# No Script extra você pode conferir como fazer um gráfico para apresentar esses dados