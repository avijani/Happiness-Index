#Happiness Index 2019
library(tidyverse)    # metapackage of all tidyverse packages
library(ggcorrplot)   # for correlation plots
library(moments)

# Add file 
file_path <- "C:/Users/avija/OneDrive/Desktop/AVI JANI PROJECTS/R Happiness Index/2019.csv"

# Check the files in the directory
list.files(path = "../input")


##PART 1 - READ AND UNDERSTAND THE DATA
# happiness data
happy <- read_csv(file_path)


# Set options
options(
  digits = 2,
  repr.plot.width = 10,
  repr.plot.height = 8
)

# Read data.
happy <- read.csv(
  file = file_path,
  header = TRUE
)
 head(happy)

 summary(happy)

 str(happy)

 #check if there are any missing values
 sum(is.na(happy))

#PART 2 - CREATE CUSTOM COLORS USING VIRIDIS PACKAGE
 # Colors
 
 v_color <- viridis::viridis(
   n = nrow(happy)
 )
 
 happy$color <- v_color[Matrix::invPerm(
   p = order(
     x = happy$Score
   )
 )]
 
#PART 3 - CORRELATION ANALYSIS USING BUILT-IN PARIS() FUNCTION
 pairs(
   formula = Score ~ GDP.per.capita + Social.support +
     Healthy.life.expectancy + Freedom.to.make.life.choices +
     Generosity + Perceptions.of.corruption,
   data = happy,
   col = happy$color,
   pch = 19
 )
 
#CREATE CORRELATION MATRIX
 options(repr.plot.width = 12, repr.plot.height = 10)
 cor_happy <- subset(happy, select = -c(1, 2, 10))
 
 corr <- round(cor(cor_happy), 1)
 
 
 ggcorrplot(corr, hc.order = TRUE,
            #type = "lower",
            lab = TRUE,
            lab_size = 4,
            method = "circle",
            colors = c("red", "white", "green"),
            title = "Correlation of Variables",
            ggtheme = theme_bw)

#PART 4 - RANKING THE TOP COUNTRIES BY EACH CATEGORY
 options(repr.plot.width = 12, repr.plot.height = 10)
 top_score <- head(happy, n = 20)
 top_score$Country.or.region <- factor(top_score$Country.or.region, levels = top_score$Country.or.region)
 
 theme_set(theme_bw())
 
 ggplot(data = top_score, aes(x = Country.or.region, y = Score)) +
   geom_point(size = 3) +
   geom_segment(aes(x = Country.or.region,
                    xend = Country.or.region,
                    y = 0,
                    yend = Score)) +
   labs(title = "Top 20 Countries by Overall Happiness",
        x = "Countries",
        y = "Score") +
   theme(axis.text.x = element_text(angle = 65, vjust = 0.6, size = 14),
         text = element_text(size = 16))
 
#GDP PER CAPITA
 options(repr.plot.width = 12, repr.plot.height = 10)
 top_gdp <- happy[order(-happy$GDP.per.capita),]
 top_gdp <- head(top_gdp, n = 20)
 top_gdp$Country.or.region <- factor(top_gdp$Country.or.region, levels = top_gdp$Country.or.region)
 
 theme_set(theme_bw())
 
 ggplot(data = top_gdp, aes(x = Country.or.region, y = GDP.per.capita)) +
   geom_point(size = 3) +
   geom_segment(aes(x = Country.or.region,
                    xend = Country.or.region,
                    y = 0,
                    yend = GDP.per.capita)) +
   labs(title = "Top 20 Countries by GDP",
        x = "Countries",
        y = "GDP Per Capita") +
   theme(axis.text.x = element_text(angle = 65, vjust = 0.6, size = 14),
         text = element_text(size = 16))
 
