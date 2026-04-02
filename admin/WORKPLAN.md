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

## Milestone 6: Multi-Year Data Integration (2023 + 2024)

**Goal:** Combine BRFSS 2023 and 2024 datasets to improve robustness and generalizability of findings without complex temporal modeling.

### ☐ M6.T1 — Acquire additional dataset
- **Quispe:** Download BRFSS 2023 dataset and codebooks  
- **Massasi:** Review metadata and compare with 2024 structure  
- **Arakkal:** Organize files into shared repository  

### ☐ M6.T2 — Harmonize variables across years
- **Massasi:** Align variable names, labels, and coding schemes  
- **Arakkal:** Standardize categorical levels and missing value representations  
- **Quispe:** Ensure consistent BMI calculation and obesity definition  

### ☐ M6.T3 — Merge datasets
- **Arakkal:** Add a `year` indicator feature (2023, 2024)  
- **Quispe:** Concatenate datasets into a unified dataframe  
- **Massasi:** Validate consistency of distributions across years  

### ☐ M6.T4 — Validate combined dataset
- **Quispe:** Check for data imbalance between years  
- **Massasi:** Identify unexpected distribution shifts  
- **Arakkal:** Flag variables that behave inconsistently across years  

 **Note:** Focus on improving dataset size and robustness—not on time-series modeling.

---

## Milestone 7: Expanded Modeling (Including Advanced Models)

**Goal:** Evaluate a wider range of models to balance interpretability and predictive performance.

### ☐ M7.T1 — Final dataset preparation
- **Arakkal:** Finalize selected feature set  
- **Quispe:** Ensure consistent encoding across all features  
- **Massasi:** Create train/validation/test splits (stratified)  

### ☐ M7.T2 — Train baseline models
- **Massasi:** Logistic Regression  
- **Quispe:** Decision Tree  

### ☐ M7.T3 — Train ensemble and advanced models
- **Arakkal:** Random Forest  
- **Massasi:** Gradient Boosting (XGBoost / LightGBM if available)  
- **Quispe:** Optional SVM  

### ☐ M7.T4 — Model evaluation
- **Quispe:** Compute Precision, Recall, F1-score  
- **Massasi:** Compute ROC-AUC and compare across models  
- **Arakkal:** Summarize performance and stability  

### ☐ M7.T5 — Feature importance & interpretability
- **Massasi:** Logistic Regression coefficients  
- **Arakkal:** Tree-based feature importance  
- **Quispe:** SHAP / permutation importance  

### ☐ M7.T6 — Model selection
- **Arakkal:** Lead model comparison discussion  
- **Massasi:** Evaluate interpretability trade-offs  
- **Quispe:** Document final model selection and rationale  

---

## Milestone 8: Final Presentation & Reporting

**Goal:** Deliver clear, actionable insights with strong visualizations and a compelling narrative.

### ☐ M8.T1 — Results synthesis
- **Quispe:** Behavioral risk factors summary  
- **Massasi:** Demographic high-risk groups  
- **Arakkal:** Health-condition interactions  

### ☐ M8.T2 — Visualization development
- **Arakkal:** Feature importance plots  
- **Massasi:** Risk group comparisons  
- **Quispe:** Correlation heatmaps & model comparison charts  

### ☐ M8.T3 — Actionable insights
- **Massasi:** Public health recommendations  
- **Quispe:** Identify modifiable risk factors  
- **Arakkal:** Targeted intervention strategies  

### ☐ M8.T4 — Presentation preparation
- **Arakkal:** Slides (problem, data, modeling)  
- **Quispe:** Slides (results, insights)  
- **Massasi:** Slides (recommendations, limitations)  

### ☐ M8.T5 — Final report
- Methodology section  
- Results & visualizations  
- Editing, formatting, and reproducibility  
 

---


## Changelog
- 2026-04-01 - Updated for final presentation
- 2026-02-01 — Created initial WORKPLAN for BRFSS obesity prediction project  
- 2026-02-15 — Updated scope to focus on actionable, interpretable predictors; assigned specific tasks for three team members in Milestones 1 & 2

