    ###########################################################
    #                   R-LADIES                              #
    #     TALLER DE INTRODUCCIÓN VISUALIZACIÓN DE DATOS       #
    ###########################################################
       
                rm(list = ls()) #borrar todas las variables               
  
#             En R existen muchas posibilidades de hacer gráficos, 
#   podemos utilizar los gráficos nativos de R o utilizar librerías como ggplot2. 
                
                              

#******************************************************************************#      
#                     GRÁFICOS NATIVOS DE R                                    #
#******************************************************************************# 

# Creamos DataFrame
Nombre    <- c("Lucía","Manolo","Hugo", "Elena","Teresa", "Alba")                
Sexo      <- c("mujer", "hombre", "hombre", "mujer", "mujer", "mujer")
Categoria <- c("Becario","Senior","Junior","Junior","Senior","Junior")
Edad      <- c(23,29,30,24,37,24)
Antigüedad<-c(1,4,5,3,8,2)

Empleados <- data.frame(Nombre,Sexo, Categoria, Edad, Antigüedad)
Empleados

#***************************

# PLOT
#El gráfico de dispersión puede realizarse simplemente dando dos variables con la función plot(), por ejemplo:
plot(Empleados)
plot(Empleados$Edad)  #Función genérica para representar en el plano xy 

# Gráfico de líneas
plot(Edad,
     type = "l",
     main = "Título del gráfico", 
     adj = 0.75,                 # Colocación del título 0 (izquierda) y 1 (derecha)
     #line = 2.70,               # Coloca el título arriba valores superiores a 1,7 o abajo valores inferiores a 1,7
     ann = TRUE,                 # Eliminar las etiquetas de los ejes
     axes = TRUE,                # mostrar los ejes 
     # sub= "Subtitulo del Gráfico",
     xlab = "nombre de la variable x",
     ylab = "nombre de la variable y",
     cex.main = 2.5,             # Tamaño Título
     cex.sub = 2,                # Tamaño subtítulo
     cex.lab = 1.2,              # X-axis and Y-axis Tamaño eje
     cex.axis = 0.5,             # Axis labels size
     col = "#84b6f4",            # Color Línea
     col.main = "#b0c2f2",       # Color Título
     col.sub = "#b0c2f2",        # Color subtítulo
     col.lab = "#fcb7af",        # X and Y-axis Color ejes
     col.axis = "black",         # Color números eje
     fg = "gray")                # Color del borde)

plot(Antigüedad,Edad,
     type = "p",
     pch = "☺",
     bg = "red",   # Fill color
     col = "blue",
     cex = 3,      # Tamaño al símbolo
     main = "Título del gráfico", 
     sub= "Subtitulo del Gráfico",
     xlab = "nombre de la variable x",
     ylab = "nombre de la variable y")



# Generamos datos de ejemplo donde simulamos dos variables normales aleatorias llamadas x e y
x <- rnorm(500)
y <- x + rnorm(500)

mi_ts <- ts(matrix(rnorm(500), nrow = 500, ncol = 1),
            start = c(1950, 1), frequency = 12)

mis_fechas <- seq(as.Date("2005/1/1"), by = "month", length = 50)

mi_factor <- factor(mtcars$cyl)

fun <- function(x) x^2

# Diagrama de dispersión
plot(x, y, main = "Gráfico de dispersión")

# Gráfico de barras
plot(mi_factor, main = "Diagrama de barras")

# Diagrama de cajas
plot(mi_factor, rnorm(32), main = "Diagrama de cajas y bigotes")

# Gráfico de una serie temporal
plot(mi_ts, main = "Serie temporal")

# Time-based plot
plot(mis_fechas, rnorm(50), main = "Gráfico basado en fechas")

# Dibujar una función
plot(fun, 0, 10, main = "Trazar una función")

# Gráfico de correlación
plot(trees[, 1:3], main = "Matriz de correlación")

#***************************

# HISTOGRAMA
hist(Empleados$Edad) # Histogramas.
hist(Edad,
     col = "pink",
     main = "Empleados", 
     sub= "Histograma",
     xlab = "Edad",
     ylab = "Número Empleados")


# Gráfico de barras
barplot(Empleados$Edad) #Diagramas de barras.
barplot(table(Sexo),
        col=c("green","purple"),
        main = "Título del gráfico", 
        sub= "Subtitulo del Gráfico",
        xlab = "nombre de la variable x",
        ylab = "nombre de la variable y",
        horiz = FALSE)

