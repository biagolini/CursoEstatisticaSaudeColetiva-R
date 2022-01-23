# CURSO: ESTATÍSTICA PARA SAÚDE COLETIVA
# TUTORIAL: Tutorial para construção de graficos de barra com intervalo de confiança
install.packages("psych"); install.packages("ggplot2")
library(psych); library(ggplot2)


####### Grafico A - Grafico para comparar grupos com dados de 1 unica variavel
# Grafico de quantidade de testosterona dependendo do grupo de idade
# Importar tabela
TabelaDados<-subset(tabela1, tabela1$Sexo=="M")
str(TabelaDados)
TabelaDados$CategoriaIdade<-factor(TabelaDados$CategoriaIdade)
nomes_grupos<-levels(TabelaDados$CategoriaIdade)

cell1<- subset(TabelaDados, TabelaDados$CategoriaIdade==nomes_grupos[1])
cell2<- subset(TabelaDados, TabelaDados$CategoriaIdade==nomes_grupos[2])
cell3<- subset(TabelaDados, TabelaDados$CategoriaIdade==nomes_grupos[3])
cell4<- subset(TabelaDados, TabelaDados$CategoriaIdade==nomes_grupos[4])
cell5<- subset(TabelaDados, TabelaDados$CategoriaIdade==nomes_grupos[5])

a <- describe(cell1$Testosterona)
b <- describe(cell2$Testosterona)
c <- describe(cell3$Testosterona)
d <- describe(cell4$Testosterona)
e <- describe(cell5$Testosterona)

DadoParaGrafico <- data.frame(CategoriaIdade = nomes_grupos,
                              TestosteronaMedia = c(a$mean,b$mean,c$mean,d$mean,e$mean),
                              Erros = c(a$se,b$se,c$se,d$se,e$se))

# Opção 1 - Gráfico simples
SeuGrafico <- ggplot(data=DadoParaGrafico, aes(x = CategoriaIdade, y=TestosteronaMedia, color = CategoriaIdade))
SeuGrafico <- SeuGrafico + geom_errorbar(aes(ymin=TestosteronaMedia-1.96*Erros, ymax=TestosteronaMedia+1.96*Erros), width=.5,
                                         position=position_dodge(.9)) 
SeuGrafico

# Opção 2- Gráfico de barras
SeuGrafico <- ggplot(data=DadoParaGrafico, aes(x = CategoriaIdade, y=TestosteronaMedia))
SeuGrafico <- SeuGrafico + geom_bar(stat="identity", position = position_dodge()) +
  geom_errorbar(aes(ymin=TestosteronaMedia-1.96*Erros, ymax=TestosteronaMedia+1.96*Erros), width=.2,
                position=position_dodge(.9)) +
  labs(x="Grupo de idade", y = "Quantidade de testosterona")+   theme_minimal()
SeuGrafico

####### Grafico B - Grafico para comparar grupos partindo de dados de 2 variáveis
# Importar tabela
TabelaDados<-tabela1
TabelaDados$Covid19PCR<-factor(TabelaDados$Covid19PCR)
TabelaDados$Sexo<-factor(TabelaDados$Sexo)
str(TabelaDados)
CatCovid19PCR<-levels(TabelaDados$Covid19PCR)
CatSexo<-levels(TabelaDados$Sexo)



cell1<- subset(TabelaDados, TabelaDados$Covid19PCR==CatCovid19PCR[1]&TabelaDados$Sexo==CatSexo[1])
cell2<- subset(TabelaDados, TabelaDados$Covid19PCR==CatCovid19PCR[2]&TabelaDados$Sexo==CatSexo[1])    
cell3<- subset(TabelaDados, TabelaDados$Covid19PCR==CatCovid19PCR[1]&TabelaDados$Sexo==CatSexo[2])
cell4<- subset(TabelaDados, TabelaDados$Covid19PCR==CatCovid19PCR[2]&TabelaDados$Sexo==CatSexo[2]) 

               
a <- describe(cell1$Glicose)
b <- describe(cell2$Glicose)
c <- describe(cell3$Glicose)
d <- describe(cell4$Glicose)



DadoParaGrafico <- data.frame(Covid19PCR = c(CatCovid19PCR[1],CatCovid19PCR[2],CatCovid19PCR[1],CatCovid19PCR[2]),
                      Sexo = c(CatSexo[1],CatSexo[1],CatSexo[2],CatSexo[2]),
                      Media = c(a$mean,b$mean,c$mean,d$mean),
                      Erros = c(a$se,b$se,c$se,d$se))
                      

SeuGrafico <- ggplot(data=DadoParaGrafico, aes(x = Covid19PCR, y=Media, fill =Sexo ))
SeuGrafico <- SeuGrafico + geom_bar(stat="identity", position = position_dodge()) +
  geom_errorbar(aes(ymin=Media-1.96*Erros, ymax=Media+1.96*Erros), width=.65,
                position=position_dodge(.9)) +
  labs(x="Sexo", y = "Glicose ")+
  scale_fill_brewer(palette="Paired") + theme_minimal()
SeuGrafico
# Obs
# scale_fill_brewer(palette="Green") Define as cores das barras
# theme_minimal deixa o fundo branco