#SOCIAL SUPPORT
 options(repr.plot.width = 12, repr.plot.height = 10)
 top_social <- happy[order(-happy$Social.support),]
 top_social <- head(top_social, n = 20)
 top_social$Country.or.region <- factor(top_social$Country.or.region, levels = top_social$Country.or.region)
 
 theme_set(theme_bw())
 
 ggplot(data = top_social, aes(x = Country.or.region, y = Social.support)) +
   geom_point(size = 3) +
   geom_segment(aes(x = Country.or.region,
                    xend = Country.or.region,
                    y = 0,
                    yend = Social.support)) +
   labs(title = "Top 20 Countries by Social Support",
        x = "Countries",
        y = "Social Support") +
   theme(axis.text.x = element_text(angle = 65, vjust = 0.6, size = 14),
         text = element_text(size = 16))
 
#LIFE EXPECTANCY
 options(repr.plot.width = 12, repr.plot.height = 10)
 top_life <- happy[order(-happy$Healthy.life.expectancy),]
 top_life <- head(top_life, n = 20)
 top_life$Country.or.region <- factor(top_life$Country.or.region, levels = top_life$Country.or.region)
 
 theme_set(theme_bw())
 
 ggplot(data = top_life, aes(x = Country.or.region, y = Healthy.life.expectancy)) +
   geom_point(size = 3) +
   geom_segment(aes(x = Country.or.region,
                    xend = Country.or.region,
                    y = 0,
                    yend = Healthy.life.expectancy)) +
   labs(title = "Top 20 Countries by Life Expectancy",
        x = "Countries",
        y = "Life Expectancy") +
   theme(axis.text.x = element_text(angle = 65, vjust = 0.6, size = 14),
         text = element_text(size = 16))
 
#FREEDOM
 options(repr.plot.width = 12, repr.plot.height = 10)
 top_free <- happy[order(-happy$Freedom.to.make.life.choices),]
 top_free <- head(top_free, n = 20)
 top_free$Country.or.region <- factor(top_free$Country.or.region, levels = top_free$Country.or.region)
 
 theme_set(theme_bw())
 
 ggplot(data = top_free, aes(x = Country.or.region, y = Freedom.to.make.life.choices)) +
   geom_point(size = 3) +
   geom_segment(aes(x = Country.or.region,
                    xend = Country.or.region,
                    y = 0,
                    yend = Freedom.to.make.life.choices)) +
   labs(title = "Top 20 Countries by Freedom",
        x = "Countries",
        y = "Freedom") +
   theme(axis.text.x = element_text(angle = 65, vjust = 0.6, size = 14),
         text = element_text(size = 16))

#GENEROSITY
 options(repr.plot.width = 12, repr.plot.height = 10)
 top_gen <- happy[order(-happy$Generosity),]
 top_gen <- head(top_gen, n = 20)
 top_gen$Country.or.region <- factor(top_gen$Country.or.region, levels = top_gen$Country.or.region)
 
 theme_set(theme_bw())
 
 ggplot(data = top_gen, aes(x = Country.or.region, y = Generosity)) +
   geom_point(size = 3) +
   geom_segment(aes(x = Country.or.region,
                    xend = Country.or.region,
                    y = 0,
                    yend = Generosity)) +
   labs(title = "Top 20 Most Generous Countries",
        x = "Countries",
        y = "Generosity") +
   theme(axis.text.x = element_text(angle = 65, vjust = 0.6, size = 14),
         text = element_text(size = 16))
 
#PERCEPTION OF CORRUPTION - COUNTRIES WITH MOST TRUST
 options(repr.plot.width = 12, repr.plot.height = 10)
 top_trust <- happy[order(-happy$Perceptions.of.corruption),]
 top_trust <- head(top_trust, n = 20)
 top_trust$Country.or.region <- factor(top_trust$Country.or.region, levels = top_trust$Country.or.region)
 
 theme_set(theme_bw())
 
 ggplot(data = top_trust, aes(x = Country.or.region, y = Perceptions.of.corruption)) +
   geom_point(size = 3) +
   geom_segment(aes(x = Country.or.region,
                    xend = Country.or.region,
                    y = 0,
                    yend = Perceptions.of.corruption)) +
   labs(title = "Top 20 Countries With the Most Trust",
        x = "Countries",
        y = "Perceptions of Corruption") +
   theme(axis.text.x = element_text(angle = 65, vjust = 0.6, size = 14),
         text = element_text(size = 16))
 
