# WORKLOG.md

## 2026-02-01 - Initial Setup
**Context:** Set up project repository and created project management files.  

**Solution Implemented:**
- Created `admin/`, `work/`, `data/`, `proposal/`, `checkpoint/`, `presentation/`, `final/` folders.
- Added initial `VISION.md` and `WORKPLAN.md` with BRFSS obesity prediction tasks.

**Impact:** Repository structure ready for team collaboration.  

**Next Steps:** Team to download BRFSS 2024 data and begin EDA.

## 2026-02-01 - Data Download Started (Lulu)
**Context:** Acquiring BRFSS 2024 dataset for analysis.

**Solution Implemented:**
- Downloaded 2024 survey files and codebooks from CDC.
- Verified file formats (ASCII/SAS) and documentation.

**Impact:** Data ready for cleaning and preprocessing.

**Next Steps:** Review variables and identify target/predictors for obesity prediction.


## 2026-02-05 - Milestone 1: Data Acquisition & Understanding (Quispe)

Context:
- BRFSS 2024 codebook unavailable.
- Need to identify health-related predictors and define obesity target.

Solution Implemented:
- Loaded BRFSS 2024 dataset.
- Auto-mapped variables:
    - Health: BMI, ASTHMA, heart disease, cholesterol, diabetes, general health, mental/physical unhealthy days, insurance, dental visits
    - Demographic: Age, sex, race, education, income
    - Behavioral: Exercise, smoking, alcohol, fruit/vegetable consumption
- Defined obesity target variable (BMI ≥ 30)
- Created preliminary dataset subset for team review.
- Saved as `brfss_2024_mapped_vars.parquet`

Impact:
- Team can proceed with preprocessing without codebook.
- Health predictors and target variable ready for Milestone 2.
- Dataset subset ensures consistent predictor selection.

Next Steps:
- Begin Milestone 2: preprocessing (missing value handling, encoding, scaling, outlier detection).
- Document preprocessing decisions for reproducibility.


## 2026-02-11 - Milestone 2: Data Cleaning & Preprocessing (Quispe)

Context:
- Preprocessing health variables from BRFSS 2024 mapped dataset.
- Goal: Prepare clean, consistent data for Milestone 3 EDA and modeling.

Solution Implemented:
- Flagged health variables with >20% missing values.
- Imputed missing numeric values using median.
- Encoded ordinal variables (e.g., ASTHMA severity) with OrdinalEncoder.
- Scaled numeric features using RobustScaler to reduce outlier influence.
- Detected outliers using z-score method and flagged them.
- Saved cleaned dataset for downstream analysis as `brfss_2024_cleaned_qusipe.parquet`.

Impact:
- Health variables are now clean, scaled, and ready for exploratory analysis.
- Outlier flags allow informed decisions for modeling.
- Cleaned dataset ensures reproducibility and consistency across team members.

Next Steps:
- Perform Milestone 3 EDA:
    - Summary statistics and distributions
    - Correlations
    - PCA or feature importance analysis
    - Risk cluster visualization

## 2026-02-19 - Milestone 3: Exploratory Data Analysis (Quispe)

Context:
- Performed EDA on cleaned health predictors from BRFSS 2024 to identify interpretable patterns and potential high-risk subgroups.

Solution Implemented:
- Generated summary statistics and distributions for health variables.
- Visualized correlations and identified relationships with obesity.
- Applied PCA to understand variance explained by numeric features.
- Clustered respondents using K-means (3 clusters) to identify risk subgroups.
- Visualized risk clusters on primary health variables for interpretation.
- Saved final EDA dataset with cluster labels.

Impact:
- Identified potential high-risk subgroups and feature patterns for obesity.
- Summary statistics and visualizations provide actionable insights for public health researchers.
- Prepared data for predictive modeling and further analysis if needed.

Next Steps:
- Share visualizations and PCA results with team for interpretation.
- Prioritize actionable predictors and clusters for reporting.
- Integrate findings into CDC-ready summary tables and visual reports.


## 2026-03-05 - Milestone 4: Baseline Modeling with Random Forest (Quispe)

