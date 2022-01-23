# Gabarito lista 10

#### Ex 5
#### Mosaic plot(não é obrigatorio, mas te ajuda a visualizar as proporções esperadas e observadas) 
# Calcular frequencias esperadas e observadas
fEsp<- tabela1$NumeroFuncionarios/sum(tabela1$NumeroFuncionarios)
fObs<- tabela1$Familiares/sum(tabela1$Familiares)

# Criar tabela para fazer a figura
DadosGrafico<-rbind(fEsp,fObs)
rownames(DadosGrafico)<-c("Esperada", "Observada")
colnames(DadosGrafico)<-tabela1$Profissao

# Gerar a figura
mosaicplot(DadosGrafico,main="Proporção", color=c("blue", "yellow","red","green","pink"), ylab="Familiar da profissãao",las = 1) 


# TESTE DE CHI-QUADRADO
chisq.test(x = tabela1$Familiares, p = tabela1$NumeroFuncionarios , rescale.p = T) 


#### Ex 6
#### Mosaic plot(não é obrigatorio, mas te ajuda a visualizar as proporções esperadas e observadas) 
# Calcular frequencias esperadas e observadas
fEsp<- tabela2$ProporcaoIBGE
fObs<- tabela2$PraticaAtividade/sum(tabela2$PraticaAtividade)

# Criar tabela para fazer a figura
DadosGrafico<-rbind(fEsp,fObs)
rownames(DadosGrafico)<-c("Esperada", "Observada")
colnames(DadosGrafico)<-tabela2$EstadoCivil

# Gerar a figura
mosaicplot(DadosGrafico,main="Proporção", color=c("blue", "yellow","red","green","pink"), ylab="PraticaAtividade",las = 1) 


# TESTE DE CHI-QUADRADO
chisq.test(x = tabela2$PraticaAtividade , p = tabela2$ProporcaoIBGE, rescale.p = T)  















