# Carregando pacotes ------------------------------------------------------

library(readr)

# Carregando os dados -----------------------------------------------------

base_de_dados <- read.csv2("dados/voos_de_janeiro.csv")

# Comparações lógicas ------------------------------------------------------

# Valores lógicos

class(TRUE)
class(FALSE)

# TRUE e FALSE são nomes reservados 

TRUE <- 1

x <- 1
y <- "a"

# Testes com resultado verdadeiro
x == 1
"a" == "a"
y == "a"

# Testes com resultado falso
x == 2
"a" == "b"

# Maior
x > 3
x > 0

# Maior ou igual
x > 1
x >= 1

# Menor
x < 3
x < 0

# Menor ou igual
x < 1
x <= 1

# Diferente
x != 1
x != 2

letra <- "a"

x %in% c(1, 2, 3)
letra %in% c("b", "c")

## Operadores lógicos também podem ser usados com vetores

numeros <- c(4, 8, 15, 16, 23, 42)

# vetor de lógicos que compara os elementos de "numeros", um por um, com o número 20
numeros < 20
# é igual a fazer
# c(4 < 20, 8 < 20, 15 < 20, 16 < 20, 23 < 20, 42 < 20)

# vetor de lógicos que compara os elementos de "numeros", um por um, com o número 23
numeros == 23

## Comparações lógicas serão a base dos filtros!

numeros <- c(4, 8, 15, 16, 23, 42)

# seleciona apenas o primeiro elemento do vetor "numeros"
numeros[c(TRUE, FALSE, FALSE, FALSE, FALSE, FALSE)]
numeros[c(FALSE, TRUE, FALSE, FALSE, FALSE, FALSE)]
numeros[c(TRUE, FALSE, FALSE, FALSE, FALSE, TRUE)]

numeros < 15

# seleciona apenas aqueles elementos do vetor "numeros" que forem iguais a 15
numeros[numeros < 15]

numeros < 15
# é igual a 
numeros[c(TRUE, TRUE, FALSE, FALSE, FALSE, FALSE)]

# Exercícios --------------------------------------------------------------

# 1. Escreva um código que devolva apenas os valores maiores
# ou iguais a 10 do vetor abaixo:

vetor <- c(4, 8, 10, 15, 16, 23, 42)

vetor >= 10
vetor[vetor >= 10]

# Operadores lógicos ----------

## & - E - Para ser verdadeiro, os dois lados 
# precisam resultar em TRUE

x <- 5
x >= 3 & x <= 7

x %in% c(3, 4, 5, 6, 7)

y <- 2
y >= 3 & y <= 7

## | - OU - Para ser verdadeiro, apenas um dos 
# lados precisa ser verdadeiro

x %in% c("sim", "não")
x == "sim" | x == "não"

x < 0 | x > 10

y <- 2
y >= 3 | y <= 7

y <- 1
y >= 3 | y == 0

## O mesmo acontece com vetores

x_vetor <- c(89, 36, 96, 10, 99, 39)
y_vetor <- c(1, 30, 15, 54, 34, 60)

x_vetor > 50 | y_vetor < 10
x_vetor <= 50 & y_vetor > 10

## ! - Negação - É o "contrário"

!TRUE

!FALSE


w <- 5

!w < 4
w >= 4

letters

letters != "a" & letters != "b" & letters != "c"



!letters %in% c("a", "b", "c")


!(w < 4)
w >= 4

!(x_vetor > 50 | y_vetor < 10)


x_vetor <- c(89, 36, 96, 10, 99, 39)
x_vetor[c(TRUE, FALSE, TRUE, TRUE, FALSE, TRUE)]
# Filtrando linhas do data.frame  com vetores lógicos --------------

base_de_dados$atraso_chegada
base_de_dados$atraso_chegada == 4  # Retorna um vetor de VERDADEIRO ou FALSO

# Podemos filtrar linhas baseadas no retorno do vetor com TRUE e FALSE,
# sendo que: o que for TRUE ficará na base, e o que for FALSE será removido.
base_voos_4m_atraso <- base_de_dados[base_de_dados$atraso_chegada == 4, ]