**Context:**  
- Built an initial predictive model to classify obesity (BMI ≥ 30) using PCA-transformed health variables from the BRFSS 2024 dataset.  
- Objective was to establish a baseline performance and identify potential modeling challenges such as class imbalance.

**Solution Implemented:**  
- Loaded cleaned BRFSS 2024 dataset and selected health variables for PCA transformation.  
- Applied previously saved PCA (`pca_health_vars.joblib`) to reduce dimensionality to 5 components.  
- Split data into train/test sets (80/20), stratified by obesity status.  
- Trained a **Random Forest classifier** (`n_estimators=100`, `max_depth=5`) on PCA features.  
- Evaluated performance using confusion matrix, classification report, and ROC-AUC score.  

**Impact:**  
- Model shows **high accuracy (0.90)** but fails to predict the minority obese class due to severe class imbalance.  
- Confusion matrix indicates the classifier predicts **only non-obese individuals**.  
- ROC-AUC is near 0.5, confirming poor discrimination for obesity.  
- Highlighted the need for imbalance correction and potential hyperparameter tuning.  

**Next Steps:**  
- Apply **SMOTE or other oversampling techniques** to address class imbalance.  
- Tune Random Forest hyperparameters (`max_depth`, `n_estimators`, `min_samples_split`) for improved performance.  
- Analyze **PCA component contributions** to map back to original health variables for interpretability.  
- Evaluate additional models (Logistic Regression, Gradient Boosting/XGBoost) for comparative performance.  
- Integrate baseline modeling results into milestone report and project checkpoint documentation.


## 2026-03-05 - Milestone 1: Milestone 1: Data Acquisition & Variable Review (Arakkal)

**Context**
- BRFSS 2024 dataset contains a large number of health, demographic, and behavioral variables.
- The project required **identifying predictor variables related to obesity risk.**
- Needed to review demographic and behavioral variables before preprocessing.

**Solution Implemented**
- Needed to review demographic and behavioral variables before preprocessing.
- Loaded the BRFSS 2024 dataset for analysis
  - Age
  - Sex
  - Education Level
  - Income Category
- Reviewed candidate **behavioral variables**: 
  - Physical Activity
  - Smoking status
  - Alcohol Consumption (Heavy Drinker)
- Examined distribution of behavioral variables using count plots to understand class balance.
- Examined distribution of behavioral variables using count plots to understand class balance.

**Impact**
- Established a clear list of predictor variables for further preprocessing.
- Ensured that demographic and behavioral predictors were correctly understood before cleaning.
- Ensured that demographic and behavioral predictors were correctly understood before cleaning.

**Next Steps**
- Begin Milestone 2 preprocessing tasks.
- Handle missing values and encode categorical variables.
- Prepare numeric health variables for scaling and outlier detection.


## 2026-03-05 - Milestone 2 -Data Cleaning & Preprocessing (Arakkal)

**Context**
- Selected health and behavioral predictors required preprocessing before analysis.
- Dataset contained missing values and required normalization and outlier detection.
- Goal was to create a **clean and consistent dataset for EDA and modeling**.

**Solution Implemented**
- Converted raw health measurements into usable numeric variables:
  - BMI
  - Height (meters)
  - Weight (Kg)
- Reviewed descriptive statistics to understand distributions of numeric variables.
- Applied **KNN imputation** to handle missing values in key health variables.
- Evaluated categorical variables for **high cardinality** to determine if target encoding was required.
- Identified that demographic and behavioral variables had low cardinality, so target encoding was not necessary.
- Applied **MinMaxScaler** to normalize numeric variables between 0 and 1.
- Performed Isolation Forest outlier detection using:
  - BMI
  - Height 
  - Weight
- Flagged approximately **1% of observations as outliers**.
- Removed outliers from the dataset to improve data quality.
- Verified dataset integrity and confirmed removal of anomalous observations.

**Impact**
- Missing values were handled using a robust imputation technique.
- Numeric variables were normalized for compatibility with machine learning algorithms.
- Outlier removal improved dataset quality by eliminating extreme observations.
- The resulting dataset is **clean, consistent, and ready for exploratory analysis**.

**Next Steps**
- Perform exploratory data analysis (Milestone 3).
- Generate summary statistics and visualizations.
- Explore relationships between predictors and obesity indicators.