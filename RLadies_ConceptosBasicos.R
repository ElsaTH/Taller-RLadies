                            ###############################
                            #         R-LADIES            #
                            #   TALLER DE INTRODUCCIÓN    #
                            ###############################

# En R podemos llamar a librerías con el comando library(paquete), así como instalar paquetes 
#                 install.packages("paquete", dependencies = c("Depends", "Suggests"))
 
                            # Instalar librerias
                            install.packages('readr')
                            library(readr)
                            
# Para solicitar información de un comando podemos utilizar 
#                 help(paquete)
                            
# Podemos introducir comentarios dentro del código anteponiendo un # al comentario sin que afecte la ejecución.                            
                            
# Ejecutar una sóla línea de código basta con posicionarte en dicha línea y se pulsa Run o Ctrl+Enter
# Si queremos ejecutar un trozo de código,o una operación se selecciona y se pulsa Run o Ctrl+Enter
# Limpiar o borrar la consola ctrl + l



# ¿CUAL ES LA PRIMERA LÍNEA DE CÓDIGO QUE ME ENSEÑARON?
print('Hello')  
print("Hello World")
# Si escribimos la función en mayúsculas que pasará?
PRINT('Hello')  # <-- 

# ASIGNAR UNA VARIABLE
# NombreObjeto <- ValorObjeto
# Formalmente, los nombres de las variables en R se designan como symbol. 
# Cuando realizamos una asignación de un objeto al nombre de una variable, estamos en realidad asignando el objeto a un symbol. 

#Por ejemplo, la instrucción:
x <- 1
# asigna el symbol "x" al objeto "1" en el entorno actual.


# TIPOS DE DATOS. Todos los incluiremos en unas variables
integer <- 12     # Número entero
numeric <- 2.5    # Siempre punto
character <- 'RLadies'  # Siempre entre comillas 
logical <- TRUE   # Siempre en mayúsculas

      # ENUMERAR Y BORRAR VARIABLES DE UN ENTORNO
      ls() #listar variables del entorno
      rm() #borrar la variable que indiquemos
      rm(list = ls()) #borrar todas las variables

      ## La funcion ls simplemente lista los objetos en memoria: solo se muestran los nombres de los mismos.
      ls()
      
      ## Redefinir una variable
      x <- integer
      y <- numeric
      # Es equivalelente si separamos las expresiones por punto y coma:
      x <- integer; y <- numeric
      
      ## Borrar una variable
      rm(integer, numeric)

      ## Borrar todas las variables de la consola
      rm(list = ls())

################################################################################

      
#******************************************************************************#      
#                     OPERACIONES ARITMÉTICAS                                  #
#******************************************************************************#     

      # La operaciones de suma, resta, multiplicación división, exponenciación,
      # división entera y módulo se realizan, respectivamente, mediante los símbolos 
      # +, -, *, /, ^, %/%, y %%. 

# Asignamos variables para realizar operaciones aritméticas
      a<-10
      b<-20
      c<-15

# Operaciones básicas sin variables:
2 * 5 

# Operaciones básicas con variables
a+b   #suma
a-b   #resta
a*b #multiplicación
a/b #división

# Jerarquía de operaciones
a+((b/c)*(c-a))*a 

# Equivalencia de sumar:
sum(3 * a, 2.5 * b, 3 * c)

# El módulo o residuo de una división se obtiene con el comando %%. 
a%%2

# Para truncar a enteros un número se utiliza el comando trunc()
trunc(14.98765)

# Calcular la media de los números del 20 al 60 
x<-seq(20,30)
x
mean(x)
# la suma de los números del 51 al 91.
sum(x)

# Para introducir datos boleanos, es decir, que tienen como salida verdadero o falso utilizamos los operadores <,>,==, >= o <=. 
# También es posible guardar un dato boleano mediante <- 

a == b  # ¿es igual a b?
a != b  # ¿es a distindo de b?
(a < 3) & (y < 5)  # ¿es a menor que 3 y b menor que 3?
(a < 1) | (y < 3)  # ¿es a menor que 1 o b menor que 3?

# Las llaves son usadas para evaluar una serie de expresiones (separadas por nuevas líneas o punto y comas) 
# y, nos devolverán el resultado de la última expresión:
{ a <- 10
  b <- 20
  c <- 30
  d <- 40
  a + b }

# Se puede agrupar un conjunto de expresiones en el cuerpo de una función:
f <- function() {
  l <- 3
  m <- 2
  l + m
}
# Obtener resultado de la función
f()

