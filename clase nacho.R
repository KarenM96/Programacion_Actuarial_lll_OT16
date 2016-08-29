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

