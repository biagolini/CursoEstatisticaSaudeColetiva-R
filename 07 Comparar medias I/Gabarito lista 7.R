# Gabarito lista 7
setwd("D:/Nuvem/Dropbox/UNISA/2020 Estatistica aplicada a saude publica/07 Comparar medias I/Arquivos para passar para os alunos")

# Pergunta 5
boxplot(tabela1$Testosterona~tabela1$Sexo)
t.test(tabela1$Testosterona~tabela1$Sexo, var.equal = F) 

# Pergunta 6
boxplot(tabela1$AtividadePrevia~tabela1$Sexo)
wilcox.test(tabela1$AtividadePrevia~tabela1$Sexo)

# Observe as médias
with(tabela1, tapply(AtividadePrevia, Sexo, mean))
