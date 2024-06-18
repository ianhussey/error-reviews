
######## NATURE HUMAN BEHAVIOUR ########
# FERNBACH, LIGHT, SCOTT, INBAR, ROZIN #
### R code for studies 1, 3, and 4 ###


# STUDY 1 #

rm(list=ls())                      # clear environment
if(!is.null(dev.list())) dev.off() # clear plots
cat("\014")                        # clear console

# load the function for obtaining bootstrapped CIs of betas #
install.packages("boot")
require(boot)
bs <- function(formula, data, indices) {
   d <- data[indices,]  
   fit <- lm(formula, data=d)
   return(coef(fit)) 
} 

# read in the study 1 data
df <- read.csv("FernbachetalNHBStudy1Data.csv")

# write out and read in data again to auto-class variables
# write out df
write.csv(df,  "temp.csv")
# read in df
df <- read.csv("temp.csv")


# create a science literacy "objective knowledge" score for all participants
# this is based on their answers to the T-F questions
# this one is sensitive to how right/wrong participants are
df$geo1score=ifelse(df$geo1==1,-3, ifelse(df$geo1==2,-2, ifelse(df$geo1==3,-1, ifelse(df$geo1==4,0, ifelse(df$geo1==5,1, ifelse(df$geo1==6,2,3)))))) 

df$geo2score=ifelse(df$geo2==1,-3, ifelse(df$geo2==2,-2, ifelse(df$geo2==3,-1, ifelse(df$geo2==4,0, ifelse(df$geo2==5,1, ifelse(df$geo2==6,2,3)))))) 

df$chem1score=ifelse(df$chem1==1,3, ifelse(df$chem1==2,2, ifelse(df$chem1==3,1, ifelse(df$chem1==4,0, ifelse(df$chem1==5,-1, ifelse(df$chem1==6,-2,-3)))))) 

df$phys1score=ifelse(df$phys1==1,3, ifelse(df$phys1==2,2, ifelse(df$phys1==3,1, ifelse(df$phys1==4,0, ifelse(df$phys1==5,-1, ifelse(df$phys1==6,-2,-3)))))) 

df$chem2score=ifelse(df$chem2==1,-3, ifelse(df$chem2==2,-2, ifelse(df$chem2==3,-1, ifelse(df$chem2==4,0, ifelse(df$chem2==5,1, ifelse(df$chem2==6,2,3)))))) 

df$geo3score=ifelse(df$geo3==1,-3, ifelse(df$geo3==2,-2, ifelse(df$geo3==3,-1, ifelse(df$geo3==4,0, ifelse(df$geo3==5,1, ifelse(df$geo3==6,2,3))))))

df$bio1score=ifelse(df$bio1==1,-3, ifelse(df$bio1==2,-2, ifelse(df$bio1==3,-1, ifelse(df$bio1==4,0, ifelse(df$bio1==5,1, ifelse(df$bio1==6,2,3)))))) 

df$bio2score=ifelse(df$bio2==1,3, ifelse(df$bio2==2,2, ifelse(df$bio2==3,1, ifelse(df$bio2==4,0, ifelse(df$bio2==5,-1, ifelse(df$bio2==6,-2,-3)))))) 

df$bio3score=ifelse(df$bio3==1,3, ifelse(df$bio3==2,2, ifelse(df$bio3==3,1, ifelse(df$bio3==4,0, ifelse(df$bio3==5,-1, ifelse(df$bio3==6,-2,-3)))))) 

df$bio4score=ifelse(df$bio4==1,-3, ifelse(df$bio4==2,-2, ifelse(df$bio4==3,-1, ifelse(df$bio4==4,0, ifelse(df$bio4==5,1, ifelse(df$bio4==6,2,3)))))) 

df$gen1score=ifelse(df$gen1==1,-3, ifelse(df$gen1==2,-2, ifelse(df$gen1==3,-1, ifelse(df$gen1==4,0, ifelse(df$gen1==5,1, ifelse(df$gen1==6,2,3)))))) 

df$gen2score=ifelse(df$gen2==1,-3, ifelse(df$gen2==2,-2, ifelse(df$gen2==3,-1, ifelse(df$gen2==4,0, ifelse(df$gen2==5,1, ifelse(df$gen2==6,2,3)))))) 

df$gen3score=ifelse(df$gen3==1,-3, ifelse(df$gen3==2,-2, ifelse(df$gen3==3,-1, ifelse(df$gen3==4,0, ifelse(df$gen3==5,1, ifelse(df$gen3==6,2,3))))))

df$gen4score=ifelse(df$gen4==1,-3, ifelse(df$gen4==2,-2, ifelse(df$gen4==3,-1, ifelse(df$gen4==4,0, ifelse(df$gen4==5,1, ifelse(df$gen4==6,2,3)))))) 

df$gen5score=ifelse(df$gen5==1,3, ifelse(df$gen5==2,2, ifelse(df$gen5==3,1, ifelse(df$gen5==4,0, ifelse(df$gen5==5,-1, ifelse(df$gen5==6,-2,-3))))))

# sum the scientific literacy variable scores to create the main variable itself
df$scilit <- (df$geo1score + df$geo2score + df$bio1score + df$bio2score + df$bio3score + df$chem1score + df$gen1score + df$phys1score + df$bio4score + df$chem2score + df$gen2score + df$gen3score + df$gen4score + df$gen5score + df$geo3score)

# create a genetics-only version of the science literacy variable
df$genlit <- (df$gen1score + df$gen2score + df$gen3score + df$gen4score + df$gen5score)

# create a no-genetics version of the science literacy variable
df$nogen.lit <- df$scilit - df$genlit

# create a binary (1 for correct, 0 for false) version of the scilit variable
df$geo1score=ifelse(df$geo1<5,0,1)  
df$geo2score=ifelse(df$geo2<5,0,1) 
df$chem1score=ifelse(df$chem1<4,1,0)
df$phys1score=ifelse(df$phys1<4,1,0) 
df$chem2score=ifelse(df$chem2<5,0,1)
df$geo3score=ifelse(df$geo3<5,0,1) 
df$bio1score=ifelse(df$bio1<5,0,1) 
df$bio2score=ifelse(df$bio2<4,1,0)
df$bio3score=ifelse(df$bio3<4,1,0)
df$bio4score=ifelse(df$bio4<5,0,1)  
df$gen1score=ifelse(df$gen1<5,0,1) 
df$gen2score=ifelse(df$gen2<5,0,1) 
df$gen3score=ifelse(df$gen3<5,0,1) 
df$gen4score=ifelse(df$gen4<5,0,1) 
df$gen5score=ifelse(df$gen5<4,1,0)

df$scilit.binary <- (df$geo1score + df$geo2score + df$bio1score + df$bio2score + df$bio3score + df$chem1score + df$gen1score + df$phys1score + df$bio4score + df$chem2score + df$gen2score + df$gen3score + df$gen4score + df$gen5score + df$geo3score)


# create separate data frames for the GMO and Climate Change participants
S1GMOsub <- subset(df, df$cond == "GMO")
S1CCsub <- subset(df, df$cond == "CC")

# descriptive characteristics of the two subsets
# GM
nrow(S1GMOsub) # N = 501
table(S1GMOsub$gender) # 214 males (42.7%), 284 females (56.7%), 3 "other/prefer not to answer"

mean(S1GMOsub$age) # mean age = 51.1 years old
nrow(S1CCsub) # N = 499
table(S1CCsub$gender) # 223 males (44.7%), 275 females (55.1%), 1 "other/prefer not to answer"
mean(S1CCsub$age) # mean age = 52.6 years old



# test correlations between concern and opposition variabes for GM, and between concern and belief variables for Climate Change 
Cor.GMextremity.df <- S1GMOsub[ c("GMOconcern", "GMOopp")] 
cor(Cor.GMextremity.df) # r = .882
Cor.CCextremity.df <- S1CCsub[ c("CCconcern", "CCbelief")] 
cor(Cor.CCextremity.df) # r = .831

