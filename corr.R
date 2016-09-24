#parte1
directorio<-setwd("~/GitHub/Programacion_Actuarial_lll_OT16/specdata")
corr<-function(directorio,horizonte=0) {
 primervector<-vector("numeric")
 segundovector<-vector("numeric")
  
  

  
  for (i in 1:332){
    #va a expresar el vector de acuerdo a su longitud, estrae sus cantidades 
    if (i<10){id2<-paste(0,i, sep = "0")}  
    #creamos un vector para con el formato si id1<10
    else if (i<100){id2<-paste(0,i,sep = "")}
    else {id2<-i} 
    #si el vector inicial nok cumple con la condicion entonces se crea el vector con el formato 
    idfinal<-read.csv(paste(id2,".csv",sep = ""))
    
    #se crea nuevo vector tal que el idfinal tenga el siguiente formato
    #idfinal2<-paste(directorio,idfinal, sep = "/")
    
    #para que muestre los datos
    #mostrar<-read.csv(idfinal)
    
    nuevo <- complete.cases(idfinal)
    nuevo2 <- idfinal[nuevo,2:3]
    conta <- nrow(nuevo2)
    if (conta>=horizonte){
      primervector<-cor(nuevo2[,1],nuevo2[,2])
      cambio<-as.vector(primervector)
      segundovector<-c(segundovector,cambio)
    }
  }
  
 segundovector
}



#pruebas
#mediacontaminante("w", "hola", c(3,45))