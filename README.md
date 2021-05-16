# Hypothesis-testing-Anova

If we have more than two groups, it seems that we can run multiple t tests to compare the means from different groups and if we found that at least one of the t tests was significant, we can say there is group effect. But the multiple t tests inflate Type1 error for the test of overall group effect (overall α).
Therefore if we have more than two groups, we will go for ANOVA test.

### ANOVA Test 
#### One Way Anova Test
Anova compare multiple groups simultaneously which helps to avoid inflated overall alpha. The basic logic of ANOVA is to decompose the total variance of dependent variables to those due to the group effect (between-group variance) and those due to sampling variability (within-group variance).
ANOVA uses a F test for statistical inferences.

F =  (Between group variance)/(Within group variance)    

If p value is greater than 0.5, we fail to reject H0 but if p value is less than 0.5, we can reject null hypothesis and we can say that there is at least one group which has significant difference. 
But to see which group has that difference, we have to perform some additional test which is known as post-hoc tests.

#### Post-Hoc Tests
Some Post-Hoc Tests
1) Bonferroni Adjustments
2) The Holm Method
3) Sidak-Holm Method
4) Fisher's Least Significant Difference(Fisher's LSD)
5) Tukey's Honestly Significant Difference(Tukey's HSD)

For more detailed explanation:

Visit
https://palak-j.github.io/notes
