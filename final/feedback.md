You guys did some solid work here. Diego's deep-learning pipeline with Optuna, the Type 1 vs Type 2 split exploration in `Milestone_10`, and a deployed Streamlit app at `dlqui/app_risk` all reflect substantive effort. But the report itself is well below what the rubric asks for, and when I dug into the supporting notebooks I found a contradiction that concerns me more than any of the formatting issues. I'll lead with that, then walk through the rest.

## The central issue: your two modeling threads don't agree, and the higher numbers don't reconcile with the code

You report two parallel sets of results in the same submission without explaining the discrepancy:

- Diego's pipeline (`Milestone_9_3_Quispe.ipynb`): Logistic Regression AUC 0.767, Random Forest AUC 0.775, XGBoost AUC 0.778, DNN AUC 0.776. Everything in a tight band.
- Akhil & Lulu's pipeline (`Modelling_2024r.ipynb`): Random Forest AUC 0.87, XGBoost Base AUC 0.90, XGBoost Tuned AUC 0.87.

That's not a small gap — same data source, similar features, ~12 AUC points apart. The report should have explained what's going on. Instead it just lists both as parallel findings and then declares XGBoost Base "the strongest performer" without acknowledging the inconsistency at all.

When I opened `Modelling_2024r.ipynb` to understand the discrepancy, I found that the only XGBoost Tuned output actually retained in the notebook shows **ROC-AUC = 0.5027** on the held-out test set (with macro F1 = 0.48 and recall on the positive class = 0.33). That is random performance — the model has learned essentially nothing about the minority class. Yet the submission reports "XGBoost (Tuned): AUC ~0.87."

I'm not sure what happened - my assumption is that the RF/XGB-Base cells were run at some earlier point and produced the 0.87/0.90 numbers, then the SMOTETomek + RandomSearch pipeline was changed, the tuned run came out random, and nobody went back to verify that the headline numbers still matched. The CV F1 score in that cell (0.7747) is computed on SMOTE-resampled data, which inflates it; the honest test-set number is 0.50. If the same drift affected the un-tuned XGB and RF cells (whose outputs are no longer in the notebook), then the entire higher results table may not be reproducible.

This discrepancy is the biggest problem here. Diego's numbers are internally consistent. The Akhil/Lulu numbers either reflect an earlier pipeline that no longer runs the way it did, or they're being reported alongside a current pipeline that gives a very different answer. Either way, the report should have caught it.

## The report itself is not at the standard the rubric requested

This is the second major issue, and you're missing several items explicitly called out. I did not apply the automatic 2-point format deduction for the work-folder violation alone, but the cumulative gap is significant:

- **No visualizations in the report.** The rubric is explicit: "include visualizations (2–5) that will help the reader to understand your data" plus result visualizations. You have none in the submission — just bullet points. There ARE figures in the notebooks (ROC curves, feature importance) but the report doesn't pull them in.
- **No confusion matrices, no PR curves in the report.** The rubric says accuracy is usually not enough — you need F1, confusion matrices, PR curves. Diego's notebook computes a best-F1 threshold (cell 15 of M9_3 shows threshold 0.58 lifting F1 from 0.44 to 0.45) but none of this makes it into the report.
- **Literature Review is two bullet points.** This is supposed to establish stakeholder need and motivate method choice from prior work. You have "class imbalance is a major challenge" and "SMOTE/class weighting are common" with a list of references that aren't actually engaged with in the text.
- **Stakeholder framing is unchanged from midterm.** At midterm I flagged "I don't have a clear use case in mind. Why do we want to identify correlates exactly? What will we do with that information?" The final report has the same problem — "public health researchers and healthcare policymakers" is a placeholder, not a use case. What decision does this model inform? Who acts on a 0.77-AUC risk score, and at what threshold, for what intervention? That's the question the rubric is asking when it talks about "convincing arguments that connect the identified need with the ML solution."
- **Supporting notebooks live in `checkpoint/`, not `work/`.** The README is explicit about the work folder. The rubric is explicit that "Failure to follow the above instructions will result in an automatic 2 point deduction without exception." I'm noting this but folding it into the overall picture rather than stacking it.

