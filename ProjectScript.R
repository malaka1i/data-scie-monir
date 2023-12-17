Cars<-read.csv("CarsSample.csv")
library(ggplot2)
attach(Cars)
colnames(Cars)
Cars<-read.csv("CarsSample.csv")
library(ggplot2)

attach(Cars)
Cars$Body.type<-factor(Cars$Body.type)
Cars$Engine <- as.numeric(gsub("L", "", Cars$Engine))
Cars$Gearbox <- Cars$Gearbox == "Automatic" 
Cars$Fuel.type<-factor(Cars$Fuel.type)
str(Cars)
#view the data after editing
View(Cars)
#compare between two categorical variables in a graph 
ggplot(Cars, aes(x=Body.type, fill=Fuel.type)) + geom_bar(position="dodge")
table_fuel_type <- table(Cars$Fuel.type)
pie(table_fuel_type, labels = paste0(names(table_fuel_type), " (", round(table_fuel_type/sum(table_fuel_type) * 100, 1), "%)"))
table_body_type <- table(Cars$Body.type)
pie(table_body_type, labels = paste0(names(table_body_type), " (", round(table_body_type/sum(table_body_type) * 100, 1), "%)"))

table(Cars$title)
#make another column with the car brand
Cars$Brand <- gsub(" .*", "", Cars$title)
asfactor(Cars$Brand)
Cars$Previous.owners[is.na(Cars$Previous.owners)] <- 0
View(Cars)