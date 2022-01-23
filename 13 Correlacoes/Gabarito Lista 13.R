# Gabarito Lista 13

# Pergunta 6
# Person
cor.test(tabela1$NumeroFilhos,tabela1$Idade)
plot(tabela1$NumeroFilhos,tabela1$Idade)

# Kendall
cor.test(tabela1$NumeroFilhos,tabela1$Idade,method="kendall")
boxplot(tabela1$Idade~tabela1$NumeroFilhos)   


# Pergunta 7
cor.test(rank(c(tabela1$ClasseSocial)),tabela1$NumeroFilhos,method="kendall")


boxplot(tabela1$NumeroFilhos~tabela1$ClasseSocial,ylab="Numero de filhos",xlab="Classe social", las=1)    