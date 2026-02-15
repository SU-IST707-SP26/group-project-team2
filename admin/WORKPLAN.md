# WORKPLAN.md

## Project Scope Update
> The project scope has been narrowed to focus on **identifying and prioritizing actionable, interpretable risk factors and high-risk subgroups for obesity** using BRFSS 2024 data. The primary deliverable is a ranked list of modifiable predictors and clusters, with visualizations and explanations suitable for public health researchers and CDC users. Predictive performance remains secondary to interpretability and actionable insights.

---

## Active Tasks

### Milestone 1: Data Acquisition & Understanding
**Goal:** Obtain BRFSS 2024 data, understand variables, and define target & predictor sets.

- ☐ M1.T1 — Download BRFSS 2024 dataset and documentation  
  - **Massasi:** Focus on downloading raw data and all related codebooks  
  - **Arakkal:** Download relevant metadata, variable descriptions, and previous years’ examples  
  - **Quispe:** Organize and consolidate files into a shared repository  

- ☐ M1.T2 — Review variables and codebooks, categorize features into:  
  - **Actionable behavioral/lifestyle features**  
  - **Demographic features**  
  - **Health conditions**  
  - **Massasi:** Review behavioral/lifestyle variables (exercise, diet, smoking, alcohol)  
  - **Arakkal:** Review demographic variables (age, sex, education, income)  
  - **Quispe:** Review health condition variables (hypertension, cholesterol, diabetes)  

- ☐ M1.T3 — Identify obesity target variable and potential predictors  
  - **Massasi:** Define obesity target (BMI ≥ 30) and check for coding issues  
  - **Arakkal:** Prepare initial candidate predictor list from behavioral variables  
  - **Quispe:** Cross-check predictors for completeness and overlap  

---

### Milestone 2: Data Cleaning & Preprocessing
**Goal:** Prepare clean, consistent data for modeling; experiment with complementary preprocessing techniques.

- ☐ M2.T1 — Handle missing values  
  - **Massasi:** Impute numeric missing values using median/mode  
  - **Arakkal:** Use KNN imputation for selected numeric and categorical features  
  - **Quispe:** Flag features with >20% missing for potential removal or further review  

- ☐ M2.T2 — Encode categorical variables  
  - **Massasi:** Use one-hot encoding for nominal features  
  - **Arakkal:** Use target encoding for high-cardinality features  
  - **Quispe:** Use ordinal encoding for ordered categorical variables  

- ☐ M2.T3 — Scale numerical features  
  - **Massasi:** Apply StandardScaler (mean=0, std=1)  
  - **Arakkal:** Apply MinMaxScaler (scale 0–1)  
  - **Quispe:** Apply RobustScaler (robust to outliers)  

- ☐ M2.T4 — Dimensionality reduction / outlier handling  
  - **Massasi:** Apply PCA to numeric features and compare variance explained  
  - **Arakkal:** Use isolation forest for outlier detection and removal  
  - **Quispe:** Use z-score method to detect extreme values and flag them  

> ⚠️ **Synchronization:** Please, each member documents their approach in the shared repo. Before moving to modeling, the team will **compare preprocessing outputs**, decide on the unified dataset version, and consolidate the best approach for consistency in modeling.

---

### Milestone 3: Exploratory Data Analysis (EDA)
- ☐ M3.T1 — Summary statistics and distributions  
- ☐ M3.T2 — Visualize correlations, feature importance, and risk clusters  

### Milestone 4: Modeling
- ☐ M4.T1 — Split data into train/test sets  
- ☐ M4.T2 — Train baseline models (logistic regression, random forest)  
- ☐ M4.T3 — Evaluate models using precision, recall, F1-score, ROC-AUC  
- ☐ M4.T4 — Hyperparameter tuning, feature importance extraction, and model selection  

### Milestone 5: Reporting & Presentation
- ☐ M5.T1 — Generate figures, tables, and summary of findings  
- ☐ M5.T2 — Prepare presentation and final report  

---

## Changelog
- 2026-02-01 — Created initial WORKPLAN for BRFSS obesity prediction project  
- 2026-02-15 — Updated scope to focus on actionable, interpretable predictors; assigned specific tasks for three team members in Milestones 1 & 2

