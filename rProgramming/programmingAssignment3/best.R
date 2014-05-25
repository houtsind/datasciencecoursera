best <- function(state, outcome) {
        ## Read outcome data
        ##read csv file with the 30 day mortality and outcomes
        
        outcomes <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", header=TRUE, colClasses="character")
        
        ##state <- "AL"
        ##outcome <- "heart attack"
        
        states <- vector(mode="character")
        outcomesRank <- vector(mode="character")
        
        states <- unique(outcomes[,7])
        ##length(states) ##returns 54
        validOutcomes <- c("heart attack", "heart failure", "pneumonia")
        ##length(validOutcomes) ##returns 3
        
        
        
        ## Check that state and outcome are valid
        ## check the state = something on the list (got unique states)
        ## check the outcome = something on the list (created list and compared)
        ## if false for either, kick out
        ## use stop function, error 'invalid state' or 'invalid outcome'
        
        if(!(state %in% states)) {
                stop("invalid state")
        } else if (!(outcome %in% validOutcomes)) {
                stop("invalid outcome")
        } 
        ##else {
        ##        print("success")
        ##}
                
        ## Return hospital name in that state with lowest 30-day death
        ## rate
        ## for a particular outcome, rank all the hospitals, disregard any hospitals with NA for that specific outcome
        ## if ties occur, output by alphabetical order
        
        if (outcome == validOutcomes[1]) { ##heart attack
                ##stop("heart attack") 
                heartAttacks <- subset(outcomes, outcomes[,7] %in% state, select=c(2,7,11))
                suppressWarnings(
                        heartAttacks$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack <- as.numeric(heartAttacks[,3])
                )
                results <- heartAttacks[order(heartAttacks$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, heartAttacks$Hospital.Name, na.last=NA),]
        } else if (outcome == validOutcomes[2]) { ##heart failure
                ##stop("heart failure")
                heartFailures <- subset(outcomes, outcomes[,7] %in% state, select=c(2,7,17))
                suppressWarnings(
                        heartFailures$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure <- as.numeric(heartFailures[,3])
                )
                results <- heartFailures[order(heartFailures$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, heartFailures$Hospital.Name, na.last=NA),]
        } else if (outcome == validOutcomes[3]) { ##pneumonia
                ##stop("pneumonia")
                pneumonia <- subset(outcomes, outcomes[,7] %in% state, select=c(2,7,23))
                suppressWarnings(
                        pneumonia$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia <- as.numeric(pneumonia[,3])
                )
                results <- pneumonia[order(pneumonia$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, pneumonia$Hospital.Name, na.last=NA),]
        } else {
                stop("outcome not on list")
        }
        
        ##print (heartAttacksNoNA[1,1])
        return (results[1,1])
        
        ## heart attack (column 11)
        ## heart failure (column 17)
        ## pneumonia (column 23)
        
}