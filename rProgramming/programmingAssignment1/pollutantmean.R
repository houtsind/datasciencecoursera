pollutantmean <- function(directory, pollutant="sulfate", id = 1:332) {

        ## hd: directory will be set as the folder name where the data is stored
        ## (i.e. specdata)

        ##assumes the data is one level below current working directory, 
        ##sets the new working directory
        setwd(directory)

        ##gets all the files in the directory and saves the names 
        ##to prepare to retrieve data
        specDataFiles <- dir()

        ##initialize data set
        specDataSet <- data.frame()

        for(i in id) {
                specDataSet <- rbind(specDataSet,read.csv(specDataFiles[i]))
        }

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)

        ##returns to parent directory
        setwd("../")

        ##outputs the mean of the pollutant requested
        mean(specDataSet[[pollutant]],na.rm=TRUE)

}