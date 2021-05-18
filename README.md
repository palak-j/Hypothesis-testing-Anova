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


## Example 1
Consider, we randomly select students and assign them into three groups with different stress level and observed marks obtained by them. We have to find if stress level affects the scores.

Scores:
Group1(high stress) = [2, 3, 7,	2, 6]
Group2(moderate stress)	= [10,	8,	7,	5,	10]
Group3(low stress)	= [10,	13,	14,	13,	15]


#### Factorial Anova
A factorial Anova is any Anova that involves more than one factor (independent variable). 

To understand the relationship between independent and dependent variables, we look for different types of effects which are known as Simple effect, Main effect, and Interaction effect.

Simple effects:
This effect concern about the effect of one independent variable(IV) at a specific level of the other IV. 

Main Effects:
It is the average effect of the factors across all the levels of other IV or average effect of the levels across across all the factors.

Interaction Effects:
This effect occurs when the simple effects of one IV are not constant across all levels of the other IV.  


To conduct two-way Anova, the same general principles from one way ANOVA will apply i.e. total variability is decomposed into stable and random sources. 
Procedure for Two way Anova:
Step1: Calculate SS for each component
Step2: Calculate df for each component
Step3: Calculate MS, 
	MS = (SS/df) for each component.
Step: There will be F-tests for each component.
 	F = ratio of MScomponent to MSerror 


## Example 
Consider we randomly assign some students into three curriculums under two conditions, some with low pressure and some with high pressure. Now we have to find effects between independent and dependent variables( scores, curriculum and pressure) and run Anova test to measure effects.
You can download dataset "factorial-anova" mentioned above.




For more detailed explanation:
#### Visit
#### https://palak-j.github.io/notes