base_de_dados[base_de_dados$origem == "EWR", ]
base_de_dados[base_de_dados$origem == "EWR", "origem"]
base_de_dados[ , "origem"]
base_de_dados[base_de_dados$tempo_voo > 100,]

#  Podemos combinar!
base_de_dados[base_de_dados$origem == "EWR" | base_de_dados$tempo_voo > 100,]
base_de_dados[base_de_dados$origem == "EWR" & base_de_dados$tempo_voo > 100,]

# Exercícios --------------------------------------------------------------

# 1. Usando a base de voos, e considerando que as colunas "dia", "mes" e "ano"
# compõem a data de saída do voo, escreva um código que devolva apenas os voos 
# que saíram no dia 15/01/2013:

base_de_dados$dia == 15 & base_de_dados$mes == 1 & base_de_dados$ano == 2013

base_voos_15012013 <- base_de_dados[base_de_dados$dia == 15, ]
View(base_voos_15012013)

unique(base_de_dados$ano)
unique(base_de_dados$mes)
unique(base_de_dados$dia)

# 2. Usando a base de voos, escreva um código que devolva apenas os voos 
# que NÃO sairam do aeroporto JFK:

base_de_dados$origem != "JFK" 
!base_de_dados$origem == "JFK" 

base_voos_nao_JFK <- base_de_dados[base_de_dados$origem != "JFK", ]
View(base_voos_nao_JFK)

unique(base_voos_nao_JFK$origem)
unique(base_de_dados$origem)

# 3. Usando a base de voos, escreva um código que devolva apenas os voos 
# que sairam do aeroporto JFK, e foram para Atlanta ("ATL"), 
# e salve em um objeto chamado voos_jfk_atlanta:

base_de_dados$origem == "JFK" & base_de_dados$destino == "ATL"

voos_jfk_atlanta <- base_de_dados[base_de_dados$origem == "JFK" & base_de_dados$destino == "ATL", ]
View(voos_jfk_atlanta)

# 4. Usando a base de voos, escreva um código que devolva apenas os voos 
# que saíram nos dias 15/01/2013 ou 16/01/2013:

base_de_dados$dia == 15 | base_de_dados$dia == 16
base_de_dados$dia %in% c(15, 16)

base_de_dados[base_de_dados$dia %in% c(15, 16), ]

# filter -----------------

# Existe um outro jeito de fazer esse tipo de filtro

# vamos instalar um pacote novo!
# install.packages("dplyr")
library(dplyr)

# podemos escrever de uma forma que não repete o nome "base_de_dados"
base_de_dados[base_de_dados$tempo_voo > 100,]

filter(base_de_dados, tempo_voo > 100)
#filter(seu_data_frame, CONDICOES)

# outros exemplos:

#base_de_dados[base_de_dados$origem == "EWR",]
filter(base_de_dados, origem == "EWR")

#base_de_dados[base_de_dados$origem == "EWR" | base_de_dados$tempo_voo > 100,]
filter(base_de_dados, origem == "EWR" | tempo_voo > 100)

#base_de_dados[base_de_dados$origem == "EWR" & base_de_dados$tempo_voo > 100,]
filter(base_de_dados, origem == "EWR" & tempo_voo > 100)

# opcional: dentro do filter, podemos usar "," ao invés de "&"
# essa é uma comodidade ESPECÍFICA do filter
filter(base_de_dados, origem == "EWR", tempo_voo > 100)

# função do dplyr para ordenar a base
arrange(base_de_dados, tempo_voo)

# a gente vê essas funções em detalhe no R para Ciencia de Dados 1

# Exercícios --------------------------------------------------------------

avaliacao_do_cliente <- c(1, 3, 0, 10, 2, 5, 20)
estado_de_nascimento <- c("SP", "PB", "PB", "RJ", "MT", "MT", "PA")

avaliacoes <- data.frame(avaliacao_do_cliente, estado_de_nascimento)

# usando o data.frame "avaliacoes", escreva códigos que atendam os pontos abaixo.
# Se possível, escreva duas versões de cada código: uma com filter e outra usando
# subsetting (os colchetes [])

# 1. Filtre as avaliações superiores a 3.

# 2. Filtre as avaliações de SP ou MT.

# 3. Filtre as avaliações de PB ou MT com nota inferior a 4.