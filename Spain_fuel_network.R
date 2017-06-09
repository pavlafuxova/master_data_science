#SPAIN FUEL NETWORK

#Reading the file 
gasolineras <- read.table(file = "C:/Users/pavla/OneDrive/Documents/MASTER KSCHOOL/9. R/kschool_master_data_science_2017 (1)/data/carburantes_20050222.csv", 
                          sep = "\t", header = T, quote = " ", dec = ",")

#Overview of the data and plotting the data
head(gasolineras, 6)
colnames(gasolineras)
str(gasolineras)
dim(gasolineras)

#Raname of the columns to "lat" and "lot"
colnames(gasolineras)[c(7,8)] <- c("lon","lat")

#Graphical visualization of the data
hist(gasolineras$lon)
plot(gasolineras$lon, gasolineras$lat, col = "dark grey", main = "Red de gasolineras en España",
     xlab = "Longitud", ylab = "Latitud")

#Excluding Canary Islands from the Spanish network
gasolineras[,"lat"]
length(gasolineras$Provincia[gasolineras$lat < 30])
head(gasolineras[gasolineras$lat >30,],3)
gassinCan <- gasolineras[gasolineras$lat > 30,]
dim(gassinCan)

#Graphical visualization of the data excl. Canary Islands
hist(gassinCan$lon)
plot(gassinCan$lon, gassinCan$lat, col = "dark grey", main = "Red de gasolineras en España excl. Canarias",
     xlab = "Longitud", ylab = "Latitud")
