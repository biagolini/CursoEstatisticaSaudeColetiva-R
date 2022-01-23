# ANOVA de medidas repetidas
# NOTA: esse Script foi baseado no tutorial recomendado pelo pacote rstatix, ao acessar ?anova_test

# Link para tutorial original:  https://www.datanovia.com/en/lessons/repeated-measures-anova-in-r/
install.packages("ggpubr"); install.packages("rstatix")
library(ggpubr) ; library(rstatix)


# Preparar conjunto de dados
# Definir diretorio de trabalho
setwd(choose.dir())

# Importar tabela (xlsx) 
library(openxlsx)
tabela2=read.xlsx("Dados ANOVA blocos.xlsx") 

# Preparar tabela: Agrupar os dados em 1 coluna
tabela2 <- tabela2 %>%
  gather(key = "Profissao", value = "Estresse", Enfermeira, Medica, Nutricionista, Psicologa) %>%
  convert_as_factor(IdHospital, Profissao)
head(tabela2, 3)


# Estatística descritiva
tabela2 %>%
  group_by(Profissao) %>%
  get_summary_stats(Estresse, type = "mean_sd")

# Observe dados
bxp <- ggboxplot(tabela2, x = "Profissao", y = "Estresse", add = "point")
bxp

## Checar pressupostos 
# Outliers
tabela2 %>%
  group_by(Profissao) %>%
  identify_outliers(Estresse)

# Normalidade
tabela2 %>%
  group_by(Profissao) %>%
  shapiro_test(Estresse)

# qqplot
ggqqplot(tabela2, "Estresse", facet.by = "Profissao")

# Calcular ANOVA de medidas repetidas
res.aov <- anova_test(data = tabela2, dv = Estresse, wid = IdHospital, within = Profissao)
get_anova_table(res.aov)



# Pos teste
# pairwise comparisons
pwc <- tabela2 %>%
  pairwise_t_test(
    Estresse ~ Profissao, paired = TRUE,
    p.adjust.method = "bonferroni"
  )
pwc

# Imagem para reportar dado
pwc <- pwc %>% add_xy_position(x = "Profissao")
bxp + 
  stat_pvalue_manual(pwc) +
  labs(
    subtitle = get_test_label(res.aov, detailed = TRUE),
    caption = get_pwc_label(pwc)
  )


#_________________________________________________________________________
# Caso seus dados não respeitem os pressupostos da ANOVA realize o Teste de Fredman
tabela2=read.xlsx("Dados ANOVA blocos.xlsx") # achar outra variavel pra fazer isso
boxplot(tabela2$Estresse~tabela2$Profissao) 

# Preparar tabela: Agrupar os dados em 1 coluna
tabela2 <- tabela2 %>%
  gather(key = "Profissao", value = "Estresse", Enfermeira, Medica, Nutricionista, Psicologa) %>%
  convert_as_factor(IdHospital, Profissao)
head(tabela2, 3)

tabela2$Profissao<-factor(tabela2$Profissao)
tabela2$IdHospital<-factor(tabela2$IdHospital)

friedman.test(y=tabela2$Estresse, groups=tabela2$Profissao, blocks=tabela2$IdHospital)