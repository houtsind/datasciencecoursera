rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        
        outcomes <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", header=TRUE, colClasses="character")
        
        states <- vector(mode="character")
        outcomesRank <- vector(mode="character")
        
        states <- unique(outcomes[,7])
        ##length(states) ##returns 54
        validOutcomes <- c("heart attack", "heart failure", "pneumonia")
        ##length(validOutcomes) ##returns 3
        
        ## Check that state and outcome are valid
        
        if(!(state %in% states)) {
                stop("invalid state")
        } else if (!(outcome %in% validOutcomes)) {
                stop("invalid outcome")
        } 
        
        ## Return hospital name in that state with the given rank
        ## 30-day death rate
        ##num can handle numeric, 'best', 'worst'
        ##if numeric > num available, return NA
        ##ignore hospitals that are NA for a particular outcome
        ##if tie, rank by alphabet
        
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
     
        if (num == "best") {
                return(results[1,1])  
        } else if (num == "worst") {
                return(results[nrow(results),1])
        } else {
                return(results[num,1])
        }
                
}