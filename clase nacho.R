#clase del 25 de agosto

#crear vectores con la funcion vector
x<-vector(mode = "numeric", leght=5L)
x

#crear vectores con la funcion c
x<-c(0.5,0.6)
x
class(x)

x<-c(TRUE, FALSE, T, F)
x
class(x)

x<-10:0
x
class(x)

x<-c(1+2i,5,3+9i,-4-5i)
x
class(x)

x<-c("a","b","c","d")
x
class(x)

#mezcla de objetos en un vector
y<-c(1.7,"a") #caracter
y
class(y)

y<-c(TRUE,2) #numeric
y
class(y)

y<-c("a",TRUE) #Caracter
y
class(y)

y<-c(TRUE,10L,8.5,1+i,"algo")
y
class(y)

#orden de coaccion/coerecion explicita
#1 character
#2 complex
#3 numeric
#4 integer
#5 logical

#coercion explicita
z<-0:6
z
class(z)
as.numeric(z)
as.logical(z)
as.character(z)

z<-c(1+2i,3+4i,8,0+3i,0)
as.logical(z)

z<-c("programacion","actuaria","III")
as.numeric(z)
as.logical(z)
as.complex(z)

#listas (es como un vector, pero de vectores y c/u tiene su propia clase)
x<- list(1,"a","TRUE","1+4i")
x
class(x)


#Matrices
m<- matrix(nrow = 2,ncol=3)
m
dim(m)
attributes(m)
# cambio de dimensiones de 2x3 a 3x2
dim(m) <- c(3,2)
m
# crear una matriz con datos
m <- matrix(1:6,3,2)
m

m <- matrix(1:6,3,2,T)
m
m <- matrix(1:6,3,3,T)
m
class(m)
str(m)

dim(m) <-c (2,5) #esto va a producir error
#para unir vectores 
x <- c(1,2,3)
y <-c("a","b","c")
z <-c(x,y)
z
#para agregar fila nueva
m1 <- rbind(m,x)
m1
#para agregar columna
m2 <- cbind(m,x)
m2
#agrgar una fila que ahora tenga y
m11 <- rbind(m1,y)
m11
#agregar una columna con y
m22 <- cbind(m2,y)
m22
#otra forma mas facil que es mas rapida
rbind(m1,y)
cbind(m2,y)
data<- read.table()

#Factores
x <- factor(c("si", "no","si","si","no","si","no"),levels=c("si","no"))
x
table(x)
unclass(x)

x<- factor(c("azul","azul","rojo","azul","amarillo","verde","azul"))
x
table(x)

#valores faltantes
x<- c(1,2,NA,10,3)
is.na(x)
is.nan(x)

x<- c(1,2,NaN,10,3)
is.nan(x)
is.na(x)

#Data Frame
x<- data.frame(Eric=1:4, Lori=c(T,T,F,F))
row.names(x)<- c("Primero","segundo","tercero","cuarto")
x
nrow(x)
ncol(x)
attributes(x)
#para cambiar el nombre de las filas
names(x) <- c("Yarely","Karen")
x

#Los nombres no son exclusivos de los data Frames
x<-1:3
names(x) #NULL
names(x) <-c("Hugo","Paco","Luis")
x

x<- list(a=1:10,b=100:91,c=51:60)
x
names(x) <-c("seq1","seq2","seq3")
x


m<- matrix(1:4,2,2)
m
attributes(m)

dimnames(m)
dimnames(m) <- list(c("fil1","fil2"),c("col1","col2"))
m

#Crear una matrix
g<-matrix(data=NA, 5,6)
dimnames(g)
dimnames(g) <-list(c("1","2","3","4","5"),c("a","b","c","d","e","f"))
g

#lectura de datos
getwd()
setwd("~/GitHub/Programacion_Actuarial_lll_OT16")
data <- read.csv("datos s&p.csv")
data <- read.table ("datos s&p.csv",T,",",nrows=100)
#sapply busca el tipo de clase columna por columna 
clases<-sapply(data,class)
data<- read.table("datos s&p.csv",T,",",colClasses = clases)
data

#uso de dput y dget
y<- data.frame(a=1,b="a")
dput(y)
dput(y, file="y.R")
nueva.y <-dget("y.R")
y
nueva.y

x<- "Programacion Actuarial III"
y<- data.frame(a=1,b="a")
dump(c("x","y"),file="data.R")
rm(x,y)
source("data.R")

#para guardar airquality
airquality<-data.frame(a=1,b="a")
dput(airquality)
dput(airquality,file="airquality.R")

#creamos un vector
x<-c("a","b","c","c","d","e")
#veamos el vector
x
#extraemos elementos con []
x[1]
x[2]
#tambien podemos extraer una secuencia de elementos
x[1:4]
#es posible extraer los elementos que cumplen una restriccion 
x[x>"b"]
#de manera equivalente se puede obtener un vector logico
u<-x =="c"
u
x[u]

