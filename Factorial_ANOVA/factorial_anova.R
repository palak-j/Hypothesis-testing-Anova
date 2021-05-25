library(emmeans)
library(ggplot2)

#Load the data
data <- read.csv("D:/github/r codes/factorial-anova.csv", header=TRUE)


# Find cell means
data$Pressure_level = factor(data$Pressure_level)
data$Curriculum = factor(data$Curriculum)
cellmeans = aggregate(data$Scores, by= list(Pressure_level = data$Pressure_level, Curriculum= data$Curriculum), FUN=mean)
xtabs(x~ ., data =cellmeans)

# Draw mean plot to understand the various effects(simple, main and interaction effects)

ggplot(data, aes(x = Curriculum, y = Scores, colour = Pressure_level))+
  stat_summary(fun = mean, geom = "point", aes(group = Pressure_level))+
  stat_summary(fun = mean, geom = "line", aes(group=Pressure_level))

# Run the Anova test
model <- lm(Scores ~ Pressure_level*Curriculum, data=data)

anova(model)

#From the results, we can see that p value for the model is significantly less than 0.05, therefore we can say there is significant difference in groups.

# To understand which pair of groups has mean difference, here also we will use the appropriate Post-Hoc test.
# Here, we are using Tukey's HSD

lsmeans(model, pairwise ~ Pressure_level,
        by = "Curriculum",
        adjust = "tukey")

