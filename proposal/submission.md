# Predicting Obesity Using BRFSS 2024 Data

## Team

- **Akhil Haris Arakkal** (GitHub: @AkhilHaris111)  
- **Lulu Massasi** (GitHub: @lr-2026)  
- **Diego Quispe Vilcahuaman** (GitHub: @dlqui)  

---

## Introduction

**Goal:**  
Predict obesity risk using BRFSS 2024 survey data and identify key predictors from demographics, behaviors, and health variables.

**Approach:**  
Apply machine learning models (logistic regression, random forests, gradient boosting) to a large, representative dataset for robust, interpretable predictions.

**Impact:**  
Results will inform public health interventions, guide policy planning, and provide actionable insights to researchers and CDC users.

---

## Literature Review

**Current Approaches:**  
Prior studies use regression and tree-based models but often have limited sample size or interpretability^1. Recent ML approaches improve prediction but lack reproducible pipelines for public health data.

**Stakeholders:**  

- **Public Health Researchers / CDC Users:** Need interpretable predictors for interventions.  
- **Policymakers:** Need actionable insights for program planning.  
- **Team Members:** Need reproducible workflow and clear documentation.  

---

## Data and Methods

**Dataset:**  
- **BRFSS 2024** ([CDC link](https://www.cdc.gov/brfss/annual_data/annual_2024.html))  
- ~400,000+ rows; demographics, behaviors, health conditions  
- **Target:** Obesity (BMI ≥ 30)  

**Methods:**  
- **Preprocessing:** Handle missing values, encode categories, scale features  
- **Modeling:** Logistic regression, random forests, gradient boosting  
- **Evaluation:** Accuracy, F1-score, AUC-ROC, and interpretability  
- **Validation:** Cross-validation and hold-out testing  

---

## Project Plan

| Period | Activity | Milestone |
|--------|---------|----------|
| 9/10 – 9/23 | Stakeholder analysis, EDA | EDA completed, stakeholders identified |
| 9/24 – 10/8 | Data cleaning, feature engineering, baseline models | Clean data, baseline performance |
| 10/9 – 10/23 | Advanced modeling, tuning | Candidate models finalized |
| 10/24 – 11/6 | Model evaluation, interpretation | Final model validated |
| 11/7 – 11/20 | Documentation, final report | Submission-ready results |

---

## Risks

- **Data Quality:** Missing or inconsistent data:  Mitigate with preprocessing and imputation  
- **Model Performance:** Underperforming models : Mitigate with multiple modeling approaches  
- **Scope Creep:** Project complexity : Mitigate with defined milestones and fallback to simpler models  

---

## References

[^1]: Machine learning framework for predicting susceptibility to obesity
 https://pmc.ncbi.nlm.nih.gov/articles/PMC12508184/
