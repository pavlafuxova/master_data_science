#train.csv file - Find top 10 countries with the most cases

#Reading the data
mi.train <- read.table(file = "C:/Users/pavla/OneDrive/Documents/data/train.csv_/train.csv", 
                       sep = ",", header = T, dec = ".")
head(mi.train, 6)
dim(mi.train)

#Find the column with the country code
str(mi.train)
colnames(mi.train)
str(mi.train$cat116)

#extracting needed columns into mi.train2
mi.train2 <- mi.train[, c("cat116", "loss")]
mi.train2

#sorting the data of the country
tabulate(mi.train2$cat116)
sort(tabulate(mi.train2$cat116), decreasing = TRUE)
#mi.train2[sort(tabulate(mi.train2$cat116), decreasing = TRUE),]

#getting top10 biggest cases 
cat116 <- mi.train2$cat116
s <- summary(as.factor(cat116))
as.data.frame(cbind(Numbers = names(s), Freq = s), stringsAsFactors = F, row.names = 1:length(s) )
head(as.data.frame(cbind(Numbers = names(s), Freq = s), stringsAsFactors = F, row.names = 1:length(s) ), 10)

# checking the above function
length(which(mi.train$cat116 == "LB"))

#sort the data including only top10 biggest cases

top10 <- mi.train2[mi.train2$cat116 == "HK" 
          | mi.train2$cat116 == "DJ" 
          | mi.train2$cat116 == "CK" 
          | mi.train2$cat116 == "DP"
          | mi.train2$cat116 == "GS"
          | mi.train2$cat116 == "CR"
          | mi.train2$cat116 == "HX"
          | mi.train2$cat116 == "DC"
          | mi.train2$cat116 == "HG"
          | mi.train2$cat116 == "IE"
          & !is.na(cat116),] 
unique(top10$cat116)
dim(top10)
mean(top10$loss)
head(top10, 50)

#visualization of the data
boxplot(cat116 ~ loss, data = top10, col = "lightgray")
