rankhospital<-function(estado,resultado,num){
    outcome<-read.csv("outcome-of-care-measures.csv", colClasses = "character")   
    uno<-vector("numeric")
    dos<-vector("numeric")
    tres<-nrow(outcome)
    
    if (resultado=="neumonia"){
        c<-23
    }else if (resultado=="falla"){
        c<-17
    }else if(resultado=="ataque"){
        c<-11
    }else{
        c<-2
    }
    
    
    if(c>10){
        cuatro<-0
        for (k in 1:tres){
            if (outcome[k,7]==estado){
                cuatro<-length(uno)+1
                length(uno)<-cuatro
                length(dos)<-cuatro
                uno[cuatro]<-outcome[k,2]
                dos[cuatro]<-outcome[k,c]
            }
            
        }
        if (cuatro>0){
            oldw<-getOption("warn")
            options(warn=-1)
            w<-as(dos,"numeric")
            options(warn = oldw)
            x<-data.frame(uno,w,stringsAsFactors = FALSE)
            y<-x[order(w,uno),]
            if(num=="mejor"){
                y[1,1] 
            }else if(num=="peor"){
                ka<-nrow(y[complete.cases(y),1])
                y[ka,1]
            }else{
                y[num,1]
            }
           
            
        }else{
            "estado invalido"
        }
    }else{
        "resultado invalido"
    }
}