## No baselines anywhere

Your test set is ~17% positive class. The trivial "predict everyone is non-diabetic" baseline gets 83% accuracy. A random stratified guess gets ~72%. Your reported accuracy of ~67% is **below the majority-class baseline** — the only thing rescuing this is that recall on the positive class is high (0.72–0.76), which is what you actually care about for a screening use case.

But you never make that argument explicitly. There's no baseline row in the results table. There's no "predict diabetes if BMI > 30 and age > 55" rule to compare against, which is the obvious clinical-rule baseline for this problem. The right framing here — "ML lifts minority-class recall from X to 0.76 over a simple rule" — would have been your strongest stakeholder argument, and you didn't make it.

## Strengths

- **Real breadth of methods explored.** Logistic Regression, Random Forest, XGBoost, XGBoost+SMOTE, DNN with Optuna, deeper DNN with Optuna, year-stratified DNN, Type 1 vs Type 2 specialization. That's a lot of ground covered.
- **Diego's M9_3 pipeline is internally consistent.** All four model families land at AUC 0.77–0.78 on the same test split with the same features and similar imbalance handling. That's the right pattern — when multiple model classes converge, it tells you something about the ceiling of the feature space, which you correctly note in the limitations.
- **Threshold-aware F1 tuning.** Cells 15 and 18 of M9_3 use the PR curve to pick an F1-optimal threshold. This is the right tool. It just doesn't make it into the report narrative.
- **Class-imbalance handling done correctly (in the M9_3 pipeline).** SMOTE applied only to training data, test set kept clean, `pos_weight` used in the DNN BCE loss. This is non-trivial and you got it right.
- **Type 1 vs Type 2 split was a thoughtful extension.** The honest conclusion — that BRFSS features can't distinguish subtype well — is a real finding even though the result is negative.
- **Streamlit deployment.** Shipping an artifact users can interact with raises the bar over a notebook-only project.

## Weaknesses

- **The 0.78 vs 0.90 discrepancy is unresolved, and the higher numbers don't match the notebook outputs I can verify.** See above.
- **No baseline comparisons of any kind.** No majority class, no simple-rule, no domain-classical. With heavy imbalance this is the difference between meaningful and meaningless numbers.
- **The report is well below rubric standards.** No in-report visualizations, no confusion matrices, no narrative prose in lit review or discussion, scattered bullet-point organization, stakeholder use case left undefined.
- **No real engagement with the screening use case.** What's the operating threshold for population screening? What's the cost of a false positive vs a false negative in this context? You picked recall-priority implicitly (by using `pos_weight`) but never made the argument explicitly.
- **Two parallel pipelines suggest coordination problems.** Diego's work and Akhil/Lulu's work seem to have proceeded independently with different feature sets, different imbalance strategies, and different headline numbers, then got stapled together in the final report. The merge isn't a methodological choice you defend — it just happens.
- **`Modelling_2024r.ipynb` has a latent bug.** The `run_classifier` function references `macro_f1` in a print statement before it's defined a few lines later. That cell will raise `NameError` on actual execution. Either you patched it externally or it was never re-run cleanly — both are concerning.

## Summary

I think you did some real work, but it looks to me like there were some significant coordination problems, and that explains the discrepant results.  But no one really took the time to try to reconcile these discrepancies and produce the comprehensive and polished report I had asked for.  So, I think there's something to build on here, but it feels like the project is somewhat incomplete.

**Score: 22/30**


---

## Final Project Grade
| Assessment Item | Diego Quispe | Akhil Arakkal | Lulu Massasi |
|---|---|---|---|
| **Proposal (5 pts)** | 5 | 5 | 5 |
| **Midterm Report (10 pts)** | 10 | 10 | 10 |
| **Final Presentation (5 pts)** | 5 | 5 | 5 |
| **Final Report (30 pts)** | 22 | 22 | 22 |
| **Weekly Updates (30 pts)** | 30 | 22 | 30 |
| **Total (80 pts)** | **72** | **64** | **72** |
