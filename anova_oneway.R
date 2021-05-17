library(emmeans)

# Example1

Y<- c(2,3,7,2,6,10,8,7,5,10,10,13,14,13,15)
group <- c(rep("high stress",5),rep("moderate stress",5),
           rep("low stress",5))

data <- data.frame(group,Y)
data
data$group<- as.factor(group)


# One way Anova

model1 <- lm(Y~group , data =data)
anova(model1)


# Adjustment methods

# 1) Bonferroni Method 
pairwise.t.test(data$Y, data$group, p.adj = "bonferroni", 
                pool.sd = FALSE)

# 2) Holm- Bonferroni Method
pairwise.t.test(data$Y, data$group, p.adj = "holm", 
                pool.sd = FALSE)

# 3) Sidak-Holm Method
lsmeans(model1, pairwise~ group, adjust="sidak")


# 4) Fisher's LSD
pairwise.t.test(data$Y, data$group, p.adj = "none", 
                pool.sd = TRUE)

# 5) Tukey's HSD
lsmeans(model1, pairwise~group, adjust="tukey")
















