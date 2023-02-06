#### Pré requisitos ####

# Instalar TensorFlor e Keras
install.packages("keras", dependencies = T)
keras::install_keras()

# Instalar Torch para R
install.packages("torch")
library(torch)
torch::install_torch()

# Pacotes necessários
library(mlmRev)
library(effects)
library(MASS) # Para stepAIC

# Rodar base de dados
acidentes = read.csv("fatais.csv")
PIB = read.csv("pib2020.csv")
  
# Mesclar datasets
df = merge(acidentes, PIB, by="municipio")

# Checar estrutura dos dados
str(df)

# Os fatores estão sendo lidos como caracteres... Precisamos mudar isso
df[sapply(data, is.character)] = lapply(df[sapply(df, is.character)], 
                                       as.factor)
str(df) # Funcionou :D

# Primeiro passo: rodar uma regressão linear
mod0 = lm(municipio ~., data = df)
step_df=stepAIC(mod0)