# Gráfico de tarta
pie(table(Categoria),
    main = "Título del gráfico", 
    sub= "Subtitulo del Gráfico",
    xlab = "nombre de la variable x",
    ylab = "nombre de la variable y")


# Para realizar un el gráfico de cajas, enfrentamos una variable categórica 
# contra una variable continua, es por eso que se expresa como un modelo, 
# es decir, utilizamos el simbolo ~.

#Gráfico de Cajas
boxplot(Edad~Sexo,
        col=c("green","purple"),
        main = "Título del gráfico", 
        sub= "Subtitulo del Gráfico",
        xlab = "nombre de la variable x",
        ylab = "nombre de la variable y")



#******************************************************************************#      
#                     GGPLOT                                                   #
#******************************************************************************# 

# Para crear gráficos esta vez lo haremos mediante un csv
# Consta de datos que proporcionan la lista y la duración de cada canción de los Beatles.


#Cargamos los paquetes que nos hacen falta 
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("readr")

# Instalamos librería 
library(readr)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(ggrepel)



# Obtener la ruta del archivo
file.choose()

# Importar datos de un csv
Beatles <- read_csv("/Users/elsa/Desktop/TallerRLadies/TheBeatlesSongs dataset.csv")

# mirar datos
head(Beatles)


##  El primer gráfico

# Se pretende ver cómo cambia la duración de las canciones de los Beatles con el tiempo, 
# Se construye un diagrama de dispersión del año y la duración. 
# ¿Cómo guardar un archivo gráfico?: la variable p contiene el objeto gráfico 
# y la función ggsave lo guardará como un archivo png. 
# Se puede ajustar la altura y el ancho del archivo guardado en la función.

(p <- ggplot(Beatles, aes(Year, Duration)) +
    geom_point())
ggsave("Beatles.png", p,
       width = 5, height = 3, units = "in")



#   Hay una trama excesiva, por lo que es difícil ver la duración de cada canción.
#   Este gráfico tiene poca documentación: no está claro qué significa "Longitud", 
#     se desconoce la unidad de medida y un título estaría bien.


##  El segundo gráfico

# Se soluciona el problema de sobretrazado agitando los puntos. 
# Mientras hago esto, ilustre usando un color y una forma de punto de trazado diferente.

ggplot(Beatles, aes(Year, Duration)) +
  geom_jitter(width = 0.2, color = "blue", shape = 8)

##  El tercer gráfico
# El problema de sobretrazado se corrige en el nuevo gráfico.

# En los primeros días de los Beatles las canciones eran más cortas, 
# en los últimos años la duración de las canciones era más variable. 

# Por ello se etiquetan los dos períodos: 
# 1962-1966 fueron los "años de gira" donde los Beatles tocaron en vivo, y 1967  
# más tarde fueron los años de estudio donde los Beatles sólo actuaron en el estudio de grabación.

# Algunas canciones inusualmente largas; 
# sería bueno etiquetar estos puntos con los títulos de las canciones.

# El siguiente gráfico muestra los dos períodos de los Beatles y etiqueta tres interesantes canciones largas.

ggplot(Beatles, aes(Year, Duration)) +
  geom_jitter(width = 0.2, color = "#AED581", shape = 8) +
  geom_label(data = filter(Beatles, Duration > 400),
             aes(label = Title)) +
  geom_vline(xintercept = 1966.5, color="#F1C40F") +
  annotate(geom = "text", x = 1964, y = 400,
           label = "Años de gira",
           color = "#F06292", size = 7) +
  annotate(geom = "text", x = 1969, y = 350,
           label = "Años en estudio",
           color = "#F06292", size = 7)

##  El cuarto gráfico

# Se agrega una etiqueta más descriptiva al eje y.
# Se agrega un título de trama (al usar la función de tema, cambio el tamaño y la justificación del título)

ggplot(Beatles, aes(Year, Duration)) +
  geom_jitter(width = 0.2, color = "#AED581", shape = 8) +
  geom_label_repel(data = 
                     filter(Beatles, Duration > 400),
                   aes(label = Title)) +
  geom_vline(xintercept = 1966.5, color="#F1C40F") +
  annotate(geom = "text", x = 1963, y = 350,
           label = "Años de gira",
           color = "#F06292", size = 5) +
  annotate(geom = "text", x = 1971, y = 350,
           label = "Años en estudio",
           color = "#F06292", size = 5) +
  ylab("Duración canción (segundos)") +
  ggtitle("Duración de las canciones de los Beatles de 1962 a 1970") +
  theme(plot.title = element_text(colour = "#00ACC1", 
                                  size = 14, 
                                  hjust = 0.5))

