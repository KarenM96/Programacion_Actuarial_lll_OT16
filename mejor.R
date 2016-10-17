
mejor<-function(estado,resultado){
    outcome<-read.csv("outcome-of-care-measures.csv", colClasses = "character")   

    estados<-levels(outcome[,7])[outcome[,7]]
    es<-c("numeric")
    abreviatura<-FALSE
    
    for (f in 1:length(es)) {
        if (estado==estados[f]){
            abreviatura<-TRUE
        }
    }
    
    if (!abreviatura){
        stop ("estado no registrado")
    }
    if (!((resultado == "ataque") | (resultado == "falla")
          | (resultado == "neumonia"))) {
        stop ("resultado invalido")
    }      
    
    #if (resultado=="ataque"){
    #columnaestados<-11
#} else if (resultado=="falla")
#{
 #   columnaestados<-17
    
#}else (resultado=="neumonia")
#{
 #   columnaestados<-23
#}
    col<-if(resultado=="ataque"){
    11    
    }else if (resultado=="falla"){
    17   
    }else{
    23
    }
    
    outcome[,col]<-suppressWarnings(as.numeric(levels(outcome[,col])[outcome[,col]]))        
    outcome[,2]<-as.character(outcome[,2])
    
    DataEstado<-outcome[grep(estado,data$State), ]
    
    ordenar_data<-DataEstado[order(DataEstado[,col],DataEstado[,2], na.last = NA),]
    ordenar_data[1,2]
}
              