#PART 5 - BUILDING LINEAR REGRESSION MODEL
 ### Multiple linear regression model with all parameters included.
 
 lm_happy <- lm(
   formula = Score ~ GDP.per.capita + Social.support +
     Healthy.life.expectancy + Freedom.to.make.life.choices +
     Generosity + Perceptions.of.corruption,
   data = happy
 )
 summary(lm_happy)
 
 #ANOVA
 
 options(scipen=-100, digits = 3)
 anova(lm_happy)

 # Get ANOVA table in a tabular format
 anova_table <- tidy(anova(lm_happy))
 
 # Round off values to two decimal places for numeric columns
 rounded_anova_table <- anova_table %>%
   mutate_if(is.numeric, round, 2)
 
 # View the rounded ANOVA table in the RStudio viewer
 View(rounded_anova_table)
 
 ##PART 6 - Testing Multicollinearity
 #Original Model VIF
 options(scipen=10, digits=3)
 vif <- round(car::vif(lm_happy),2)
 
 cat("VIF of Original model\n")
 cat("##########################\n\n")
 
 cat("GDP Per Capita: ", vif[1])
 cat("\nSocial Support: ", vif[2])
 cat("\nLife Expectancy: ", vif[3])
 cat("\nFreedom: ", vif[4])
 cat("\nGenerosity: ", vif[5])
 cat("\nPerceptions of Corruption: ", vif[6])
 
 paste0("R-squared: ", round(summary(lm_happy)$r.squared, 2))
 
#updated model VIF
 lm_new <- update(
   object = lm_happy,
   formula = Score ~ .  - Generosity - Healthy.life.expectancy - Perceptions.of.corruption)
 summary(lm_new)
 anova(lm_new, lm_happy)

 cat("VIF of New model\n")
 cat("#################\n\n")
 vif_2 <- round(car::vif(lm_new), 2)
 
 cat("GDP Per Capita: ", vif_2[1])
 cat("\nSocial Support: ", vif_2[2])
 # cat("\nLife Expectancy: ", vif_2[3])
 cat("\nFreedom: ", vif_2[3])
 # cat("\nPercpetions of Corruption: ", vif_2[4])
 
 ##PART 7 - DISTRIBUTION OF RESIDUALS
 #TEST THE RELIABILITY OF MODEL
 # Q-Q PLOT
 
 par(mfrow=c(2,2))
 qqnorm(lm_happy$residuals);qqline(lm_happy$residuals)
 qqnorm(lm_new$residuals);qqline(lm_new$residuals)
 
 #HISTOGRAMS
 options(repr.plot.width = 14, repr.plot.height = 12)
 par(mfrow=c(2,2))
 h <- hist(
   x = lm_happy$residuals,
   xlab = "Residuals of Original Model",
   ylab = "Count",
   main = "Histogram of Original Model's Residuals",
   las = 1,
   ylim = c(0,65),
   col = heat.colors(8)
 )
 text(
   x = h$mids,
   y = h$counts,
   labels = h$counts,
   adj = c(0.5,-0.5)
 )
 h1 <- hist(
   x = lm_new$residuals,
   xlab = "Residuals of New Model",
   ylab = "Count",
   main = "Histogram of New Model's Residuals",
   las = 1,
   xlim = c(-3, 2),
   col = heat.colors(8)
 )
 text(
   x = h1$mids,
   y = h1$counts,
   labels = h1$counts,
   adj = c(0.5,-0.5)
 )
 
 #SKEWNESS
 cat("##### Skewness of models #####\n\n")
 
 cat("Skewness of original model: ", round(skewness(lm_happy$residuals),3))
 cat("\nSkewness of new model: ", round(skewness(lm_new$residuals),3))
 
#NORMALITY TEST
 shapiro.test(lm_happy$residuals)
 shapiro.test(lm_new$residuals)