# Las condicionales en R utiliza el comando if(){} y else{}, se establece la condición entre parentesis () 
# y finalmente entre llaves {} se introduce lo que debe de realizarse si se cumple la condición. Por ejemplo, supongamos que a es igual a 10. 
# Si esto se cumple, entonces de imprime el texto a es igual a 10. Para este ejemplo utilizamos el operador == que se utiliza para preguntar si una variable es igual a otra, en este caso, si una variable es igual a un número:
a <- 10
if (a == 10){
  print("a es igual a 10")
}

# Hagamos ahora un ejemplo más complejo. 
# Supongamos que a = 10 y que b = 20 y definamos dos variables auxiliares h = 0 y g = 0. 
# Preguntemos ahora si a < 5 de ser verdad, entonces solicitamos que se realice la operación a * b y que el resultado se guarde en h. 
# De ser falsa la afirmación entonces queremos que se realice una resta a - b y que se guarde en g. Finalmente queremos que muestre en pantalla el valor final de h y g. 
# El código para este ejemplo es el siguiente:
a<-10
b<-20
h<-0
g<-0
if(a>5){
  h<-a*b
}else{
  g<-a-b
}
print(h)
print(g)

# En R se pueden utilizar tres tipos de ciclos(bucles o loops). Utilizamos el comando while(){} para que un ciclo se repita mientras se cumple una condición.
# Por ejemplo, realicemos un ciclo que permita repetir 3 veces la frase mi primer ciclo en R. El código para este ejemplo es como sigue:

i <- 1  #contador
while(i <= 3){
  print("mi primer ciclo en R")
  i = i +1
}

# Realicemos el mismo ejemplo con un ciclo for(){}
for(i in 1:3){
  print("mi primer ciclo en R")
}
print(i)

# Se pueden tambien agregar instrucciones posteriores en la misma linea de código utilizando ; se esta manera:
if(a > 5) h <- a*b else g <- a-b ; cat("el valor de h es:", h)

# Para imprimir texto en pantalla utilizamos el comando print("texto"), tambien se puede utilizar para mostrar el valor guardado en variables. 
# Podemos concatenar texto con variables con los comandos paste() o concatenar texto con varias variables u operaciones con el comando sprintf()y %s. Finalmente se puede utilizar cat("texto", variable, "texto", variable) para facilitar la impresión cuando hay muchas variables.
print(paste("el dato a vale:", a))
sprintf("la suma de a + b es %s,y la de a-b es %s",a+b, a-b)
cat("a es igual a:", a, "la suma de a + b es:", a+b)


#******************************************************************************#
#                           VECTORES                                           # 
#******************************************************************************#
# Pedir ayuda a R para crear un vector:
?vector

        # Crear vectores. La c() es de combinar
        # Realizar operaciones aritméticas con vectores
        # Seleccionar elementos en un vector


Vector <- c(1, 2, 3, 4)
Vector
c('A', 'B', 'C', 'D') # Error por no estar entre ''
# Si no se ponen las letras entre '' dará error:
c(a,b,c,d) # Sustituye las variables ya generadas

# crear un vector que contenga 10 valores enteros aleatorios entre -50 y +50
V<- sample(-50:50, 10)

# Encontrar posición en un vector
V[3]
V[c(2,4,6)]

# Podemos realizar operaciones aritméticas con los elementos de un vector 
# como restarle o sumarle un número a cada elemento, multiplicar 
#cada elemento por un número dado o elevar cada elemento a una cierta potencia:
V+5   # Suma
V-5   # Resta
V*2   # multiplicación
V^2   # potencia
V**2  # potencia

# Estas mismas operaciones pueden realizarse entre vectores, por ejemplo:
x<-c(1,2,3,4,5,6,7,8,9)
y<-c(3,4,5,6,7,8,9,10,11)
x+y

# valor máximo y mínimo de un vector dado.
min(V) # mínimo
max(V) # máximo

# Obtener los elementos únicos de una cadena dada y números únicos de vector.
#numeros únicos
unique(V)
# elementos únicos de una cadena
cadena <- c("a","b","c","h","a","b")
unique(cadena)

# Crear tres vectores a, b, c con 3 números enteros y combinarlos para formar una matriz de 3 × 3 
# donde cada columna representa un vector. 
a<-c(2,4,3)
b<-c(5,1,3)
c<-c(3,8,9)
m<-cbind(a,b,c)
print(m)

# calcular la suma, la media y el producto de un vector dado
z <- c(1,2,4,56,78,90)
sum(z)  # suma
mean(z) # media
median(z) # mediana
prod(z) # producto
range(z)

# Puede ocurrir que un vector contenga datos faltantes, para calcular algunas operaciones estadísticas en presencia de NA utilizamos na.rm = TRUE:
a<-c(1,NA,3,4,5,NA,7,8,1,2,3,4,5,6,7,8,9)
sum(is.na(a)) # número de NA es los datos

