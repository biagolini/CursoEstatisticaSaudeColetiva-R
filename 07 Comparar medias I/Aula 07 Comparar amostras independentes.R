# CURSO: ESTATÍSTICA PARA SAÚDE COLETIVA
# TUTORIAL: Comparar médias para amostras independentes

# Por segurança: Limpar memoria do R
rm(list=ls())

#_________________________________________________________________________
#### Importar seu conjunto de dados para o R
## Opção 1: via Google Drive
LinkAcessoDrive<-"https://docs.google.com/spreadsheets/d/e/2PACX-1vSCs8v24iihB5rt6nTymB9XzC09FntNgqeG9IwlBUQVctM13ysoAZqllo-m6nQ86Q/pub?gid=943653026&single=true&output=csv"; tabela1<-read.csv(url(LinkAcessoDrive), sep = ",",dec = "."); rm(LinkAcessoDrive); tabela1$Sexo<-as.factor(tabela1$Sexo)

## Opção 2: Importar tabela via documento salvo no seu computador
# Definir diretorio 
setwd(choose.dir())

# Importar tabela (xlsx) 
library(openxlsx)
tabela1=read.xlsx("Dados para aulas 7 e 8.xlsx")


#_________________________________________________________________________
# Pegunta 1. Existe diferença nas horas de sono entre de mulheres e homens?
# Pontos que você precisa saber
# 1. Amostras são pareadas ou independentes?
# 2. Dados tem distribuição normal?
# 3. As variâncias são iguais?

# 1. Amostras são pareadas ou independentes?
# Independentes

# 2. Dados tem distribuição normal?
hist(tabela1$Sono)
boxplot(tabela1$Sono~tabela1$Sexo)

# 3. As variâncias são iguais?
boxplot(tabela1$Sono~tabela1$Sexo)

# Aplicar o teste, obs: Variancias iguais: var.equal=T; Variancias diferentes: var.equal=F
t.test(tabela1$Sono~tabela1$Sexo, var.equal = T) 

#_________________________________________________________________________
# Pegunta 2. Existe diferença na altura de mulheres e homens?
# Pontos que você precisa saber
# 1. Amostras são pareadas ou independentes?
# 2. Dados tem distribuição normal?
# 3. As variâncias são iguais?

# 1. Amostras são pareadas ou independentes?
# Independentes

# 2. Dados tem distribuição normal?
hist(tabela1$Altura) # Essa figura engana, se aqui você olhar só isso você vai pensar que os dados não são normais
boxplot(tabela1$Altura~tabela1$Sexo) # Mas na pratica os dados são normais sim. Só que esse conjunto de dados tem medianas  e variancias diferentes 

# 3. As variâncias são iguais?
boxplot(tabela1$Altura~tabela1$Sexo) # Não

# Aplicar o teste, obs: Variancias iguais: var.equal=T; Variancias diferentes: var.equal=F 
t.test(tabela1$Altura~tabela1$Sexo, var.equal = F) 

# Por curiosidade, veja se se você definir que as variâncias são iguais (que está errado nese caso) valor de p calculado muda.
t.test(tabela1$Altura~tabela1$Sexo, var.equal = T)


#_________________________________________________________________________
# Pegunta 3. Existe diferença peso de mulheres e homens?
# Pontos que você precisa saber
# 1. Amostras são pareadas ou independentes?
# 2. Dados tem distribuição normal?
# 3. As variâncias são iguais?

# 1. Amostras são pareadas ou independentes?
# Independentes

# 2. Dados tem distribuição normal?
hist(tabela1$Peso)
boxplot(tabela1$Peso~tabela1$Sexo) # Como se você estivesse olhando a distribuição dos dados de cima

# 3. As variâncias são iguais?
# Não faz sentido avaliar isso se a variável não é normal 

# Aplicar o teste de Wilcoxon-Mann-Whitney:
wilcox.test(tabela1$Peso~tabela1$Sexo)

# Observe as médias
with(tabela1, tapply(Peso, Sexo, mean))