
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