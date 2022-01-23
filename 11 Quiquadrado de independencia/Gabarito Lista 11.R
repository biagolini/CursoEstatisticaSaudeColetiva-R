# Gabarito Lista 11
# Exerciceo 4
TabCont = table(tabela2$COVID,tabela2$Alcool) 
mosaicplot(TabCont, color=TRUE,las = 1, cex.axis=0.8,main =NULL)
chisq.test(TabCont)



# Exerciceo 5
TabCont = table(tabela2$COVID,tabela2$Profissao) 
mosaicplot(TabCont, color=TRUE,las = 1, cex.axis=0.8,main =NULL)
chisq.test(TabCont)

