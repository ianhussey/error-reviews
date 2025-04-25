# Points of note

In this section, I'll draw your attention to things that stood out to me when reading the review. To help me write the decision and recommendation, I would particularly like you to respond to these points in your author response, should you choose to submit one.

- The original article states that Study 2 is a replication of Study 1, but a different analytic approach was used. When the reviewer applied Study 1's analytic appraoch to Study 2 and vice versa, different results were found suggesting that a close replication of the analytic strategy does not replicate the effects.
- The reviewer estimated the reliability of the M-Ratio measure and found it to be quite low especially in Study 3 (Study 1 = .64, Study 2 = .19). This raises some concerns about measurement given the generality of the claims. 
- This point about measurement raises the more general point that the article appears to make two claims, one explicitly (that psychiatric symptom dimensions are associated with dissociable shifts in metacognition but not task performance) and one implicitly (that there is a robust factor structure among psychiatric symptom dimensions). This latter implicit claim is quite far reaching, give that the structure of psychopathology is hotly debated. This may represent a key auxiliary hypothesis. 
- The reviewer did not raise this point themselves, but I would also ask you to consider whether any claims in the article rely on the interpretation of non-significant effects as evidence of absence (see Aczel et al. 2018 10.1177/2515245918773742).

# Non errors

Given most researchers experience with doing pre-publication peer review, we have noticed a general tendency to overgeneralise the skill of writing pre-publication peer reviews to writing error reviews. We do our best to instruct reviewers about the scope of error reviews, but some things still slip through. In this section, I'll mention some things that the reviewer raised which I can tell you ahead of time that the full report will label as not errors, which you therefore do not need to respond to, and go beyond the scope of an error review.

- Reliance on M-turk populations: not itself an error.
  - Although the reviewer's point about generalisability of the claims is worth considering. While the reviewer made efforts to compare the sample means to known scale means and concluded that there were no known substantial deviations, I think this risks being overly simplistic (ie ignores variation and distribution) and would not rely too heavily on it. 





# notes to self



the factors used in study 2 are derived from the data in an exploratory fashion and then used to test differences between them in a confirmatory fashion, without validating these superordinate factors. The concept and specifics of superordinate psychopathology factors are contentious, and this purely data driven approach may suffer conceptually or in terms of replicability. Risk of overfitting here.



“Together, these results reveal that the AD and CIT symptom dimensions exert equal and opposite effects on two key aspects of metacognition”

- assumes the symptom dimensions are a valid clustering, but they are data driven and not employed in other studies cited.
- "equal" and opposite? Analyses don't provide evidence for equality.

“In this article, we show that self-reported psychiatric symptoms are associated with specific shifts in confidence but not performance in a controlled perceptual decision-making task.” 

- no, they show how symptom CLUSTERS are assoicated with confidence.
- and they do not show evidence for the null in performance.
  - also "despite accuracy and parameters governing decision formation remaining unaffected" - no evidence for null

## overclaiming

"Taken together, our findings reveal that shifts in metacognitive evaluation represent a specific and pervasive behavioral correlate of subclinical psychopathology."

- specific to what? the factors are general



“Our findings indicate a specific and pervasive link between metacognition and mental health.” (Rouault et al., 2018, p. 443)

- only between TYPES of mental health and metacognition. 



"pervasive"

- no estimate of prevalence is made, this is all group level stats. this claim either doesnt meet the word's techncial meaning, or it is non techncial to the point of not being a clear claim.



“A relationship between lower confidence level and an AD symptom dimension is consistent with depression’s being characterized by pervasive negative shifts in self-evaluation (5,47,48).” (Rouault et al., 2018, p. 447)

- but AD is made up of anxiety too, which isn't characterised by this. this risks cherry picking evidence. if its specific to depression, show that.

# untested

Reliability of tasks?

# things not done

- apply study 1 analysis to study 2
- apply study 2's metacognitive efficiency metric in study 1 analyses
- do factor analysis on study 1's items to see if at least the DA factor is recovered
  - basically avoid overfitting
- reliability or validity of the accuracy, confidence or efficiency scores
  - eg alter get_full_perceptual_task_dat_exp_2.R to compute split half reliability for the different metrics