# create extremity variables for GM and CC subsets, then mean-center them
S1GMOsub$extremity <- (S1GMOsub$GMOconcern + S1GMOsub$GMOopp)/2
S1CCsub$extremity <- (S1CCsub$CCbelief + S1CCsub$CCconcern)/2
S1CCsub$extremity.C <- (S1CCsub$extremity - mean(S1CCsub$extremity))
S1GMOsub$extremity.C <- (S1GMOsub$extremity - mean(S1GMOsub$extremity))

# z-score the knowledge variables and create knowledge difference scores for S1GMO and S1CC
# CC
S1CCsub$CCsubj.z <- scale(S1CCsub$CCsubj)
S1CCsub$scilit.z <- scale(S1CCsub$scilit)
S1CCsub$know.diff <- S1CCsub$CCsubj.z - S1CCsub$scilit.z
# GM
S1GMOsub$GMsubj.z <- scale(S1GMOsub$GMOsubj)
S1GMOsub$scilit.z <- scale(S1GMOsub$scilit)
S1GMOsub$know.diff <- S1GMOsub$GMsubj.z - S1GMOsub$scilit.z

### STUDY 1 ANALYSES ###

# S1 GM Subset #

# Objective knowledge means by level of extremity
aggregate(S1GMOsub$scilit ~ S1GMOsub$extremity, FUN = mean)

# Fraley
plot(aggregate(S1GMOsub$scilit ~ S1GMOsub$extremity, FUN = mean)[,1],aggregate(S1GMOsub$scilit ~ S1GMOsub$extremity, FUN = mean)
[,2], ylim=c(-5,45))



# Subjective knowledge means by level of extrmeity
aggregate(S1GMOsub$GMOsubj ~ S1GMOsub$extremity, FUN = mean)


# Fraley
plot(aggregate(S1GMOsub$GMOsubj ~ S1GMOsub$extremity, FUN = mean)[,1],aggregate(S1GMOsub$GMOsubj ~ S1GMOsub$extremity, FUN = mean)
[,2], ylim=c(1,7))




# Regressions - Relationships between knowledge and extremity


