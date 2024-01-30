# Happiness-Index
Using R studio and data visualizations to illustrate the impact of terrorism on happiness index.

# Project Overview: Analyzing Global Happiness Factors

# Introduction:
The project aims to explore and understand the factors influencing happiness scores on a global scale. The analysis uses a dataset containing information about various countries and their corresponding happiness scores. The primary variables considered include GDP per capita, social support, healthy life expectancy, freedom to make life choices, generosity, and perceptions of corruption.

# 1. Data Exploration:
The project starts by loading and exploring the dataset, which includes information on 156 countries. The data covers a range of factors contributing to overall happiness, such as economic indicators, social support, and health-related metrics.

# 2. Summary Statistics:
Summary statistics are generated to provide an initial overview of the dataset. These include minimum, maximum, mean, and quartile values for each variable. The average happiness score across the world is noted to be 5.4.

# 3. Data Types and Missing Values:
The types of variables are examined to ensure consistency, and it's confirmed that there are no missing values in the dataset. This ensures the reliability of the analysis.

# 4. Correlation Analysis:
The relationships between variables are explored through correlation analysis. Both graphical (using pairs plots) and numerical (correlation matrix) methods are employed. The analysis reveals strong positive correlations between happiness scores and variables like GDP, social support, and healthy life expectancy.
![image](https://github.com/avijani/Happiness-Index/assets/123911009/0ca78f7b-9e61-4a87-9f7e-d81111f099cc)
![image](https://github.com/avijani/Happiness-Index/assets/123911009/05e291ae-160d-4698-83cb-cff78ce0b846)


# 5. Top Countries Analysis:
The top countries are identified based on different factors such as overall happiness score, GDP per capita, social support, life expectancy, freedom, generosity, and perceptions of corruption. Visualizations, including bar graphs, help illustrate these top countries for each factor.
![image](https://github.com/avijani/Happiness-Index/assets/123911009/eb9c5dcd-f8d4-42b4-9ce5-6a79923bbeef)
![image](https://github.com/avijani/Happiness-Index/assets/123911009/c2e6f8ec-847a-4bb8-a105-471f26633cc6)
![image](https://github.com/avijani/Happiness-Index/assets/123911009/923ecc05-960a-453f-a8d9-fe4006a0809a)
![image](https://github.com/avijani/Happiness-Index/assets/123911009/871fcc76-ce8a-4527-ab14-b37ffa6422bc)
![image](https://github.com/avijani/Happiness-Index/assets/123911009/0ee7d8b4-537a-4949-b05a-4828acdd0c29)
![image](https://github.com/avijani/Happiness-Index/assets/123911009/f31de2e4-3839-4a63-bf5d-03bd26f2e337)

# 6. Building the Predictive Model:
A multiple linear regression model is constructed to predict happiness scores based on the chosen variables. The initial model includes all variables, but a stepwise approach is employed to refine the model based on statistical significance and multicollinearity.

We can see in our model summary that only generosity is not a significant predictor of happiness at the 0.1 cutoff, while perceptions of corruption is not significant at the 0.05 cutoff level. The R-squared and adjusted R-squared are close enough to 1 for us to conclude that this model is a good fit, also the two are approximatley the same value, informing us that our model is not running the risk of overfitting.

Let's run an ANOVA test to test the usefulness of our predictors.

The ANOVA shows about the same output, with generosity having a p-value of 0.128 and perceptions of corruption having a p-value of 0.075.

# 7. Model Evaluation:
The constructed model is evaluated using statistical metrics, including R-squared values and p-values. The analysis identifies significant predictors of happiness, with GDP per capita, social support, and freedom being highly influential. Variables like generosity and perceptions of corruption are found to be less significant.

# 8. Addressing Multicollinearity:
Multicollinearity issues are addressed by assessing the Variance Inflation Factor (VIF) of the variables. The initial model's VIF values indicate multicollinearity, leading to the removal of certain variables to improve model stability.
VIF of New model
#################

GDP Per Capita:  2.34
Social Support:  2.5
Freedom:  1.26
# 9. Residual Analysis:
The distribution of residuals is examined through Q-Q plots, histograms, and statistical tests. While the residuals are not perfectly normal, the skewness is reduced in the refined model.
Both plots show the residuals approximately lie on the Q-Q line with some variance.
![image](https://github.com/avijani/Happiness-Index/assets/123911009/21350c92-ab5b-486f-b238-494cc6b087b5)
![image](https://github.com/avijani/Happiness-Index/assets/123911009/23c20e67-7968-440f-b913-3173a2e31e8b)
The updated model is slightly less skewed than the original. Both models' residuals are not normally distributed as neither have a p-value > 0.5.

# 10. Conclusion:
The project concludes that GDP per capita is a crucial factor influencing a country's happiness, indicating the importance of economic well-being. Social support and freedom also play significant roles. The analysis suggests focusing efforts on improving economic conditions and promoting individual freedoms globally to enhance overall happiness.

This project aimed to understand the factors influencing happiness scores across different countries using statistical analysis and predictive modeling. The analysis was conducted using the World Happiness dataset, which includes variables like GDP per capita, social support, life expectancy, freedom, generosity, and perceptions of corruption.

# Key Findings:

Variable Importance: Through correlation analysis, it was observed that GDP per capita, social support, and life expectancy had a strong positive correlation with happiness scores.

 Top Influential Factors: The top factors contributing to high happiness scores were identified for each variable. For instance, Finland consistently ranked high in overall happiness, emphasizing the significance of these factors.

Building the Model: A Multiple Linear Regression model was constructed to predict happiness scores. The initial model included all variables, and a stepwise approach was employed to refine the model based on statistical significance and multicollinearity.

Significant Predictors: GDP per capita, social support, and freedom to make life choices were found to be significant predictors of happiness. Generosity and perceptions of corruption did not show a significant impact.

Addressing Multicollinearity: Multicollinearity issues, particularly with GDP per capita, were addressed by removing variables and updating the model.

Model Evaluation: The model was evaluated for normality of residuals, skewness, and statistical significance. While some deviations from normality were observed, the model performed reasonably well.

# Implications:

The project's insights suggest that economic factors (GDP per capita), social support, and personal freedom play crucial roles in determining a country's happiness. Addressing financial inequalities and fostering supportive social environments may contribute to overall well-being.

# Why This Project Matters:

Understanding the determinants of happiness is vital for policymakers, organizations, and societies aiming to enhance the quality of life for their citizens. By identifying influential factors, this project provides actionable insights for shaping policies and initiatives that contribute to greater happiness and well-being on a global scale.

Given all of the infomration we have found, it seems safe to say that GDP per capita has the biggest influence on a country's overall happiness. While money may not buy happiness per se, it can provide people with a tangible improvement to their lives. This is seen explicitly in the data. GDP had a strong positive relationship with social support and healthy life expectancy. As a country starts producing more income, it is able to spend that extra cash on improvements in other areas that also have a dramatic influence on happiness; healthcare and social safety nets. Finally, freedom shows that countries operating as democracies where people have autonomy over themselves without too much overreach from large institutions live happier lives as well.

Taken together, this data suggests we should, collectively, focus our efforts on improving the financial situations of the countries with lower GDP scores. Likewise, we should also focus our resources on bringing more autonomy to more people across the globe.