#creamos una lista
x<-list(foo=1:4, bar=0.6)
#extraemos el primer elemento de la lista, este elemento es una lista que contiene una secuencia
x[1]

#extraemos nuevamente el primer elemento de la lista,
#ahora el elemento es la secuencia en si
x[[1]]

#extraemos un elemento por nombre
x$bar
x[["bar"]]
x["bar"]
#para mostrar el elemento 2 de foo
x$foo[[2]]

#creamos una lista de 3 elementos 
x<-list(foo=1:4, bar=0.6, baz="hola")
#extraemos el primer y tercer elemento de la lista
x[c(1,3)]
x[[c(1,3)]]
name<- "foo" #a foo le doy el nombre de name
x[[name]]
x$name
x$foo

#se pueden extraer elementos de los elementos extraidos 
x<-list(a=list(10,12,14), b=list(3.14,2.81))
x[[c(1,3)]]
x[[1]][[3]]
x[[c(2,1)]]
x[[2]][[1]]

#ahora para matrices
x<-matrix(1:6,2,3)
x
x[1,2]
x[2,1]
x[1,]
x[,2]
#el resultado como vector
x[1,2]
#con drop=FALSE, se mantine la dimension y el resultado sera una matriz
x[1,2, drop=FALSE]
#Si dejamos solamente el espacio el resultado sera un vector
x[1, ]
#si usamos drop=FALSE, el resultado sera una matriz
x[1, , drop=FALSE]

#extraccion sin coincidencia exacta
x<- list(aardvark=1:5)
x$a #como el primer elemento de la lista empieza con a, te lo muestra
#pero con doble corchete debe ser exacto el nombre
x[["a"]]
#para que funcione
x[["a",exact=FALSE]]


airquality[1:6,]
#valores faltantes 
airquality[1:6, ]
completos<-complete.cases(airquality)
completos
#para enseñar solo los datos completos
airquality[completos,]
#para ver las primeras 6 filas con datos completos
airquality[completos,][1:6, ]
airquality[1:6, ][completos,]

x<- 1:4; y <-6:9
#si los vectores no tienen el mismo tamaño entonces lo suma con el numero mas pequeño(lo vuelve a repetir)
x+y
x>2
x>=2
y==8
x*y
x/y

#operaciones con matrices(los elementos de la matriz los llena por columnas)
x<-matrix(1:4,2,2); y<-matrix(rep(10,4),2,2)
x*y
x/y
#multiplicacion de matrices 
x%*%y

#ESTRUCTURAS
if (x< 3) {y<-10}
else 
{y<-0}
#para for
for(i in 1:10){print(i)}

x<-c("a","b","c","d")
for(i in 1:4){print(x[i])}

for(i in seq_along(x)) {print(x[i])}

for(letra in x) {print(letra)}

for(i in 1:4) print(x[i])


x<-matrix(1:6,2,3)

for (i in seq_len(nrow(x))){
  for(j in seq_len(ncol(x))){ 
    print(x[i,j])
  }
}

#para while
z<-5
while(z>=3 && z<=10){
  print(z)
  moneda <- rbinom(1,1,0.5)
  if(moneda==1){ #caminata aleatoria
    z<-z+1
  }else{
    z<-z-1
  }
}

#agregando un vector (intento)
z<-5
x<-c(z)

while(x>=3 && x<=10){
  print(z)
  moneda<- rbinom(1,1,0.5)
  if (moneda==1){
    x<-c(z+1)
  }else{
    x<-c(z-1)  
  }
}

#agregando un vector(real)
z<-5
caminata <-vector("numeric")
while(z>=3 && z<=10){
  print(z)
  caminata<-c(caminata,z)
  moneda <- rbinom(1,1,0.5)
  if(moneda==1){ #caminata aleatoria
    z<-z+0.5
  }else{
    z<-z-0.5
  }
}
caminata
plot(caminata, type="1")


#agregando un vector(real)
z<-5
caminata <-vector("numeric")
while(z>=3 && z<=10){
  print(z)
  caminata<-c(caminata,z)
  moneda <- rbinom(1,1,0.5)
  if(moneda==1){ #caminata aleatoria
    z<-z+1
  }else{
    z<-z-1
  }
}
caminata
plot(caminata, type="l")


#agregando un vector(real)
z<-5
caminata <-vector("numeric")
contadorabajo<-0 # ya que la suma de las varibles primero es cero
contadorarriba<-0 #ya que la suma de las varibles en el segundo contador es cero
for (i in 1:100) {
 z<-5 
while(z>=3 && z<=10){
    
  print(z)
  caminata<-c(caminata,z)
  moneda <- rbinom(1,1,0.5)
  if(moneda==1){ #caminata aleatoria
    z<-z+1
  }else{
    z<-z-1
  }
}
if (z>=3){contadorarriba<- contadorarriba+1} #si se cumple la condicion se siguen contando las variables
 else {contadorabajo<-contadorabajo-1}
}

caminata
contadorarriba
abs(contadorabajo)
plot(caminata, type="l")
