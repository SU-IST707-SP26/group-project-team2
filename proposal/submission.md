# Predicting Obesity Using BRFSS 2024 Data

## Team

- **Akhil Haris Arakkal** (GitHub: @AkhilHaris111)  
- **Lulu Massasi** (GitHub: @lr-2026)  
- **Diego Quispe Vilcahuaman** (GitHub: @dlqui)  

---

## Introduction

**Goal:**  
Develop and validate multiple machine learning models for obesity risk prediction using BRFSS 2024 survey data and identify key predictors from demographics, behaviors, and health variables. The primary deliverable will be an interpretable, prioritized list of modifiable risk factors and/or risk clusters, highlighting which factors most strongly contribute to obesity and are actionable targets for public health interventions.

**Approach:**  
Apply machine learning models (logistic regression, random forests, gradient boosting) to a large, representative dataset for robust, interpretable predictions, with emphasis on actionable insights for public health researchers.

**Impact:**  
Results will inform targeted public health interventions, guide policy planning, and provide actionable, interpretable insights to CDC users and public health researchers.

---

## Literature Review

**Current Approaches:**  
Prior studies use regression and tree-based models but often have limited sample size or interpretability^1. Recent ML approaches improve prediction but lack reproducible pipelines for public health data.

**Stakeholders:**  

- **Public Health Researchers / CDC Users:** Need interpretable, actionable predictors to guide interventions.  
- **Policymakers:** Need actionable insights for program planning.  
- **Team Members:** Need reproducible workflow and clear documentation.  

---

## Data and Methods

**Dataset:**  
- **BRFSS 2024** ([CDC link](https://www.cdc.gov/brfss/annual_data/annual_2024.html))  
- **Number of observations:** 457,670  
- **Number of variables:** 301; demographics, behaviors, health conditions  
- **Target:** Obesity (BMI ≥ 30.00)  

**Methods:**  
- **Preprocessing:** Handle missing values, encode categories, scale features  
- **Feature Selection:** Focus on modifiable behavioral and lifestyle variables for intervention relevance  
- **Modeling:** Logistic regression, random forests, gradient boosting  
- **Evaluation:** Accuracy, F1-score, AUC-ROC, and interpretability  
- **Interpretation:** SHAP and LIME to identify actionable predictors and risk clusters  
- **Validation:** Cross-validation and hold-out testing  

---

## Project Plan

| Period | Activity | Milestone |
|--------|---------|----------|
| 1/2 – 9/2 | Stakeholder analysis, EDA | EDA completed, stakeholders identified |
| – | Data cleaning, feature engineering, baseline models | Clean data, baseline performance |
| – | Advanced modeling, tuning | Candidate models finalized |
| – | Model evaluation, interpretation | Final model validated, actionable predictors identified |
| – | Documentation, final report | Submission-ready results |

---

## Risks

- **Data Quality:** Missing or inconsistent data – Mitigate with preprocessing and imputation  
- **Model Performance:** Underperforming models – Mitigate with multiple modeling approaches and tuning  
- **Scope Creep:** Project complexity – Mitigate with defined milestones and fallback to simpler models  
- **Interpretability:** Complex models may be less interpretable – Mitigate with SHAP/LIME explanations and focus on actionable variables  

---

## References

- **1** Machine learning framework for predicting susceptibility to obesity  
  https://pmc.ncbi.nlm.nih.gov/articles/PMC12508184/  
- **2** BRFSS 2024 Data  
  https://www.cdc.gov/brfss/annual_data/annual_2024.html  
  General BRFSS Information: https://www.cdc.gov/brfss/index.html  
- **3** Kalhori et al. (2025) - Systematic Review  
  https://www.sciencedirect.com/science/article/abs/pii/S1386505625000218  
- **4** Recent Obesity Prediction with XAI (2025)  
  https://pmc.ncbi.nlm.nih.gov/articles/PMC12308079/  
  Frontiers in Physiology article on SHAP and LIME for obesity prediction  
- **5** Nature Scientific Reports - ObeRisk Framework (2025)  
  https://www.nature.com/articles/s41598-025-20505-9  
- **6** Helforoush & Sayyad (2024) - Obesity Prediction Comparison  
  https://www.frontiersin.org/journals/big-data/articles/10.3389/fdata.2024.1469981/full  
- **7** Meta-Analysis on ML for Obesity (2024)  
  https://www.nmcd-journal.com/article/S0939-4753(24)00204-7/abstract
