library(afex)
library(ggplot2)
library(emmeans)

#EXAMPLE 1


#Create dataframe
Week1<- c(6,2,2,4,4)
Week2<- c(10,4,4,5,7)
Week3<- c(8,8,8,8,9)
Week4<- c(4,5,5,10,7)
Week5<- c(5,6,5,7,11)

data <- data.frame(Week1, Week2, Week3, Week4, Week5)
data


#Convert this wide format into long format
dataLong <- reshape(data= data,
                    varying = c("Week1", "Week2", "Week3", "Week4", "Week5"),
                    v.names = "Scores",
                    timevar = "week",
                    idvar = "subject",
                    direction = "long"
)


dataLong <- dataLong[order(dataLong$subject),]
View(dataLong)

dataLong$week <- factor(dataLong$week)
dataLong$subject <- factor(dataLong$subject)


aggData <- aggregate(dataLong$Scores,
                     by = list(week= dataLong$week),
                     FUN = mean)
xtabs(x ~ ., data= aggData)



#Repeated Measures ANOVA
model <- aov_ez(id ="subject",
                dv = "Scores",
                data = dataLong,
                within = "week")

names(model)
summary(model)


#MANOVA tests
model$Anova


#Mean plot
afex_plot(model, x="week", error="within")

afex_plot(model, x="week",
          error="within",
          factor_levels = list(week = c("week1", "week2", "week3", "week4", "week5")))+
  ggplot2:: geom_line(ggplot2::aes(group = 1))














#EXAMPLE 2

#Import dataset and convert it into long format
data <- read.csv("D:/data/Repeated_measures.csv", 
                 fileEncoding = 'UTF-8-BOM',header=TRUE)
data

View(data)
names(data)

data$Subject <- factor(data$Subject)

dataLong <- reshape(data= data,
                    varying = c("Week1", "Week2", "Week3", "Week4"),
                    v.names = "Scores",
                    timevar = "Week",
                    idvar = "subject",
                    direction = "long")
View(dataLong)

dataLong <- dataLong[order(dataLong$subject),]
dataLong

dataLong$Week <- factor(dataLong$Week)
dataLong$Subject <- factor(dataLong$Subject)
dataLong$Group <- factor(dataLong$Group)

aggData <- aggregate(dataLong$Scores,
                     by = list(time= dataLong$Week),
                     FUN = mean)
xtabs(x ~ ., data= aggData)


#Repeated measures anova without group factor.

model1 <- aov_ez(id ="subject",
                dv = "Scores",
                data = dataLong,
                within = "Week")

names(model1)
summary(model1)

#MANOVA for model1
model1$Anova

#Mean plot for model1
afex_plot(model1, x="Week", error="within")

afex_plot(model1, x="Week",
          error="within",
          factor_levels = list(Week = c("Week1", "Week2", "Week3", "Week4")))+
  ggplot2:: geom_line(ggplot2::aes(group = 1))




#Repeated measures anova with group factor

model2 <- aov_ez(id="subject", dv="Scores",
                 data = dataLong,
                 between = c("Group"),
                 within= c("Week"))



summary(model2)



#MANOVA for model2
model2$Anova

#Mean plot for mixed factorial design
afex_plot(model2,
          x="Week",
          trace="Group",
          error="none",
          factor_levels = list(Week = c("Week1","Week2","Week3","Week4"),
                               Group = c("Training group", "Control group")))


#Post-hoc tests
lsmeans(model2,
        pairwise ~Group,
        by = c("Week"),
        adjust ="tukey")































