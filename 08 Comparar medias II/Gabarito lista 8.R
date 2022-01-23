# Gabarito lista 8
setwd("D:/Nuvem/Dropbox/UNISA/2020 Estatistica aplicada a saude publica/07 Comparar medias I/Arquivos para passar para os alunos")

# Pergunta 5
diferenca<-tabela1$GlicemiaA-tabela1$GlicemiaD
hist(diferenca) 
boxplot(diferenca)

# Aplicar o teste, para teste pareado informe na formula paired=T 
t.test(tabela1$GlicemiaA, tabela1$GlicemiaD, paired=T) 


# Pergunta 6
diferenca<-tabela1$SaturacaoA-tabela1$SaturacaoD
hist(diferenca) 
boxplot(diferenca)

# Aplicar o teste, para teste pareado informe na formula paired=T 
wilcox.test(tabela1$SaturacaoA, tabela1$SaturacaoD, paired=T) 

# Pergunta 7
setwd(choose.dir())

# Importar tabela
install.packages("openxlsx") 
library(openxlsx) 
tabela1=read.xlsx("Pergunta7.xlsx")  

# Avaliar normalidade e variâncias desiguais
diferenca = tabela1$AlturaH - tabela1$AlturaM
hist(diferenca) 
boxplot(diferenca)

# Aplicar o teste
wilcox.test(tabela1$AlturaH, tabela1$AlturaM, paired=T)