# Fraley
summary(S1GMOsub$extremity)
S1GMOsub$extremityz = scale(S1GMOsub$extremity)
options(scipen = 999)
summary( lm( know.diff ~ extremityz, data = S1GMOsub))



      # extremity of opposition on objective knowledge
            summary( lm( scilit ~ extremity, data = S1GMOsub))
            # obtain bootstrapped CI
            results <- boot(data=S1GMOsub, statistic=bs, 
                            R=1000, formula=scilit~extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # extremity 

      # extremity of opposition on self-assessed knowledge
            summary( lm( GMOsubj ~ extremity, data = S1GMOsub))
            # obtain bootstrapped CI
            results <- boot(data=S1GMOsub, statistic=bs, 
                            R=1000, formula=GMOsubj~extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # extremity
            
      # extremity of opposition on the z-scored knowledge difference score 
      # (positive values indicate overconfidence)
            summary( lm( know.diff ~ extremity, data = S1GMOsub))
            # obtain bootstrapped CI
            results <- boot(data=S1GMOsub, statistic=bs, 
                            R=1000, formula=know.diff~extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # extremity
      
      # run the extremity on knowledge models with the genetics knowledge subscale 
      # for robustness
            summary( lm( genlit ~ extremity, data = S1GMOsub))
            # obtain bootstrapped CI
            results <- boot(data=S1GMOsub, statistic=bs, 
                            R=1000, formula=genlit~extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # extremity
            
      # z-score the genetics knowledge variable to include in a diff score with self-assessed
            S1GMOsub$genlit.Z <- scale(S1GMOsub$genlit)
      
      # create the difference score again, this time with genetics knowledge for objective
            S1GMOsub$gen.diff <-  S1GMOsub$GMsubj.z - S1GMOsub$genlit.Z
      
      # run the difference score model with genetics knowledge
            summary(lm(gen.diff ~ extremity, data = S1GMOsub))
            # obtain bootstrapped CI
            results <- boot(data=S1GMOsub, statistic=bs, 
                            R=1000, formula=gen.diff~extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # extremity
            

# Fraley
S1GMOsub$extremityz = scale(S1GMOsub$extremity)
summary(lm(gen.diff ~ extremityz, data = S1GMOsub))
plot(S1GMOsub$extremityz, S1GMOsub$gen.diff)
abline((lm(gen.diff ~ extremityz, data = S1GMOsub)))
abline(h=0)

summary(lm(gen.diff ~ extremity, data = S1GMOsub))
plot(S1GMOsub$extremity, S1GMOsub$gen.diff)
abline((lm(gen.diff ~ extremity, data = S1GMOsub)))
abline(h=0)

# Fraley simple slopes
# to see if sig diff in objective and self-assessed at extreme objection
# testing intercept when extremityC = 0 (i.e., at scale scores of 7)
S1GMOsub$extremityC = S1GMOsub$extremity - 7
summary(lm(gen.diff ~ extremityC, data = S1GMOsub))
plot(S1GMOsub$extremityC, S1GMOsub$gen.diff)
abline((lm(gen.diff ~ extremityC, data = S1GMOsub)))
abline(h=0)




      # # run the extremity on knowledge models with the non-genetics knowledge subscale 
            # for robustness
            summary( lm( nogen.lit ~ extremity, data = S1GMOsub))
            # obtain bootstrapped CI
            results <- boot(data=S1GMOsub, statistic=bs, 
                            R=1000, formula=nogen.lit~extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # extremity
            
            # z-score the non-genetics knowledge variable to include in a diff score with self-assessed
            S1GMOsub$nogenlit.Z <- scale(S1GMOsub$nogen.lit)
            
            # create the difference score again, this time with non-genetics knowledge for objective
            S1GMOsub$nogen.diff <-  S1GMOsub$GMsubj.z - S1GMOsub$nogenlit.Z
        



    
      # run the difference score model with non-genetics knowledge
            summary(lm(nogen.diff ~ extremity, data = S1GMOsub))
            # obtain bootstrapped CI
            results <- boot(data=S1GMOsub, statistic=bs, 
                            R=1000, formula=nogen.diff~extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # extremity
            
      # extremity of opposition on binarized objective knowledge
            summary( lm( scilit.binary ~ extremity, data = S1GMOsub))
            # obtain bootstrapped CI
            results <- boot(data=S1GMOsub, statistic=bs, 
                            R=1000, formula=scilit.binary~extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # extremity
            
      # create the z-scored version of the binary objective knowledge variable
            S1GMOsub$scilit.bin.z <- scale(S1GMOsub$scilit.binary)
      
      # create the knowledge difference score with the binarized objective know variable
            S1GMOsub$bin.diff <- S1GMOsub$GMsubj.z - S1GMOsub$scilit.bin.z
            
      # extremity of opposition on binarized objective knowledge diff score
            summary( lm( bin.diff ~ extremity, data = S1GMOsub))
            # obtain bootstrapped CI
            results <- boot(data=S1GMOsub, statistic=bs, 
                            R=1000, formula=bin.diff~extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # extremity
            
            

# Interactions
            
      # predicting self-assessed knowledge with objective knowledge x extremity
            summary(lm(GMOsubj ~ scilit*extremity, data = S1GMOsub))
            model.interact <- lm(GMOsubj ~ scilit*extremity, data = S1GMOsub)
            # obtain bootstrapped CI
            results <- boot(data=S1GMOsub, statistic=bs, 
                            R=1000, formula=GMOsubj~scilit*extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # scilit
            boot.ci(results, type="bca", index=3) # extremity
            boot.ci(results, type="bca", index=4) # scilit*extremity
      
      # examining the potential existence of Johnson-Neyman points in the above interaction
            install.packages("probemod")
            library(probemod)
            interactionJN<- lm(GMOsubj ~ scilit*extremity, data=S1GMOsub)
            jn(interactionJN, dv = "GMOsubj", iv = "scilit", mod = "extremity", alpha = 0.05)   
            modelJN4 <- lm(GMOsubj ~ scilit * I(extremity-4.79), data = S1GMOsub)
            summary(modelJN4)
            modelJN5 <- lm(GMOsubj ~ scilit * I(extremity-7), data = S1GMOsub)
            summary(modelJN5)
            
      # predicting self-assessed knowledge with binarized objective knowledge x extremity
            summary(lm(GMOsubj ~ scilit.binary*extremity, data = S1GMOsub))
            model.interact <- lm(GMOsubj ~ scilit.binary*extremity, data = S1GMOsub)
            # obtain bootstrapped CI
            results <- boot(data=S1GMOsub, statistic=bs, 
                            R=1000, formula=GMOsubj~scilit.binary*extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # scilit
            boot.ci(results, type="bca", index=3) # extremity
            boot.ci(results, type="bca", index=4) # scilit.binary*extremity      
            
      # look for J-N points in the interaction when using the binarized scilit variable
            interactionJN<- lm(GMOsubj ~ scilit.binary*extremity, data=S1GMOsub)
            jn(interactionJN, dv = "GMOsubj", iv = "scilit.binary", mod = "extremity", alpha = 0.05)   
            modelJN4 <- lm(GMOsubj ~ scilit.binary * I(extremity-5.13), data = S1GMOsub)
            summary(modelJN4)
            modelJN5 <- lm(GMOsubj ~ scilit.binary * I(extremity-8.43), data = S1GMOsub)
            summary(modelJN5)
            
      # contrast code the political ideology levels to analyze liberal versus conservative on extremity
            S1GMOsub$lib.con <- 0*(S1GMOsub$polideo == "2") -.5*(S1GMOsub$polideo == "1") + .5*(S1GMOsub$polideo == "3") # liberal is 1, moderate is 2, conservative is 3
            S1GMOsub$mod.others <- 2/3*(S1GMOsub$polideo == "2") + (-1/3)*(S1GMOsub$polideo == "1") + (-1/3)*(S1GMOsub$polideo == "3")
      # create and run the model to examine differences between groups
            model.polideo <- lm( extremity ~ lib.con + mod.others, data = S1GMOsub)
            summary(model.polideo)
            # obtain bootstrapped CI
            results <- boot(data=S1GMOsub, statistic=bs, 
                            R=1000, formula=extremity~lib.con + mod.others)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # lib.con
  
          
              
###########################################################################          

            
# S1 Climate Change Subset  
      
# Objective knowledge means by level of extremity
aggregate(S1CCsub$scilit ~ S1CCsub$extremity, FUN = mean)
            
# Subjective knowledge means by level of extrmeity
aggregate(S1CCsub$CCsubj ~ S1CCsub$extremity, FUN = mean)
            
# Regressions - Relationships between knowledge and extremity
      # extremity of opposition on objective knowledge
            summary( lm( scilit ~ extremity, data = S1CCsub))
            # obtain bootstrapped CI
            results <- boot(data=S1CCsub, statistic=bs, 
                            R=1000, formula=scilit~extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # extremity
            
      # extremity of opposition on self-assessed knowledge
            summary( lm( CCsubj ~ extremity, data = S1CCsub))
            # obtain bootstrapped CI
            results <- boot(data=S1CCsub, statistic=bs, 
                            R=1000, formula=CCsubj~extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # extremity
            
      # extremity of opposition on the z-scored knowledge difference score 
      # (positive values indicate overconfidence)
            summary( lm( know.diff ~ extremity, data = S1CCsub))
            # obtain bootstrapped CI
            results <- boot(data=S1CCsub, statistic=bs, 
                            R=1000, formula=know.diff~extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # extremity
            
      # predicting self-assessed knowledge with objective knowledge x extremity
            summary(lm(CCsubj ~ scilit*extremity, data = S1CCsub))
            model.interact <- lm(CCsubj ~ scilit*extremity, data = S1CCsub)
            results <- boot(data=S1CCsub, statistic=bs, 
                            R=1000, formula=CCsubj~scilit*extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=4) # interaction
            
            
      # contrast code the political ideology levels to analyze liberal versus conservative on extremity
            S1CCsub$lib.con <- 0*(S1CCsub$polideo == "2") -.5*(S1CCsub$polideo == "1") + .5*(S1CCsub$polideo == "3") # liberal is 1, moderate is 2, conservative is 3
            S1CCsub$mod.others <- 2/3*(S1CCsub$polideo == "2") + (-1/3)*(
               S1CCsub$polideo == "1") + (-1/3)*(S1CCsub$polideo == "3")
      # create and run the model to examine differences between groups
            model.polideo <- lm( extremity ~ lib.con + mod.others, data = S1CCsub)
            summary(model.polideo)
            results <- boot(data=S1CCsub, statistic=bs, 
                            R=1000, formula=extremity~lib.con*mod.others)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # lib.con
            
            
 
###############################################################################           
            

# STUDY 3 (reordered replicate of S1 with reason for opposition question added) #

s3 <- read.csv("FernbachetalNHBStudy3Data.csv", na.strings = ".")

# write out and read in to auto-class variables

# write out df
write.csv(s3, "temp.csv")

# read in df
s3 <- read.csv("temp.csv")

# count number of completes
nrow(s3) # Raw N = 595 (573 after 22 people who asked to have their data removed were removed)

# remove people who didn't fully finish the study
s3 <- subset(s3, s3$Finished == "1") # New N = 555, so 18 didn't finish

# remove people who missed the attention check question #
table(s3$attcheck)
s3 <- subset(s3, s3$attcheck == "2") # New N = 537, so 18 missed the att check question
nrow(s3)

# S3 create scilit variable #
s3$geo1score=ifelse(s3$geo1==1,-3, ifelse(s3$geo1==2,-2, ifelse(s3$geo1==3,-1, ifelse(s3$geo1==4,0, ifelse(s3$geo1==5,1, ifelse(s3$geo1==6,2,3)))))) 

s3$geo2score=ifelse(s3$geo2==1,-3, ifelse(s3$geo2==2,-2, ifelse(s3$geo2==3,-1, ifelse(s3$geo2==4,0, ifelse(s3$geo2==5,1, ifelse(s3$geo2==6,2,3)))))) 

s3$chem1score=ifelse(s3$chem1==1,3, ifelse(s3$chem1==2,2, ifelse(s3$chem1==3,1, ifelse(s3$chem1==4,0, ifelse(s3$chem1==5,-1, ifelse(s3$chem1==6,-2,-3)))))) 

s3$phys1score=ifelse(s3$phys1==1,3, ifelse(s3$phys1==2,2, ifelse(s3$phys1==3,1, ifelse(s3$phys1==4,0, ifelse(s3$phys1==5,-1, ifelse(s3$phys1==6,-2,-3)))))) 

s3$chem2score=ifelse(s3$chem2==1,-3, ifelse(s3$chem2==2,-2, ifelse(s3$chem2==3,-1, ifelse(s3$chem2==4,0, ifelse(s3$chem2==5,1, ifelse(s3$chem2==6,2,3)))))) 

s3$geo3score=ifelse(s3$geo3==1,-3, ifelse(s3$geo3==2,-2, ifelse(s3$geo3==3,-1, ifelse(s3$geo3==4,0, ifelse(s3$geo3==5,1, ifelse(s3$geo3==6,2,3))))))

s3$bio1score=ifelse(s3$bio1==1,-3, ifelse(s3$bio1==2,-2, ifelse(s3$bio1==3,-1, ifelse(s3$bio1==4,0, ifelse(s3$bio1==5,1, ifelse(s3$bio1==6,2,3)))))) 

s3$bio2score=ifelse(s3$bio2==1,3, ifelse(s3$bio2==2,2, ifelse(s3$bio2==3,1, ifelse(s3$bio2==4,0, ifelse(s3$bio2==5,-1, ifelse(s3$bio2==6,-2,-3)))))) 

s3$bio3score=ifelse(s3$bio3==1,3, ifelse(s3$bio3==2,2, ifelse(s3$bio3==3,1, ifelse(s3$bio3==4,0, ifelse(s3$bio3==5,-1, ifelse(s3$bio3==6,-2,-3)))))) 

s3$bio4score=ifelse(s3$bio4==1,-3, ifelse(s3$bio4==2,-2, ifelse(s3$bio4==3,-1, ifelse(s3$bio4==4,0, ifelse(s3$bio4==5,1, ifelse(s3$bio4==6,2,3)))))) 

s3$gen1score=ifelse(s3$gen1==1,-3, ifelse(s3$gen1==2,-2, ifelse(s3$gen1==3,-1, ifelse(s3$gen1==4,0, ifelse(s3$gen1==5,1, ifelse(s3$gen1==6,2,3)))))) 

s3$gen2score=ifelse(s3$gen2==1,-3, ifelse(s3$gen2==2,-2, ifelse(s3$gen2==3,-1, ifelse(s3$gen2==4,0, ifelse(s3$gen2==5,1, ifelse(s3$gen2==6,2,3)))))) 

s3$gen3score=ifelse(s3$gen3==1,-3, ifelse(s3$gen3==2,-2, ifelse(s3$gen3==3,-1, ifelse(s3$gen3==4,0, ifelse(s3$gen3==5,1, ifelse(s3$gen3==6,2,3))))))

s3$gen4score=ifelse(s3$gen4==1,-3, ifelse(s3$gen4==2,-2, ifelse(s3$gen4==3,-1, ifelse(s3$gen4==4,0, ifelse(s3$gen4==5,1, ifelse(s3$gen4==6,2,3)))))) 

s3$gen5score=ifelse(s3$gen5==1,3, ifelse(s3$gen5==2,2, ifelse(s3$gen5==3,1, ifelse(s3$gen5==4,0, ifelse(s3$gen5==5,-1, ifelse(s3$gen5==6,-2,-3))))))

# sum scores to create the scientific literacy variable 
s3$scilit <- (s3$geo1score + s3$geo2score + s3$bio1score + s3$bio2score + s3$bio3score + s3$chem1score + s3$gen1score + s3$phys1score + s3$bio4score + s3$chem2score + s3$gen2score + s3$gen3score + s3$gen4score + s3$gen5score + s3$geo3score)

# create genetics-only science lit variable 
s3$genlit <- (s3$gen1score + s3$gen2score + s3$gen3score + s3$gen4score + s3$gen5score)

# create the non-genetics version of the science lit variable
s3$scilit.nogen <- (s3$geo1score + s3$geo2score + s3$bio1score + s3$bio2score + s3$bio3score + s3$chem1score  + s3$phys1score + s3$bio4score + s3$chem2score + s3$geo3score)

# create the binary version of the scilit variable
s3$geo1score=ifelse(s3$geo1<5,0,1)  
s3$geo2score=ifelse(s3$geo2<5,0,1) 
s3$chem1score=ifelse(s3$chem1<4,1,0)
s3$phys1score=ifelse(s3$phys1<4,1,0) 
s3$chem2score=ifelse(s3$chem2<5,0,1)
s3$geo3score=ifelse(s3$geo3<5,0,1) 
s3$bio1score=ifelse(s3$bio1<5,0,1) 
s3$bio2score=ifelse(s3$bio2<4,1,0)
s3$bio3score=ifelse(s3$bio3<4,1,0)
s3$bio4score=ifelse(s3$bio4<5,0,1)  
s3$gen1score=ifelse(s3$gen1<5,0,1) 
s3$gen2score=ifelse(s3$gen2<5,0,1) 
s3$gen3score=ifelse(s3$gen3<5,0,1) 
s3$gen4score=ifelse(s3$gen4<5,0,1) 
s3$gen5score=ifelse(s3$gen5<4,1,0)

# sum up the binary scores to create the binary science lit variable
s3$scilit.binary <- (s3$geo1score + s3$geo2score + s3$bio1score + s3$bio2score + s3$bio3score + s3$chem1score + s3$gen1score + s3$phys1score + s3$bio4score + s3$chem2score + s3$gen2score + s3$gen3score + s3$gen4score + s3$gen5score + s3$geo3score)

# descriptive characteristics of the s3 data set
nrow(s3) # N = 537
table(s3$gender) # 229 males (42.6%), 306 females (57.0%), 3 "other/prefer not to answer"
mean(s3$age) # mean age = 36.6 years old

# test correlations between concern and opposition variabes 
Cor.GMextremity.df <- s3[ c("GMOconcern", "GMOopp")] 
cor(Cor.GMextremity.df) # r = .84

# create extremity and mean-centered extremity variables
s3$extremity <- (s3$GMOconcern + s3$GMOopp)/2
s3$extremity.C <- (s3$extremity - mean(s3$extremity))

# z-score the objective and self-assessed knowledge measures
s3$GMOsubj.z <- scale(s3$GMOsubj)
s3$scilit.z <- scale(s3$scilit)
s3$scilit.bin.z <- scale(s3$scilit.binary)
s3$genlit.z <- scale(s3$genlit)
s3$nogenlit.z <- scale(s3$scilit.nogen)

# create the various versions of the knowledge difference score
s3$know.diff <- s3$GMOsubj.z - s3$scilit.z
s3$bin.know.diff <- s3$GMOsubj.z - s3$scilit.bin.z
s3$gen.know.diff <- s3$GMOsubj.z - s3$genlit.z
s3$nogen.know.diff <- s3$GMOsubj.z - s3$nogenlit.z

# Regressions - Relationships between knowledge and extremity
      # extremity of opposition on objective knowledge
            summary( lm( scilit ~ extremity, data = s3))
            # obtain bootstrapped CI
            results <- boot(data=s3, statistic=bs, 
                            R=1000, formula=scilit~extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # extremity

      # extremity of opposition on self-assessed knowledge
            summary( lm( GMOsubj ~ extremity, data = s3))
            # obtain bootstrapped CI
            results <- boot(data=s3, statistic=bs, 
                            R=1000, formula=GMOsubj~extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # extremity

      # extremity of opposition on the z-scored knowledge difference score 
      # (positive values indicate overconfidence)
            summary( lm( know.diff ~ extremity, data = s3))
            # obtain bootstrapped CI
            results <- boot(data=s3, statistic=bs, 
                            R=1000, formula=know.diff~extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # extremity
            

# Fraley
s3$extremityz = scale(s3$extremity)
summary( lm( know.diff ~ extremityz, data = s3))

      # extremity of opposition on the z-scored binary knowledge difference score 
      # (positive values indicate overconfidence)
            summary( lm( bin.know.diff ~ extremity, data = s3))
            # obtain bootstrapped CI
            results <- boot(data=s3, statistic=bs, 
                            R=1000, formula=bin.know.diff~extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # extremity
            
      # extremity of opposition on the z-scored genetics knowledge difference score 
      # (positive values indicate overconfidence)
            summary( lm( gen.know.diff ~ extremity, data = s3))
            # obtain bootstrapped CI
            results <- boot(data=s3, statistic=bs, 
                            R=1000, formula=gen.know.diff~extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # extremity
            
      # extremity of opposition on the z-scored non-genetics knowledge difference score 
      # (positive values indicate overconfidence)
            summary( lm( nogen.know.diff ~ extremity, data = s3))
            # obtain bootstrapped CI
            results <- boot(data=s3, statistic=bs, 
                            R=1000, formula=nogen.know.diff~extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # extremity

# breakdown of reason for concern/opp answers
table(s3$GMOreason) # reason 1 = food safety/health concerns

# mean extremity of whole s3 sample
mean(s3$extremity) # = 3.86

# mean extremity of the health concern subset
healthSUB <- subset(s3, s3$GMOreason == "1")
mean(healthSUB$extremity) # mean extremity of health reason subset = 4.42

# mean extremity of the rest of the people
nonhealthSUB <- subset(s3, s3$GMOreason != "1")
mean(nonhealthSUB$extremity) # mean extremity of non-health reason subset = 3.37

# make the reason for opposition binary (1 if health concerns, 0 if else)
s3$reason.binary <- ifelse(s3$GMOreason == "1", 1, 0)

# Are more extreme people more likely to choose health concerns?
# logistic regression for likelihood of health concern based on extremity
logit <- glm( reason.binary ~ extremity, family = binomial, data = s3)
summary(logit)
# get odds ratio for ^ effect size
install.packages("epiDisplay")
library(epiDisplay)
logistic.display(logit)
# obtain bootstrapped CI by creating a bootstrap CI function
logit.bootstrap <- function(data, indices) {
   d <- data[indices, ]
   fit <- glm(reason.binary ~ extremity, family = binomial, data = d)
   return(coef(fit))
}
logit.boot <- boot(data=s3, statistic=logit.bootstrap, R=1000)
boot.ci(logit.boot, type="bca", index=1) # intercept
boot.ci(logit.boot, type="bca", index=2) # extremity


# check if the main pattern of results holds for the health subset
healthSUB$scilit.z <- scale(healthSUB$scilit)
healthSUB$know.diff <- healthSUB$GMOsubj.z - healthSUB$scilit.z

# extremity on scilit
summary( lm( scilit ~ extremity, data = healthSUB))
# obtain bootstrapped CI
results <- boot(data=healthSUB, statistic=bs, 
                R=1000, formula=scilit~extremity)
boot.ci(results, type="bca", index=1) # intercept 
boot.ci(results, type="bca", index=2) # extremity

# extremity on self-assessed knowledge
summary(lm(GMOsubj ~ extremity, data = healthSUB))
# obtain bootstrapped CI
results <- boot(data=healthSUB, statistic=bs, 
                R=1000, formula=GMOsubj~extremity)
boot.ci(results, type="bca", index=1) # intercept 
boot.ci(results, type="bca", index=2) # extremity

# extremity on the knowledge difference score
summary(lm(know.diff ~ extremity, data = healthSUB))
# obtain bootstrapped CI
results <- boot(data=healthSUB, statistic=bs, 
                R=1000, formula=know.diff~extremity)
boot.ci(results, type="bca", index=1) # intercept 
boot.ci(results, type="bca", index=2) # extremity


######################################################################

# Study 4 (GENE THERAPY) #

s4 <- read.csv("FernbachetalNHBStudy4Data.csv")

# write out and read in to auto-class variables

# write out df
write.csv(s4,  "temp.csv")

# read in df
s4 <- read.csv("temp.csv")

# count number of responses
nrow(s4) # Raw N = 549

# remove people who didn't fully finish
s4 <- subset(s4, s4$Finished == "1") # New N = 534, so 15 didn't fully finish

# remove people who asked to be removed
table(s4$remove)

s4 <- subset(s4, s4$remove != "please remove my data")
s4 <- subset(s4, s4$remove != "please remove my data.")
s4 <- subset(s4, s4$remove != "Please remove my data")

nrow(s4) # New N = 524, so 10 asked to have their data removed

# remove people who failed the attention check
table(s4$attcheck)
s4 <- subset(s4, s4$attcheck == "2") # new N = 505, so 19 failed the att check.
nrow(s4)

# score answers to the T-F questions to create the science literacy variable
s4$geo1score=ifelse(s4$geo1==1,-3, ifelse(s4$geo1==2,-2, ifelse(s4$geo1==3,-1, ifelse(s4$geo1==4,0, ifelse(s4$geo1==5,1, ifelse(s4$geo1==6,2,3)))))) 

s4$geo2score=ifelse(s4$geo2==1,-3, ifelse(s4$geo2==2,-2, ifelse(s4$geo2==3,-1, ifelse(s4$geo2==4,0, ifelse(s4$geo2==5,1, ifelse(s4$geo2==6,2,3)))))) 

s4$chem1score=ifelse(s4$chem1==1,3, ifelse(s4$chem1==2,2, ifelse(s4$chem1==3,1, ifelse(s4$chem1==4,0, ifelse(s4$chem1==5,-1, ifelse(s4$chem1==6,-2,-3)))))) 

s4$phys1score=ifelse(s4$phys1==1,3, ifelse(s4$phys1==2,2, ifelse(s4$phys1==3,1, ifelse(s4$phys1==4,0, ifelse(s4$phys1==5,-1, ifelse(s4$phys1==6,-2,-3)))))) 

s4$chem2score=ifelse(s4$chem2==1,-3, ifelse(s4$chem2==2,-2, ifelse(s4$chem2==3,-1, ifelse(s4$chem2==4,0, ifelse(s4$chem2==5,1, ifelse(s4$chem2==6,2,3)))))) 

s4$geo3score=ifelse(s4$geo3==1,-3, ifelse(s4$geo3==2,-2, ifelse(s4$geo3==3,-1, ifelse(s4$geo3==4,0, ifelse(s4$geo3==5,1, ifelse(s4$geo3==6,2,3))))))

s4$bio1score=ifelse(s4$bio1==1,-3, ifelse(s4$bio1==2,-2, ifelse(s4$bio1==3,-1, ifelse(s4$bio1==4,0, ifelse(s4$bio1==5,1, ifelse(s4$bio1==6,2,3)))))) 

s4$bio2score=ifelse(s4$bio2==1,3, ifelse(s4$bio2==2,2, ifelse(s4$bio2==3,1, ifelse(s4$bio2==4,0, ifelse(s4$bio2==5,-1, ifelse(s4$bio2==6,-2,-3)))))) 

s4$bio3score=ifelse(s4$bio3==1,3, ifelse(s4$bio3==2,2, ifelse(s4$bio3==3,1, ifelse(s4$bio3==4,0, ifelse(s4$bio3==5,-1, ifelse(s4$bio3==6,-2,-3)))))) 

s4$bio4score=ifelse(s4$bio4==1,-3, ifelse(s4$bio4==2,-2, ifelse(s4$bio4==3,-1, ifelse(s4$bio4==4,0, ifelse(s4$bio4==5,1, ifelse(s4$bio4==6,2,3)))))) 

s4$gen1score=ifelse(s4$gen1==1,-3, ifelse(s4$gen1==2,-2, ifelse(s4$gen1==3,-1, ifelse(s4$gen1==4,0, ifelse(s4$gen1==5,1, ifelse(s4$gen1==6,2,3)))))) 

s4$gen2score=ifelse(s4$gen2==1,-3, ifelse(s4$gen2==2,-2, ifelse(s4$gen2==3,-1, ifelse(s4$gen2==4,0, ifelse(s4$gen2==5,1, ifelse(s4$gen2==6,2,3)))))) 

s4$gen3score=ifelse(s4$gen3==1,-3, ifelse(s4$gen3==2,-2, ifelse(s4$gen3==3,-1, ifelse(s4$gen3==4,0, ifelse(s4$gen3==5,1, ifelse(s4$gen3==6,2,3))))))

s4$gen4score=ifelse(s4$gen4==1,-3, ifelse(s4$gen4==2,-2, ifelse(s4$gen4==3,-1, ifelse(s4$gen4==4,0, ifelse(s4$gen4==5,1, ifelse(s4$gen4==6,2,3)))))) 

s4$gen5score=ifelse(s4$gen5==1,3, ifelse(s4$gen5==2,2, ifelse(s4$gen5==3,1, ifelse(s4$gen5==4,0, ifelse(s4$gen5==5,-1, ifelse(s4$gen5==6,-2,-3))))))


# total scientific literacy variable creation addition #
s4$scilit <- (s4$geo1score + s4$geo2score + s4$bio1score + s4$bio2score + s4$bio3score + s4$chem1score + s4$gen1score + s4$phys1score + s4$bio4score + s4$chem2score + s4$gen2score + s4$gen3score + s4$gen4score + s4$gen5score + s4$geo3score)

# genetics-only scilit variable
s4$genlit <- (s4$gen1score + s4$gen2score + s4$gen3score + s4$gen4score + s4$gen5score)

# scilit variable without genetics
s4$scilit.nogen <- (s4$geo1score + s4$geo2score + s4$bio1score + s4$bio2score + s4$bio3score + s4$chem1score + s4$phys1score + s4$bio4score + s4$chem2score + s4$geo3score)

# binary scilit variable
s4$geo1score=ifelse(s4$geo1<5,0,1)  
s4$geo2score=ifelse(s4$geo2<5,0,1) 
s4$chem1score=ifelse(s4$chem1<4,1,0)
s4$phys1score=ifelse(s4$phys1<4,1,0) 
s4$chem2score=ifelse(s4$chem2<5,0,1)
s4$geo3score=ifelse(s4$geo3<5,0,1) 
s4$bio1score=ifelse(s4$bio1<5,0,1) 
s4$bio2score=ifelse(s4$bio2<4,1,0)
s4$bio3score=ifelse(s4$bio3<4,1,0)
s4$bio4score=ifelse(s4$bio4<5,0,1)  
s4$gen1score=ifelse(s4$gen1<5,0,1) 
s4$gen2score=ifelse(s4$gen2<5,0,1) 
s4$gen3score=ifelse(s4$gen3<5,0,1) 
s4$gen4score=ifelse(s4$gen4<5,0,1) 
s4$gen5score=ifelse(s4$gen5<4,1,0)

s4$scilit.binary <- (s4$geo1score + s4$geo2score + s4$bio1score + s4$bio2score + s4$bio3score + s4$chem1score + s4$gen1score + s4$phys1score + s4$bio4score + s4$chem2score + s4$gen2score + s4$gen3score + s4$gen4score + s4$gen5score + s4$geo3score)

# average concern and opposition to create the extremity variable
s4$extremity <- (s4$GTconcern + s4$GTopp)/2

# z-score the objective and self-assessed knowledge measures
s4$GTsubj.z <- scale(s4$GTsubj)
s4$scilit.z <- scale(s4$scilit)
s4$scilit.bin.z <- scale(s4$scilit.binary)
s4$genlit.z <- scale(s4$genlit)
s4$nogenlit.z <- scale(s4$scilit.nogen)

# create the various versions of the knowledge difference score
s4$know.diff <- s4$GTsubj.z - s4$scilit.z
s4$bin.know.diff <- s4$GTsubj.z - s4$scilit.bin.z
s4$gen.know.diff <- s4$GTsubj.z - s4$genlit.z
s4$nogen.know.diff <- s4$GTsubj.z - s4$nogenlit.z

# Regressions - Relationships between knowledge and extremity
      # extremity of opposition on objective knowledge
            summary( lm( scilit ~ extremity, data = s4))
            # obtain bootstrapped CI
            results <- boot(data=s4, statistic=bs, 
                            R=1000, formula=scilit~extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # extremity
      # extremity of opposition on self-assessed knowledge
            summary( lm( GTsubj ~ extremity, data = s4))
            # obtain bootstrapped CI
            results <- boot(data=s4, statistic=bs, 
                            R=1000, formula=GTsubj~extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # extremity

# extremity of opposition on the z-scored knowledge difference score 
# (positive values indicate overconfidence)
            summary( lm( know.diff ~ extremity, data = s4))
            # obtain bootstrapped CI
            results <- boot(data=s4, statistic=bs, 
                            R=1000, formula=know.diff~extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # extremity

# Fraley
s4$extremityz = scale(s4$extremity)
summary( lm( know.diff ~ extremityz, data = s4))
plot(s4$extremityz, s4$know.diff)
abline(( lm( know.diff ~ extremityz, data = s4)))



# extremity of opposition on the z-scored binary knowledge difference score 
# (positive values indicate overconfidence)
            summary( lm( bin.know.diff ~ extremity, data = s4))
            # obtain bootstrapped CI
            results <- boot(data=s4, statistic=bs, 
                            R=1000, formula=bin.know.diff~extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # extremity

# extremity of opposition on the z-scored genetics knowledge difference score 
# (positive values indicate overconfidence)
            summary( lm( gen.know.diff ~ extremity, data = s4))
            # obtain bootstrapped CI
            results <- boot(data=s4, statistic=bs, 
                           R=1000, formula=gen.know.diff~extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # extremity

# extremity of opposition on the z-scored non-genetics knowledge difference score 
# (positive values indicate overconfidence)
            summary( lm( nogen.know.diff ~ extremity, data = s4))
            # obtain bootstrapped CI
            results <- boot(data=s4, statistic=bs, 
                            R=1000, formula=nogen.know.diff~extremity)
            boot.ci(results, type="bca", index=1) # intercept 
            boot.ci(results, type="bca", index=2) # extremity 


####################################################################


# QUADRATIC TESTS, STUDIES 1, 3, and 4 #
s1.GMOsubj.q <- lm(S1GMOsub$GMOsubj ~ S1GMOsub$extremity.C + I(S1GMOsub$extremity.C^2))
summary(s1.GMOsubj.q)
s1.GMOscilit.q <- lm(S1GMOsub$scilit ~ S1GMOsub$extremity.C + I(S1GMOsub$extremity.C^2))
summary(s1.GMOscilit.q)

s1.CCsubj.q <- lm(S1CCsub$CCsubj ~ S1CCsub$extremity.C + I(S1CCsub$extremity.C^2))
summary(s1.CCsubj.q)
s1.CCscilit.q <- lm(S1CCsub$scilit ~ S1CCsub$extremity.C + I(S1CCsub$extremity.C^2))
summary(s1.GMOscilit.q)

S1GMOsub$subjective.knowledge <- S1GMOsub$GMOsubj
S1CCsub$subjective.knowledge <- S1CCsub$CCsubj
s3$subjective.knowledge <- s3$GMOsubj
s4$subjective.knowledge <- s4$GTsubj


s3.GMOsubj.q <- lm(s3$subjective.knowledge ~ s3$extremity.C + I(s3$extremity.C^2))
summary(s3.GMOsubj.q)
s3.GMOscilit.q <- lm(s3$scilit ~ s3$extremity.C + I(s3$extremity.C^2))
summary(s3.GMOscilit.q)

s4.GTsubj.q <- lm(s4$subjective.knowledge ~ s4$extremity.C + I(s4$extremity.C^2))
summary(s4.GTsubj.q)
s4.GTscilit.q <- lm(s4$scilit ~ s4$extremity.C + I(s4$extremity.C^2))
summary(s4.GTscilit.q)

## Create the All studies quadratic table ##


# Fraley
install.packages("stargazer")

library(stargazer)
stargazer::stargazer(s1.GMOsubj.q, s1.GMOscilit.q, s1.CCsubj.q, s1.CCscilit.q, s2.GMOsubj.q, s2.scilit.q,   s3.GMOsubj.q, s3.GMOscilit.q, s4.GTsubj.q, s4.GTscilit.q, type = "html", out = "NHBALLstudiesQuadratics2.htm")


# EDUCATION CONTROL MODELS, STUDIES 1, 3, and 4 #

s1GMOEDU <- lm(know.diff ~ extremity + edu, data = S1GMOsub)
summary(s1GMOEDU)

s1CCEDU <- lm(know.diff ~ extremity + edu, data = S1CCsub)
summary(s1CCEDU)

s3EDU <- lm(know.diff ~ extremity + edu, data = s3)
summary(s3EDU)

s4EDU <- lm(know.diff ~ extremity + edu, data = s4)
summary(s4EDU)

## create the education controls table ##
stargazer::stargazer(s1GMOEDU, s2EDU, s3EDU, s4EDU, type = "html", out = "NHBALLstudiesEDU.htm")


# INTERACTIONS WITH POLITICAL IDEOLOGY, STUDIES 1, 3, and 4
S1GMOsub$polideo.fact <- as.factor(S1GMOsub$polideo)
S1CCsub$polideo.fact <- as.factor(S1CCsub$polideo)
s3$polideo.fact <- as.factor(s3$polideo)
s4$polideo.fact <- as.factor(s4$polideo)

S1GMOsub$polideo.C <- S1GMOsub$polideo - mean(S1GMOsub$polideo)
S1CCsub$polideo.C <- S1CCsub$polideo - mean(S1CCsub$polideo)
s3$polideo.C <- s3$polideo - mean(s3$polideo)
s4$polideo.C <- s4$polideo - mean(s4$polideo)

S1CCsub$scilit.C <- S1CCsub$scilit - mean(S1CCsub$scilit)
S1GMOsub$scilit.C <- S1GMOsub$scilit - mean(S1GMOsub$scilit)
s3$scilit.C <- s3$scilit - mean(s3$scilit)
s4$scilit.C <- s4$scilit - mean(s4$scilit)

s1GMOspolideo.int <- lm(know.diff ~ extremity.C*polideo.C, data = S1GMOsub)
summary(s1GMOspolideo.int)
s1CCpolideo.int <- lm(know.diff ~ extremity.C*polideo.C, data = S1CCsub)
summary(s1CCpolideo.int)

s1CCpolideo <- lm(extremity ~ scilit.C*polideo.C, data = S1CCsub) 
summary(s1CCpolideo)
s1GMOpolideo <- lm(extremity ~ scilit.C*polideo.C, data = S1GMOsub)
summary(s1GMOpolideo)
s3polideo <- lm(extremity ~ scilit.C*polideo.C, data = s3)
summary(s3polideo)
s4polideo <- lm(extremity ~ scilit.C*polideo.C, data = s4)
summary(s4polideo)

stargazer::stargazer(s1CCpolideo, s1GMOpolideo, type = "html", out = "NHBStudy1POLITICS.htm")


# Political ideology anovas for study 1 #

s1GMO.pol.anova <- lm(extremity ~ polideo.fact, data = S1GMOsub)
summary(s1GMO.pol.anova)

s1CC.pol.anova <- lm(extremity ~ polideo.fact, data = S1CCsub)
summary(s1CC.pol.anova)


#### FIGURES FOR THE PAPER ####

## Figure 1 ##

# done in Excel #


## Figure 2 ##

# install legend.enhanced function #

legend.enhanced <- function (x, y = NULL, legend, fill = NULL, col = par("col"), 
                             border = "black", lty, lwd, pch, angle = 45, density = NULL, 
                             bty = "o", bg = par("bg"), box.lwd = par("lwd"), box.lty = par("lty"), 
                             box.col = par("fg"), pt.bg = NA, cex = 1, pt.cex = cex, 
                             pt.lwd = lwd, xjust = 0, yjust = 1, x.intersp = 1, y.intersp = 1, 
                             adj = c(0, 0.5), text.width = NULL, text.col = par("col"), 
                             text.font = NULL, merge = do.lines && has.pch, trace = FALSE, 
                             plot = TRUE, ncol = 1, horiz = FALSE, title = NULL, inset = 0, 
                             xpd, title.col = text.col, title.adj = c(0.5,0), seg.len = 2) 
{
   if (missing(legend) && !missing(y) && (is.character(y) || 
                                          is.expression(y))) {
      legend <- y
      y <- NULL
   }
   mfill <- !missing(fill) || !missing(density)
   if (!missing(xpd)) {
      op <- par("xpd")
      on.exit(par(xpd = op))
      par(xpd = xpd)
   }
   title <- as.graphicsAnnot(title)
   if (length(title) > 1) 
      stop("invalid 'title'")
   legend <- as.graphicsAnnot(legend)
   n.leg <- if (is.call(legend)) 
      1
   else length(legend)
   if (n.leg == 0) 
      stop("'legend' is of length 0")
   auto <- if (is.character(x)) 
      match.arg(x, c("bottomright", "bottom", "bottomleft", 
                     "left", "topleft", "top", "topright", "right", "center"))
   else NA
   if (is.na(auto)) {
      xy <- xy.coords(x, y)
      x <- xy$x
      y <- xy$y
      nx <- length(x)
      if (nx < 1 || nx > 2) 
         stop("invalid coordinate lengths")
   }
   else nx <- 0
   xlog <- par("xlog")
   ylog <- par("ylog")
   rect2 <- function(left, top, dx, dy, density = NULL, angle, 
                     ...) {
      r <- left + dx
      if (xlog) {
         left <- 10^left
         r <- 10^r
      }
      b <- top - dy
      if (ylog) {
         top <- 10^top
         b <- 10^b
      }
      rect(left, top, r, b, angle = angle, density = density, 
           ...)
   }
   segments2 <- function(x1, y1, dx, dy, ...) {
      x2 <- x1 + dx
      if (xlog) {
         x1 <- 10^x1
         x2 <- 10^x2
      }
      y2 <- y1 + dy
      if (ylog) {
         y1 <- 10^y1
         y2 <- 10^y2
      }
      segments(x1, y1, x2, y2, ...)
   }
   points2 <- function(x, y, ...) {
      if (xlog) 
         x <- 10^x
      if (ylog) 
         y <- 10^y
      points(x, y, ...)
   }
   text2 <- function(x, y, ...) {
      if (xlog) 
         x <- 10^x
      if (ylog) 
         y <- 10^y
      text(x, y, ...)
   }
   if (trace) 
      catn <- function(...) do.call("cat", c(lapply(list(...), 
                                                    formatC), list("\n")))
   cin <- par("cin")
   Cex <- cex * par("cex")
   if (is.null(text.width)) 
      text.width <- max(abs(strwidth(legend, units = "user", 
                                     cex = cex, font = text.font)))
   else if (!is.numeric(text.width) || text.width < 0) 
      stop("'text.width' must be numeric, >= 0")
   xc <- Cex * xinch(cin[1L], warn.log = FALSE)
   yc <- Cex * yinch(cin[2L], warn.log = FALSE)
   if (xc < 0) 
      text.width <- -text.width
   xchar <- xc
   xextra <- 0
   yextra <- yc * (y.intersp - 1)
   ymax <- yc * max(1, strheight(legend, units = "user", cex = cex)/yc)
   ychar <- yextra + ymax
   if (trace) 
      catn("  xchar=", xchar, "; (yextra,ychar)=", c(yextra, 
                                                     ychar))
   if (mfill) {
      xbox <- xc * 0.8
      ybox <- yc * 0.5
      dx.fill <- xbox
   }
   do.lines <- (!missing(lty) && (is.character(lty) || any(lty > 
                                                              0))) || !missing(lwd)
   n.legpercol <- if (horiz) {
      if (ncol != 1) 
         warning(gettextf("horizontal specification overrides: Number of columns := %d", 
                          n.leg), domain = NA)
      ncol <- n.leg
      1
   }
   else ceiling(n.leg/ncol)
   has.pch <- !missing(pch) && length(pch) > 0
   if (do.lines) {
      x.off <- if (merge) 
         -0.7
      else 0
   }
   else if (merge) 
      warning("'merge = TRUE' has no effect when no line segments are drawn")
   if (has.pch) {
      if (is.character(pch) && !is.na(pch[1L]) && nchar(pch[1L], 
                                                        type = "c") > 1) {
         if (length(pch) > 1) 
            warning("not using pch[2..] since pch[1L] has multiple chars")
         np <- nchar(pch[1L], type = "c")
         pch <- substr(rep.int(pch[1L], np), 1L:np, 1L:np)
      }
      if (!is.character(pch)) 
         pch <- as.integer(pch)
   }
   if (is.na(auto)) {
      if (xlog) 
         x <- log10(x)
      if (ylog) 
         y <- log10(y)
   }
   if (nx == 2) {
      x <- sort(x)
      y <- sort(y)
      left <- x[1L]
      top <- y[2L]
      w <- diff(x)
      h <- diff(y)
      w0 <- w/ncol
      x <- mean(x)
      y <- mean(y)
      if (missing(xjust)) 
         xjust <- 0.5
      if (missing(yjust)) 
         yjust <- 0.5
   }
   else {
      h <- (n.legpercol + (!is.null(title))) * ychar + yc
      w0 <- text.width + (x.intersp + 1) * xchar
      if (mfill) 
         w0 <- w0 + dx.fill
      if (do.lines) 
         w0 <- w0 + (seg.len + x.off) * xchar
      w <- ncol * w0 + 0.5 * xchar
      if (!is.null(title) && (abs(tw <- strwidth(title, units = "user", 
                                                 cex = cex) + 0.5 * xchar)) > abs(w)) {
         xextra <- (tw - w)/2
         w <- tw
      }
      if (is.na(auto)) {
         left <- x - xjust * w
         top <- y + (1 - yjust) * h
      }
      else {
         usr <- par("usr")
         inset <- rep_len(inset, 2)
         insetx <- inset[1L] * (usr[2L] - usr[1L])
         left <- switch(auto, bottomright = , topright = , 
                        right = usr[2L] - w - insetx, bottomleft = , 
                        left = , topleft = usr[1L] + insetx, bottom = , 
                        top = , center = (usr[1L] + usr[2L] - w)/2)
         insety <- inset[2L] * (usr[4L] - usr[3L])
         top <- switch(auto, bottomright = , bottom = , bottomleft = usr[3L] + 
                          h + insety, topleft = , top = , topright = usr[4L] - 
                          insety, left = , right = , center = (usr[3L] + 
                                                                  usr[4L] + h)/2)
      }
   }
   if (plot && bty != "n") {
      if (trace) 
         catn("  rect2(", left, ",", top, ", w=", w, ", h=", 
              h, ", ...)", sep = "")
      rect2(left, top, dx = w, dy = h, col = bg, density = NULL, 
            lwd = box.lwd, lty = box.lty, border = box.col)
   }
   xt <- left + xchar + xextra + (w0 * rep.int(0:(ncol - 1), 
                                               rep.int(n.legpercol, ncol)))[1L:n.leg]
   yt <- top - 0.5 * yextra - ymax - (rep.int(1L:n.legpercol, 
                                              ncol)[1L:n.leg] - 1 + (!is.null(title))) * ychar
   if (mfill) {
      if (plot) {
         if (!is.null(fill)) 
            fill <- rep_len(fill, n.leg)
         rect2(left = xt, top = yt + ybox/2, dx = xbox, dy = ybox, 
               col = fill, density = density, angle = angle, 
               border = border)
      }
      xt <- xt + dx.fill
   }
   if (plot && (has.pch || do.lines)) 
      col <- rep_len(col, n.leg)
   if (missing(lwd) || is.null(lwd)) 
      lwd <- par("lwd")
   if (do.lines) {
      if (missing(lty) || is.null(lty)) 
         lty <- 1
      lty <- rep_len(lty, n.leg)
      lwd <- rep_len(lwd, n.leg)
      ok.l <- !is.na(lty) & (is.character(lty) | lty > 0) & 
         !is.na(lwd)
      if (trace) 
         catn("  segments2(", xt[ok.l] + x.off * xchar, ",", 
              yt[ok.l], ", dx=", seg.len * xchar, ", dy=0, ...)")
      if (plot) 
         segments2(xt[ok.l] + x.off * xchar, yt[ok.l], dx = seg.len * 
                      xchar, dy = 0, lty = lty[ok.l], lwd = lwd[ok.l], 
                   col = col[ok.l])
      xt <- xt + (seg.len + x.off) * xchar
   }
   if (has.pch) {
      pch <- rep_len(pch, n.leg)
      pt.bg <- rep_len(pt.bg, n.leg)
      pt.cex <- rep_len(pt.cex, n.leg)
      pt.lwd <- rep_len(pt.lwd, n.leg)
      ok <- !is.na(pch)
      if (!is.character(pch)) {
         ok <- ok & (pch >= 0 | pch <= -32)
      }
      else {
         ok <- ok & nzchar(pch)
      }
      x1 <- (if (merge && do.lines) 
         xt - (seg.len/2) * xchar
         else xt)[ok]
      y1 <- yt[ok]
      if (trace) 
         catn("  points2(", x1, ",", y1, ", pch=", pch[ok], 
              ", ...)")
      if (plot) 
         points2(x1, y1, pch = pch[ok], col = col[ok], cex = pt.cex[ok], 
                 bg = pt.bg[ok], lwd = pt.lwd[ok])
   }
   xt <- xt + x.intersp * xchar
   if (plot) {
      if (is.na(title.adj[2])) { title.adj[2] <- 0}
      if (!is.null(title)) 
         text2(left + w * title.adj[1], top - ymax, labels = title, 
               adj = c(title.adj[1], title.adj[2]), cex = cex, col = title.col)
      text2(xt, yt, labels = legend, adj = adj, cex = cex, 
            col = text.col, font = text.font)
   }
   invisible(list(rect = list(w = w, h = h, left = left, top = top), 
                  text = list(x = xt, y = yt)))
}


## create the figure itself
install.packages("visreg")
require(visreg)

interaction.f2 <- lm(GMOsubj ~ scilit*extremity, data = S1GMOsub)

# tiff("NHBFigure2.tiff", units="mm", width=180, height=130, res=350)
pdf("NHBFigure2.pdf")
visreg(interaction.f2,"scilit", by="extremity",
       fill=list(col=grey(c(0.7), alpha=0.6)),
       line=list(lty=c("dotted", "solid", "twodash"), col="black"),
       font.lab = 2,
       ylim = c(0,7),
       xlab = "Objective knowledge",
       ylab = "Self-assessed knowledge",
       overlay = TRUE, partial = FALSE, rug = FALSE, legend = FALSE)
legend.enhanced("bottomright", 
                c("Extremity: 7", "Extremity: 4.5", "Extremity: 2"),
                lty=c(6,1,3), ## this is the line type 
                lwd=3,
                col=c("black", "black", "black"),
                bty="n",
                horiz=FALSE,
                title.adj=c(1,0),
                title.col="black",
                seg.len =2,
                cex=1,
                yjust=.3,
                text.font = NULL,
                inset = 0)
dev.off()

## Figure 3 ##

# read in the data set #
df <- read.csv("Sydney_GMOData_NLversion.csv", na.strings = ".")

row1 <- ggplot(df, aes(x=Comp_Opp, y=OK)) +
   geom_smooth(method = 'lm', se = T, formula = y ~ x, col = "black") +
   theme_bw() +
   xlab(' ') +
   ylab('Objective knowledge') +
   scale_y_continuous() +
   facet_grid(~Country) +
   theme(
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.background = element_blank(),
      axis.line = element_line(colour = "black"),
      plot.title = element_text(hjust = 0.5, size = 14),
      strip.text.x = element_text(size=12, angle=0),
      text = element_text(size = 12)
   )

row2 <- ggplot(df, aes(x=Comp_Opp, y=SK)) +
   geom_smooth(method = 'lm', se = T, formula = y ~ x, col = "black") +
   theme_bw() +
   xlab('Extremity of opposition ') +
   ylab('Self-assessed knowledge') +
   scale_y_continuous() +
   facet_grid(~Country) +
   theme(
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.background = element_blank(),
      axis.line = element_line(colour = "black"),
      plot.title = element_text(hjust = 0.5, size = 14),
      strip.text.x = element_text(size=12, angle=0),
      text = element_text(size = 12)
   )

tiff("NHBFigure3.tiff", units="mm", width=180, height=120, res=350)
grid.arrange(row1, row2, nrow=2)
dev.off()


fraley2 <- read.csv("FernbachetalNHBStudy2Data.csv")