# Calcular la suma, la media y el producto de un vector, ignore elementos como NA o NaN.
sum(a, na.rm=TRUE)
mean(a, na.rm=TRUE)
prod(a, na.rm=TRUE)

# Ordenar un vector en orden ascendente y descendente.
sort(vector) # Ordena de menor a mayor
sort(vector, decreasing=TRUE) # ordena de mayor a menor

# Probar si un vector dado contiene un elemento específico.
is.element(2, vector)

# Acceder al último valor en un vector dado.
tail(vector, 1)

# Encontrar el segundo valor más alto en un vector dado.
vector <-sort(vector, decreasing=FALSE)[-2]
vector

# Encontrar el n- ésimo valor más alto en un vector dado
sort(vector, TRUE)[9]

# 16. Escriba un programa en R para convertir la (s) columna (s) de un marco de datos en un vector.
df1 <- c(1, 2, 3, 4, 5)
df2 <- c(6, 7, 8, 9, 10)

vector_df <- data.frame(df1=1:5, df2=6:10)
vector_df

# Invertir el orden de un vector dado.
rev(vector)

# Convertir dos columnas de un marco de datos en un vector con nombre.
vector_nombre = setNames(as.character(mi_df$entero), mi_df$factor)

# Cada Objeto es Miembro de una Clase
# Podemos encontrar la clase de un objeto mediante la función class(objeto):
VectorNumeric <- c(1, 2, 3, 4, 5)
VectorInteger <- c(1:5)
VectorNumeric
VectorInteger
class(VectorNumeric)
class(VectorInteger)


#******************************************************************************#
#                            MATRICES                                          # 
#******************************************************************************#
# Pedir ayuda a R para crear una matriz
?matrix

A <- matrix(c(1,2,3,4), nrow = 2, ncol = 2)
B <- matrix(c(10,11,12,13), nrow = 2, ncol = 2)
t(A) #Transpuesta

# Las operaciones operaciones elementales con matrices se realizan de la siguiente forma:
A*3  #Multiplicación Escalar
A+B  #Suma de matrices
A-B  #Resta de matrices
A%*%B  #Producto Matricial
solve(A) #Matriz Inversa

MatrizNumeric <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8), nrow = 4, ncol = 2)
MatrizInteger <- matrix(c(4:9), nrow=3, ncol=3)
print(MatrizNumeric)
print(MatrizInteger)

# Crear una matriz con tres columnas, tres filas y dos "tablas", tomando dos vectores como entrada para la matriz.
vector1 = c(1, 3, 5, 7)
vector2 = c(2, 4, 6, 8, 10)
matriz = array(c(vector1, vector2),dim = c(2,4,2))
matriz
dim(matriz)


#******************************************************************************#
#           LISTAS A PARTIR DE VECTORES Y MATRICES                             # 
#******************************************************************************#

# crear una lista de elementos usando vectores, matrices y funciones a. Imprime el contenido de la lista.
lista <- list(c(1, 2, 2, 5, 7, 12),  matrix(1:40, nrow=5, ncol=4),fib)
print(lista)

#  crear una lista de datos heterogéneos, que incluyen vectores de caracteres, numéricos y lógicos.
mi_vector <- 1:10
mi_matriz <- matrix(1:4, nrow = 2)
mi_df     <- data.frame("num" = 1:3, "let" = c("a", "b", "c"))
mi_lista <- list("un_vector" = mi_vector, "una_matriz" = mi_matriz, "un_df" = mi_df)
print(mi_lista)

# Crear una lista que contenga cadenas, números, vectores y valores lógicos.
data <- list("RLadies", "Codigo", "", c(2, 3, 4), 20.3,30.3,40.3)
data
# Fusionar dos listas dadas en una lista.
lista1 <- list(1,2,3,4,5)
lista2 <- list(4,5,6,7,8)
lista3 <- c(lista1,lista2)

# Crear una lista de marcos de datos y acceder a cada uno de esos marcos de datos de la lista.
mi_df <- data.frame(
  "entero" = 1:4, 
  "factor" = c("a", "b", "c", "d"), 
  "numero" = c(1.2, 3.4, 4.5, 5.6),
  "cadena" = as.character(c("a", "b", "c", "d"))
)

mi_df
# acceder a posiciones
mi_df[[1]]

# Contar el número de objetos en una lista dada.
length(data)

# Convertir un marco de datos dado en una lista por filas.
lista_df = split(mi_df, seq(nrow(mi_df)))

# Asignar NULL a un elemento de lista dado.
lista3[2]==NULL



# Ejemplo:
# Creamos vectores de título, puntuaciónn y si el título es posterior a 2005
titulo <- c('Shrek', 'Shrek 2', 'Shrek Tercero', 'Shrek: Felices por siempre')
puntuacion <- c(7.9, 7.2, 6.1, 6.3)
post_2005 <- c(FALSE, FALSE, TRUE, TRUE)

