# Resumo Quiquadrado de aderencia
# NOTA: Como usar esse modelo de Script? Primeiro substitua FrequenciaObservada para exatamente o mesmo nome que você usou no titulo da coluna com a contagem de dados que você observou no seu estudo (na sua tabela do Excel). Em seguida, substitua FrequenciaEsperada para exatamente o mesmo nome que você usou no titulo da coluna com os dados relacionados a sua espectativa previa da distribuição dos dados nas categorias estudadas (na sua tabela do Excel).

## Defina sua pasta de trabalho (onde o R vai buscar sua planilha)
setwd(choose.dir())

## Importar tabela
install.packages("openxlsx") # Você só precisa rodar essa linha se nunca instalou o pacote antes
library(openxlsx) # Comando para carregar o pacote
tabela1=read.xlsx("NOME DA SUA TABELA.xlsx")  # Comando para carregar sua tabela com os dados

# Teste de qui-quadrado de aderencia
chisq.test(x = tabela1$FrequenciaObservada , p = tabela1$FrequenciaEsperada , rescale.p = T)  

# Interpretação
# p>0.05 = As observações estão distribuidas nas classes de forma semelhante a distribuição esperada
# p<0.05 = As observações estão distribuidas nas classes de forma diferente da distribuição esperada