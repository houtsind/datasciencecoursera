corr <- function(directory, threshold = 0) {
        
        specDataSet.CompleteCases <- complete("specdata")
        
        setwd(directory)
        
        specDataFiles <- dir()
        
        specDataSet <- data.frame()
        
        sulNitCor <- numeric(0)
        
        specDataSet.PassThreshold <- subset(specDataSet.CompleteCases,
                                     specDataSet.CompleteCases$nobs>threshold)
        
        for(i in specDataSet.PassThreshold$id) {
                specDataSet <- read.csv(specDataFiles[i])
                sulNitCor <- append(sulNitCor,cor(specDataSet$sulfate,
                             specDataSet$nitrate,use="pairwise.complete.obs"))
        }
        
        ## 'threshold' is a numeric vector of length 1 indicating th
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        
        
        
        ##pseudocode
#         done-get working directory (passed variable)
#         done-set working directory
#         done-get all files
#         done-get threshold (passed variable)
#         done-run complete.r
#         done-determine monitor ids that pass threshold
#         na(used subset)-pass ids to vector
#         done-calculater correlation on ids (use for loop)
#         done-pass correlation to vector 
#         return vector

        setwd("../")

        sulNitCor
}