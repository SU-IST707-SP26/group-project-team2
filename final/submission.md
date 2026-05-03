# Diabetes Risk Prediction Using Machine Learning and Deep Learning on BRFSS Data

---

## Team

- Quispe (GitHub: dlqui)  
- Arakkal (GitHub: AkhilHaris111)  
- Massasi (GitHub: lr-2026)  

---

## Introduction

This project addresses the problem of predicting diabetes risk using large-scale health survey data from the Behavioral Risk Factor Surveillance System (BRFSS). The primary stakeholders are public health researchers and healthcare policymakers who require scalable tools to identify individuals at high risk of diabetes.

This problem is significant because diabetes is a chronic disease with increasing global prevalence, and early detection can reduce complications and healthcare costs. Traditional clinical screening is accurate but not scalable for population-level use.

To address this, we developed a machine learning and deep learning pipeline using demographic, behavioral, and clinical survey data. The project compares multiple models to evaluate predictive performance and identify key risk factors. A key focus is **interpretability**, including visual analysis in a deployed application to support public health decision-making. This also helps address misconceptions such as BMI being the sole indicator of diabetes risk.

---

## Literature Review

Prior work shows that machine learning models are effective for diabetes prediction using structured survey data like BRFSS, but with different variables.

- Class imbalance is a major challenge in healthcare datasets  
- Methods like SMOTE, class weighting, and threshold tuning are commonly used  

Based on this, we selected:
- Logistic Regression, Random Forest, XGBoost  
- PyTorch neural networks  
- Imbalance handling techniques (SMOTE, class weights, thresholds)  
- Emphasis on interpretability through visualization in the app  

---

## Data and Methods

### Data

- Source: BRFSS (CDC), 2022–2024  
- Size: ~1.3 million records  
- Features: ~10–15 selected variables  
- Target: DIABETE_BIN (0 = no diabetes, 1 = diabetes/prediabetes)  
- Class imbalance: ~83% / 17%  

Features include:
- Demographics (age, sex, income, education)  
- Behavior (smoking, activity, alcohol use)  
- Health indicators (BMI, chronic conditions)  

---

### Methods

#### Preprocessing
- Median imputation  
- StandardScaler normalization  
- Categorical encoding  
- Outlier clipping / log transforms  
- Stratified train-test split  
- Mean Imputation
- Correlation Analysis

#### Imbalance Handling
- SMOTE  
- Class weighting  
- Threshold tuning  

#### Models
- Logistic Regression  
- Random Forest  
- XGBoost  
- PyTorch Deep Neural Networks  

#### Deep Learning
- Fully connected networks  
- ReLU activations  
- Dropout  
- Adam optimizer  

#### Optimization
- Optuna tuning for XGBoost and DNN  

---

## Supporting Files

This section maps each notebook to its role in the project pipeline.
## Supporting Notebooks Index

- M_1_Quispe.ipynb - Initial data acquisition and variable mapping from BRFSS 2024. Identification of predictors and target definition.  
- M_2_Quispe.ipynb - Data cleaning, encoding, scaling, and preprocessing pipeline.  
- M_3_Quispe.ipynb - Exploratory Data Analysis (EDA), PCA, correlation analysis, clustering.  
- Milestone_4_5_18_March.ipynb - KNN baseline model with PCA features and initial evaluation.  
- Milestone_4_5_March_25.ipynb - SMOTE + XGBoost ensemble modeling and imbalance handling.  
- Milestone7_2_Quispe.ipynb - XGBoost + Optuna hyperparameter tuning.  
- Milestone_8_Quispe.ipynb - PyTorch deep learning baseline model.  
- Milestone_9_Quispe.ipynb / Milestone_9_2_Quispe.ipynb- Improved deep learning pipeline with feature engineering.  
- Milestone_9_3_Quispe.ipynb - Optuna-tuned deep learning model with SMOTE, all models implementation.  
- Milestone_10_Quispe.ipynb - Type 1 vs Type 2 diabetes classification experiments.  
- Modelling_2024r.ipnyb - Combined file of Arakkal and Lulu which includes data encoding, preprocessing and modeling.

