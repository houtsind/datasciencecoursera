complete <- function(directory, id = 1:332) {
        
        setwd(directory)

        specDataFiles <- dir()

        specDataSet <- data.frame()
        
        nobs <- numeric()
        
        for(i in id) {
                specDataSet <- read.csv(specDataFiles[i])
                nobs<-append(nobs,sum(complete.cases(specDataSet),na.rm=TRUE))
        }
        
        setwd("../")

        specDataSet.CompleteCases <- data.frame(id,nobs)

        specDataSet.CompleteCases
        
}