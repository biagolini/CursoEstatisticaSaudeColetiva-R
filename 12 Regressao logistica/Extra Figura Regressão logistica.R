# CURSO: ESTATÍSTICA PARA SAÚDE COLETIVA
# TUTORIAL: Figura rebuscada para regressão logistica

# Por segurança: Limpar memoria do R
rm(list=ls())

# Carregar pacotes
library(ggplot2)
library(openxlsx)

# Importar seu conjunto de dados 
## Opção 1: via Google Drive
LinkAcessoDrive<-"https://docs.google.com/spreadsheets/d/e/2PACX-1vQ_g3TsHbdFUOKiYP8HSfX8CeK9XRSh_AaxUGFNbtjoy6kKC-isrrGSY5SGv21EkKdPCrA5qh2Y5eOa/pub?output=csv"; tabela1<-read.csv(url(LinkAcessoDrive), sep = ",",dec = "."); rm(LinkAcessoDrive)

## Opção 2: Importar tabela via documento salvo no seu computador
# Definir diretorio 
setwd(choose.dir())

# Importar tabela (xlsx) 
tabela1=read.xlsx("DadosAula12.xlsx")

# Figura
dados<-data.frame( DistanciaTrabalho= tabela1$DistanciaTrabalho,COVID=tabela1$COVID)

tiff("Fig Regressão logistica.tiff", height = 15, width = 20, units = 'cm', compression = "lzw", res = 300)
ggplot(dados, aes(DistanciaTrabalho,COVID))+
  geom_point(alpha=.25, colour="darkgreen",fill="darkgreen",shape=19,size=5)+
  geom_smooth(method = "glm",level=0.95, colour =  "red", method.args = list(family="binomial"))+
  theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank(),panel.background=element_blank(),axis.line=element_line(colour="black"),axis.title=element_text(colour="black",size=18),axis.text=element_text(colour="black",size=12))+labs(x="Distância até o trabalho ",y="COVID")
dev.off()