## option 1: DT[,mean(pwgtp15),by=SEX]
trial_size <- 1000
collected_results <- numeric(trial_size)
for (i in 1:trial_size){
        single_function_time <- system.time(DT[,mean(pwgtp15),by=SEX])
        collected_results[i] <- single_function_time[1]
}
print(c("Option 1: ", mean(collected_results)))



## option 2: mean(DT$pwgtp15,by=DT$SEX)
trial_size <- 1000
collected_results <- numeric(trial_size)
for (i in 1:trial_size){
        single_function_time <- system.time(mean(DT$pwgtp15,by=DT$SEX))
        collected_results[i] <- single_function_time[1]
}
print(c("Option 2: ", mean(collected_results)))



## option 3: sapply(split(DT$pwgtp15,DT$SEX),mean)
trial_size <- 1000
collected_results <- numeric(trial_size)
for (i in 1:trial_size){
        single_function_time <- system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
        collected_results[i] <- single_function_time[1]
}
print(c("Option 3: ", mean(collected_results)))



## option 4: tapply(DT$pwgtp15,DT$SEX,mean)
trial_size <- 1000
collected_results <- numeric(trial_size)
for (i in 1:trial_size){
        single_function_time <- system.time(tapply(DT$pwgtp15,DT$SEX,mean))
        collected_results[i] <- single_function_time[1]
}
print(c("Option 4: ",mean(collected_results)))



## option 5: mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
trial_size <- 1000
collected_results <- numeric(trial_size)
for (i in 1:trial_size){
        single_function_time <- system.time(mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15))
        collected_results[i] <- single_function_time[1]
}
print(c("Option 5: ", mean(collected_results)))



## option 6: rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
trial_size <- 1000
collected_results <- numeric(trial_size)
for (i in 1:trial_size){
        single_function_time <- system.time(rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2])
        collected_results[i] <- single_function_time[1]
}
print(c("Option 6: ", mean(collected_results)))



## testing with library("microbenchmark")
library("microbenchmark")
microbenchmark(DT[,mean(pwgtp15),by=SEX])
microbenchmark(mean(DT$pwgtp15,by=DT$SEX))
microbenchmark(sapply(split(DT$pwgtp15,DT$SEX),mean))
microbenchmark(tapply(DT$pwgtp15,DT$SEX,mean))
microbenchmark(mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15))
part1<-microbenchmark(mean(DT[DT$SEX==1,]$pwgtp15))
part2<-microbenchmark(mean(DT[DT$SEX==2,]$pwgtp15))
part1+part2