---

## Results

### Classical Models
- Logistic Regression: AUC ~0.767  
- Random Forest: AUC ~0.775  
- XGBoost: AUC ~0.778 (best)  

### Deep Learning
- ROC-AUC: ~0.77–0.78  
- F1-score: ~0.44–0.60  
- Strong ranking, weaker classification precision  

### Models (Arakkal & Lulu)
- Random Forest: AUC ~0.87
- XGBoost(Base): AUC ~0.90
- XGBoost(Tuned): AUC ~0.87

### Key Findings
- Class imbalance strongly affects performance  
- Recall > precision across all models  
- XGBoost is most stable classical model  
- Deep learning does not outperform XGBoost on tabular data  
- Arakkal & Lulu: Class imbalance significantly impacts all models, with recall consistently outperforming precision across Random Forest, XGBoost Base, and XGBoost Tuned
- Arakkal & Lulu: XGBoost Base is the strongest performer, achieving the highest ROC-AUC (0.90) 
- Arakkal & Lulu: Hyperparameter tuning did not meaningfully improve XGBoost, suggesting the base model was already near-optimal for this dataset
- Arakkal & Lulu: All models show competitive ROC-AUC scores (0.87–0.90), confirming that BRFSS survey data carries strong predictive signal for diabetes risk
---

## Discussion

Results show diabetes risk can be predicted reasonably well using survey data, but performance is limited by imbalance and feature overlap.

The project meets its main goal by providing a scalable risk prediction system for public health use. Importantly, the system emphasizes **interpretability through visualization**, allowing users to understand risk patterns rather than relying only on predictions.

In addition, we explored **type-specific diabetes models (Type 1 and Type 2)** to evaluate whether survey features can distinguish between different diabetes types. The Type 1 model showed weaker predictive performance due to limited signal and stronger class imbalance, while the Type 2 model performed slightly better but was still constrained by overlapping feature distributions. These experiments further reinforce that BRFSS features are more suitable for general diabetes risk prediction than fine-grained subtype classification.

---

## Limitations

- Severe class imbalance (~83/17)  
- Limited clinical detail in BRFSS  
- Weak feature separability  
- SMOTE does not consistently improve results  
- Deep learning offers limited gains over XGBoost 
- Hyperparameter tuning of XGBoost did not yield meaningful improvements over the base model
 

---

## Future Work

- Add clinical datasets with richer signals  
- Improve imbalance handling (focal loss, cost-sensitive learning)  
- Improve interpretability using SHAP/LIME in the app  
- Expand state-level and demographic visual analytics  


---

## References

1. https://pmc.ncbi.nlm.nih.gov/articles/PMC12508184/  
2. https://www.cdc.gov/brfss/index.html    
3. https://pmc.ncbi.nlm.nih.gov/articles/PMC12308079/  
4. https://www.nature.com/articles/s41598-025-20505-9  
5. https://www.nmcd-journal.com/article/S0939-4753(24)00204-7/abstract  


---

## Appendix

### Data Access
The primary dataset used in this project is:
df_final.parquet (main unified BRFSS dataset used for modeling)
Additional processed datasets are available in the repository in compressed format due to size limitations:
brfss_clean_processed.parquet (cleaned intermediate dataset stored in ZIP format in repo due to GitHub size constraints)
All datasets are derived from the CDC BRFSS survey and processed through multiple preprocessing, feature engineering, and modeling milestones

### Execution Order
Run notebooks M1 → M10 in order.

### Artifacts
Model artifacts used for deployment are stored in a separate repository:
https://github.com/dlqui/app_risk
The Streamlit application loads the following trained artifacts:
scaler.pkl : Feature scaling for consistent model input
diabetes_dnn_a.pt : Trained PyTorch deep learning model for diabetes risk prediction
These artifacts are used for real-time inference in the deployed Streamlit application, ensuring consistent preprocessing and model behavior between training and production.


### Streamlit Deployment
The final model is deployed in a Streamlit application hosted in a separate repository:
https://github.com/dlqui/app_risk
The app allows users to input health-related features and receive real-time diabetes risk predictions using the trained deep learning model.
