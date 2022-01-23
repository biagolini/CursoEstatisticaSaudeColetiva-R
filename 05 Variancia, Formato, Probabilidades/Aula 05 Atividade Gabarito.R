# CURSO: ESTATÍSTICA PARA SAÚDE COLETIVA
# TUTORIAL: Teste de Normalidade

# Limpar memoria do R
rm(list=ls())

# Definir diretorio 
setwd(choose.dir())

# Importar tabela (xlsx) com os dados 
library(openxlsx)
tabelaCOVID=read.xlsx("Dados COVID Hospital Sirio-Libanes.xlsx")

#### Estatística descritiva
summary(tabelaCOVID$B12)

### Intervalos de confiança
#  Intervalo de confiança de 95%
t.test(tabelaCOVID$B12) 
# Resultado: nesse exemplo o intervalo de confiança vai de 592.8263 até 663.7905
