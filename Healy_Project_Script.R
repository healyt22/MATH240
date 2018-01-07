setwd("~/Repos/MATH240")

library(plyr)
library(reshape2)

crime_dat = read.csv("BPD_Part_1_Victim_Based_Crime_Data.csv")
crime_dat = ddply(crime_dat, c("Neighborhood", "Description"), summarise, Crimes = sum(Total.Incidents))
crime_dat = dcast(crime_dat, Neighborhood ~ Description, value.var="Crimes")
crime_dat[is.na(crime_dat)] = 0

hvi_dat = read.csv("Neighborhood_medianValuePerSqft_AllHomes.csv")
hvi_dat = subset(hvi_dat, hvi_dat$City == "Baltimore")
hvi_dat = hvi_dat[,c("RegionName","X2016.03")]
colnames(hvi_dat)[1] = "Neighborhood"

data = merge(crime_dat, hvi_dat, by = "Neighborhood")
y = data[,length(colnames(data))]
m = length(y)
X = as.matrix(data[,3:length(colnames(data))-1])

theta = as.vector( solve(t(X) %*% X) %*% t(X)%*%y )

result = cbind("Crime" = colnames(X), theta)
result

