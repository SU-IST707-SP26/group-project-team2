# Predicting Obesity Using BRFSS 2024 Data

## Team

- **Akhil Haris Arakkal** (GitHub: @AkhilHaris111)  
- **Lulu Massasi** (GitHub: @lr-2026)  
- **Diego Quispe Vilcahuaman** (GitHub: @dlqui)  

---

## Introduction

**Goal:**  
Develop and validate multiple machine learning models for obesity risk prediction using BRFSS 2024 survey data and identify key predictors from demographics, behaviors, and health variables.


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
- **Number of observations** 457670
- **Number of variables** 301; demographics, behaviors, health conditions 
- **Target:** Obesity (BMI ≥ 3000) 

**Methods:**  
- **Preprocessing:** Handle missing values, encode categories, scale features  
- **Modeling:** Logistic regression, random forests, gradient boosting  
- **Evaluation:** Accuracy, F1-score, AUC-ROC, and interpretability  
- **Validation:** Cross-validation and hold-out testing  

---

## Project Plan

| Period | Activity | Milestone |
|--------|---------|----------|
| 1/2 – 9/2 | Stakeholder analysis, EDA | EDA completed, stakeholders identified |
|  – | Data cleaning, feature engineering, baseline models | Clean data, baseline performance |
|  –  | Advanced modeling, tuning | Candidate models finalized |
|  – | Model evaluation, interpretation | Final model validated |
|  –  | Documentation, final report | Submission-ready results |

---

## Risks

- **Data Quality:** Missing or inconsistent data:  Mitigate with preprocessing and imputation  
- **Model Performance:** Underperforming models : Mitigate with multiple modeling approaches  
- **Scope Creep:** Project complexity : Mitigate with defined milestones and fallback to simpler models  

---

## References

- **1** Machine learning framework for predicting susceptibility to obesity
 https://pmc.ncbi.nlm.nih.gov/articles/PMC12508184/
-**2** https://www.cdc.gov/brfss/annual_data/annual_2024.html
    General BRFSS Information: https://www.cdc.gov/brfss/index.html
-**3** Kalhori et al. (2025) - Systematic Review: https://www.sciencedirect.com/science/article/abs/pii/S1386505625000218
-**4** Recent Obesity Prediction with XAI (2025): https://pmc.ncbi.nlm.nih.gov/articles/PMC12308079/
    Frontiers in Physiology article on SHAP and LIME for obesity prediction
-**5** Nature Scientific Reports - ObeRisk Framework (2025): https://www.nature.com/articles/s41598-025-20505-9
-**6** Helforoush & Sayyad (2024) - Obesity Prediction Comparison: https://www.frontiersin.org/journals/big-data/articles/10.3389/fdata.2024.1469981/full
-**7** Meta-Analysis on ML for Obesity (2024): https://www.nmcd-journal.com/article/S0939-4753(24)00204-7/abstract
