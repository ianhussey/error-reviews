Run the R file in the root folder (reanalyse_rouault_et_al.R). The working
directory must be in that folder too. For inspection of the validation
scripts, navigate to the respective script in Scripts/validation/.

For an easy access to the results that you should see if you run these
scripts, here is the output it generates for me. Also see the most important
reanalysis plot in file "factor_loadings_exp_1_and_2.pdf" where it is shown
that the factor solution for Experiment 1 (which was not shown in the
original study) looks similar to that of Experiment 2. However, despite this
match, the relation to confidences are only partially replicated: In
Experiment 1, the factor Implusivity did not coincide with overconfidence.

```
#  -----------------------------------------------------------------------------

> eval(parse("C:\\Users\\saschameyen\\Desktop\\Error_Reviews_Rouault_et_al_201$  
                                                                                 
                                                    
                                                                                 
Unreported Exclusion of Trials                                                   
                                                                                 
  The authors seem to have excluded some trials which was not reported in the    
  paper. But these exclusions seem to be very minor with less than 2% of the     
  trials being excluded.                                                         
                                                                                 
                                                                                 
Binning of Stimulus Difficulty                                                   
                                                                                 
  Even though binning of stimulus difficulty seems to have been done post hoc    
  without justfication, the results look very smooth so that there is no         
  doubt about the validity of their reports on accuracy and RT relative to       
  the stimulus difficulty in Experiment 1.                                       
                                                                                 
                                                                                 
Power Analysis                                                                   
                                                                                 
  The regression coefficient based on which they calculated the sample size      
  for Experiment 2 is closely reproduced. Slight deviations would not            
  drastically change the number of required participants. No problem here.       
                                                                                 
                                                                                 
Match Between Reproduced and Original Experiment 2 Data                          
                                                                                 
  The extracted values look very consistent with the exception of M-Ratio        
  fits, which are different because I used a different fitting method.           
                                                                                 
                                                                                 
MTurk Sample                                                                     
                                                                                 
  The Mechanical Turk sample yielded similar mean scores on the psychiatric      
  screening questionnaires as the reference populations that were used in the    
  original studies of these questionnaires. To my surprise, this seems like a    
  fairly comparable population.                                                  
                                                                                 
                                                                                 
Drift-Diffusion-Model Fit                                                        
                                                                                 
  I could not reproduce the drift-diffusion model (DDM) fits with their          
  referenced functions. However, I did a small simulation reanalysis based on    
  which the parameters seem valid. There is only one small inaccuracy:           
  Non-decision times are off by 300 ms. This is likely due to the fact that      
  the authors inconsistently computed the response times including the 300 ms    
  stimulus presentation time (for the DDM fit) and without (for compiling the    
  data set).                                                                     
                                                                                 
                                                                                 
M-Ratio Fit                                                                      
                                                                                 
  I chose another M-Ratio fit than the authors and found deviating values.       
  After accounting for extreme outliers, there is a relatively good              
  correlation between my and their M-Ratio values.                               
                                                                                 
                                                                                 
Model Fits with Bayesian Information Criterion                                   
                                                                                 
  Although I do not get exactly the same BIC values in my reanalyses, the        
  qualitative pattern of results is very consistent with what the authors        
  report.                                                                        
                                                                                 
                                                                                 
Problem With Staircase Procedure and M-Ratio                                     
                                                                                 
  Although I hypothesized that there is a confound with the variability of the   
  staircase procedure influencing the range of presented difficulties and        
  thereby the difficulty how giving appropriate confidence ratings, there        
  seems to be no problem here. There were no noteworthy difference in the        
  variability of the staircases between participants.                            
                                                                                 
                                                                                 
Factor Analysis in Experiment 1                                                  
                                                                                 
  The factor solution of Experiment 1 mirrors that of Experiment 2. There are    
  three distinct factors for anxious-depression, compulsiveness, and social      
  withdrawal.                                                                    
                                                                                 
                                                                                 
Reliabilities of Perceptual Task Measures                                        
                                                                                 
  The reliabilities of accuracies and mean confidence ratings in Experiment 1    
  are very good with values of around .90 and .99. The reliability of            
  M-Ratio is less good with Rel ~ .64.                                           
                                                                                 
  In Experiment 2, the accuracy was kept constant by a staircase procedure.      
  This drops the reliability of accuracy down to around .5. The reliability      
  of mean confidences remains high at .99. The reliability of M-Ratio drops      
  further down to .19.                                                           
                                                                                 
  Note that I used Monte Carlo bootstrap simulations to determine these          
  reliabilities I did not use stratification because there were very trials      
  per difficulty condition within the participants. So these results are only    
  a rough approximation. But split-half reliabilities would also be              
  problematic because I am not aware of a Spearman-Brown-like correction for     
  reliabilities when using split-half reliabilities on M-Ratio.                  
                                                                                 
                                                                                 
Factor Analysis and Regression                                                   
                                                                                 
  For Experiment 2, the results seem stable even after applying cross            
  validation (compute factors from a training set, then compute factor scores    
  and regression coefficients from a separate test set).                         
                                                                                 
  However for Experiment 1, the results look different. Even after matching      
  the factors to those of Experiment 2, we only find partially the same          
  results. Consistently, factor Anxious-Depression (AD) has a negative           
  association with mean confidence. But there is no positive association         
  between factor Compulsivity (C) and mean confidence. Moreover,                 
  Social-Withdrawal (SW) also has a clear negative association with mean         
  confidence. This also shows up in the cross validation analysis.               
                                                                                 
  Additionally, correlation analyses based on single questionnaires seem to      
  support these findings. (But note that the regression analyses controlled      
  for covariates gender, age, and IQ which is not reflected in these             
  correlations.)                                                                 
                                                                                 
                                                                                 
Evaluate Factors of Experiment 2 in Experiment 1                                 
                                                                                 
  When computing the scores for participants in Experiment 1 based on the        
  factor loadings from Experiment 2, we find deviations again. The factors       
  Anxious-Depression (AD) and Social Withdrawl (SW) are negatively related to    
  the mean confidences. But Compulsivity (C) does not seem to have an effect     
  anymore and rather points towards the negative direction contrary to the       
  reported results.                                                              
                                                                                 
                                                                                 
#  -----------------------------------------------------------------------------
```