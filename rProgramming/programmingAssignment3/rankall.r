rankall <- function(outcome, num = "best") {
        ## Read outcome data
        
        outcomes <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", header=TRUE, colClasses="character")

        ##outcome <- "heart attack"
        
        states <- vector(mode="character")
        outcomesRank <- vector(mode="character")
        results <- data.frame(hospitals = character(0), states = character (0))
        
        states <- sort(unique(outcomes[,7]))
        ##length(states) ##returns 54
        
        validOutcomes <- c("heart attack", "heart failure", "pneumonia")
        ##length(validOutcomes) ##returns 3
        
        ## Check that state and outcome are valid
        
        if (!(outcome %in% validOutcomes)) {
                stop("invalid outcome")
        } 
        
        ## get subset of outcomes and put it into a variable
        
        if (outcome == validOutcomes[1]) { ##heart attack
                ##stop("heart attack") 
                selectedOutcome <- subset(outcomes, select=c(2,7,11))
                suppressWarnings(
                        selectedOutcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack <- as.numeric(selectedOutcome[,3])
                )
                selectedOutcome <- selectedOutcome[order(selectedOutcome$State, selectedOutcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, selectedOutcome$Hospital.Name, na.last=NA),]
        } else if (outcome == validOutcomes[2]) { ##heart failure
                ##stop("heart failure")
                selectedOutcome <- subset(outcomes, select=c(2,7,17))
                suppressWarnings(
                        selectedOutcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure <- as.numeric(selectedOutcome[,3])
                )
                selectedOutcome <- selectedOutcome[order(selectedOutcome$State, selectedOutcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, selectedOutcome$Hospital.Name, na.last=NA),]
        } else if (outcome == validOutcomes[3]) { ##pneumonia
                ##stop("pneumonia")
                selectedOutcome <- subset(outcomes, select=c(2,7,23))
                suppressWarnings(
                        selectedOutcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia <- as.numeric(selectedOutcome[,3])
                )
                selectedOutcome <- selectedOutcome[order(selectedOutcome$State, selectedOutcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, selectedOutcome$Hospital.Name, na.last=NA),]
        } else {
                stop("outcome not on list")
        }
                
        ## determine which hospital to return by state; best, worst, or num
        
        if (num == "best") {
                for (i in 1:length(states)) {
                        tempSubSet <- subset(selectedOutcome, selectedOutcome$State == states[i])
                        stateHospital <- data.frame(tempSubSet[1,1],states[i])
                        results <- rbind.data.frame(results,stateHospital[1,])
                }
        } else if (num == "worst") {
                for (i in 1:length(states)) {
                        tempSubSet <- subset(selectedOutcome, selectedOutcome$State == states[i])
                        stateHospital <- data.frame(tempSubSet[nrow(tempSubSet),1],states[i])
                        results <- rbind.data.frame(results,stateHospital[1,])
                }
        } else {
                for (i in 1:length(states)) {
                        tempSubSet <- subset(selectedOutcome, selectedOutcome$State == states[i])
                        if (nrow(tempSubSet) >= num) {
                                stateHospital <- data.frame("hospital"=tempSubSet[num,1],"state"=states[i])
                        } else {
                                stateHospital <- data.frame("hospital"="<NA>","state"=states[i])
                        }
                        results <- rbind.data.frame(results,stateHospital[1,])
                }
        }
        
        colnames(results) <- c("hospital","state")
                
        ##get outcomes by state, remove na
        
        ##num variable = best, worst, or integer
        ##if integer > # of hospitals in that state, it should return NA for that state
                ## For each state, find the hospital of the given rank
                
        ##        ties should be handled alphabetically
        ##don't call the rankhospital function
        
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
        
        ##hospitals | states
        
        return(results)
}