# Nos parece una puntuación baja y queremos sumar 2 a cada una de la puntuaciones
puntuacion + 2

# Podemos también dividir, restar, ...
puntuacion / 2

# Mi puntuación
puntuacion_cyn <- c(9, 7, 8, 7)
diferencia <- puntuacion_cyn - puntuacion
diferencia

# Longitud del vector 
length(puntuacion)

# Media
mean(puntuacion)

# Selección en función de la posición
titulo[3]
titulo[c(1,4)]

# Selección en función de una condición
puntuacion_baja <- puntuacion < 7
puntuacion_baja
titulo[puntuacion_baja]

# Bucle for:
puntuacion <- c(7.9, 7.2, 6.1, 6.3)
length(puntuacion)

for(i in 1: length(puntuacion)) {
  print(i)
  print(puntuacion[i])
  puntuacion[i] <- 10
  print(puntuacion)
}




################################################################################

#******************************************************************************#
#                               DATAFRAME                                      #
#******************************************************************************#

# Un data frame es un arreglo rectangular que permite almacenar distintos tipos de datos, tanto numéricos como de caracter.
# Una forma sencilla de hacerlo es a partir de vectores, por ejemplo:
Empleados = data.frame(Nombre=c("Lucía","Manolo","Hugo", "Elena","Teresa", "Alba"),
                       Categoria=c("Junior","Senior","Junior","Junior","Senior","Junior"),
                       Años=c(23,29,30,24,37,24))
print(Empleados)

# Obtener la estructura de un marco de datos dado.
str(Empleados)
# Muestren un resumen de los datos anteriores.
summary(Empleados)
summary(Empleados$Años)

# Para llamar una variable específica dentro del data.frame utilizamos el simbolo $ después del nombre del data.frame.
Empleados$Años

# Extraer las dos primeras filas de un marco de datos determinado.
# Para llamar una variable específica dentro del data.frame utilizamos el simbolo $ después del nombre del data.frame.
Empleados$Años[1:2]

# Extraer la 3ª y la 5ª filas con la 1ª y 3ª columnas de un marco de datos dado.
Empleados[c(3,5),c(1,3)]

# Agregar una nueva columna en un marco de datos dado.
# Para llamar una variable específica dentro del data.frame utilizamos el simbolo $ después del nombre del data.frame.
Empleados$Antigüedad <-c(1,4,5,3,8,2)
Empleados

# Finalmente, cuando se trabajan con bases de datos con muchas variables, puede llegar a ser complicado utilizar el simbolo $ anteponiendolo al nombre de la base para llamar variables. 
# En su lugar podemos utilizar el comando attach()
attach()


# Eliminar la (s) columna (s) por nombre de un marco de datos dado.
Empleados$Antigüedad2 <-c(1,4,5,3,8,2)
Empleados$Antigüedad3 <-c(1,4,5,3,8,2)
Empleados
# Eliminar filas por número de un marco de datos dado.
Empleados <- subset(Empleados, select = -c(5, 6))
Empleados

# Ordenar un marco de datos determinado por varias columnas.
Empleados <- Empleados[, order(c(names(Empleados)))]
Empleados
# Crear una unión (fusión) interna, externa, izquierda, derecha a partir de dos marcos de datos dados.
fusion = merge(df1, df1_ord)

# Reemplazar los valores NA con 3 en un marco de datos dado.
df1[is.na(df1)] = 3

# Cambiar el nombre de una columna de un marco de datos dado.
colnames(Empleados)[which(names(Empleados) == "Años")] = "Edad"
Empleados

# Seleccionar algunas filas aleatorias de un marco de datos dado.
Empleados[sample(nrow(Empleados), 1)]

# Reordenar un marco de datos determinado por nombre de columna.
Empleados <- Empleados[c("Nombre", "Edad", "Antigüedad","Categoria")]


################################################################################


# Exportar DF
# Podemos guardar los datos en formato .txt con el comando write.table. 
# Se debe especificar el nombre del archivo así como el tipo de separación de los datos 
# y si tiene o no encabezado entre otras definiciones, como sigue:
write.table(Empleados, file = "Empleados.txt", sep = ",", col.names = TRUE)
write.csv(Empleados, file = 'Empleados.csv')

# Para poder llamar una base de datos podemo utilizar read.table() si es en formato .txt. Podemos llamar un .csv con read.csv(). 
# Recordemos que para tener todas las especificaciones del comando basta con 
# teclear help("read.csv") para tener todas las funciones.
help("read.csv")

data<-read.table("Empleados.txt", header = TRUE, sep = ",")
print(data)
file.choose()



################################################################################


