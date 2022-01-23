# Resumo Teste de ANOVA
# NOTA: Como usar esse modelo de Script? R. Primeiro, substitua Variavel_estudada para exatamente o mesmo nome que você usou no titulo da coluna com os dados da varável numerica (na sua tabela do Excel). Em seguida, substitua Grupos para exatamente o mesmo nome que você usou no titulo da coluna com os dados da categorica (na sua tabela do Excel).

## Defina sua pasta de trabalho (onde o R vai buscar sua planilha)
setwd(choose.dir())

## Importar tabela
install.packages("openxlsx") # Você só precisa rodar essa linha se nunca instalou o pacote antes
library(openxlsx) # Comando para carregar o pacote
tabela1=read.xlsx("NOME DA SUA TABELA.xlsx")  # Comando para carregar sua tabela com os dados

## Antes de você escolher a analise, você precisa avaliar os pressuposto da ANVOA
hist(tabela1$Variavel_estudada) 
boxplot(tabela1$Variavel_estudada~tabela1$Grupos) 

# Executa a análise
modelo<-aov(tabela1$Variavel_estudada~tabela1$Grupos)

# Observa os resultados
summary(modelo)

# Interpretação
# p>0.05 = houve diferença em ao menos 1 grupo com os demais
# p<0.05 = todos os grupos tem a mesma média

# Pos-teste
TukeyHSD(modelo)

# OBS: Alguns autores defendem que a validacao do modelo deve ser feita com base nos residuos do modelo, nesse caso seria
hist(resid(modelo))
