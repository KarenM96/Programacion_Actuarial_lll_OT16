#parte1
setwd("~/GitHub/Programacion_Actuarial_lll_OT16/specdata")
mediacontaminante<-function(directorio,contaminante,id) {
  if (contaminante=="sulfato"){
    columna<-2
  } else if (contaminante=="nitrato"){
    columna<-3
  } else {
    stop("Error en el contaminante")
  }
  medida <- length(id)
  resultadofinal<-c("numeric",medida)
  casoscompletos<-c("numeric",medida)
  
  for (i in 1:medida){
    id1<-id[i] #va a expresar el vector de acuerdo a su longitud, estrae sus cantidades 
    if (id1<10){id2<-paste(0,id1, sep = "0")}  
 #creamos un vector para con el formato si id1<10
   else if (id1<100){id2<-paste(0,id1,sep = "")}
   else {id2<-id1} 
 #si el vector inicial nok cumple con la condicion entonces se crea el vector con el formato 
  idfinal<-paste(id2,"csv",sep = ".")
  
  #se crea nuevo vector tal que el idfinal tenga el siguiente formato
  idfinal2<-paste(directorio,idfinal, sep = "/")
  
  #para que muestre los datos
  mostrar<-read.csv(idfinal2)
  
  #para mostrar en un vector la suma de los casos completos de los id dependiendo del contaminante 
  casoscompletos[i]<-sum(complete.cases(mostrar[,columna]))
  
  #para mostrar el promedio de cada elemnto del vector de casos completos 
  resultadofinal[i]<-mean(mostrar[,columna], na.rm=TRUE)
  
 }
#para mostrar el promedio ponderado del resultadofinal
  media<-sum(casoscompletos*resultadofinal)/sum(casoscompletos)
media  
  
 }



#pruebas
#mediacontaminante("w", "hola", c(3,45))