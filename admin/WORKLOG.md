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

# 2026-03-18 – Milestone 4/5: Baseline Modeling with KNN for Diabetes Prediction (Quispe)

**Context:**  
Built an KNN model to classify diabetes (`DIABETE_BIN = 1`) using PCA-transformed health variables from the BRFSS 2024 dataset. 

**Solution Implemented:**  

- Loaded the cleaned BRFSS 2024 dataset and selected key health variables: `_ASTHMS1`, `CHCKDNY2`, `_DRDXAR2`, `_EDUCAG`, `_INCOMG1`, `_AGE_G`, `_SEX`, `WTKG3`, `HTM4`, `_RFBMI5`, `_BMI5`, `_RFDRHV9`, `_RFSMOK3`, `_TOTINDA`.  
- Checked for missing values and handled them by dropping or imputing as needed.  
- Split data into train/test sets (80/20), stratified by diabetes status.  
- Applied `StandardScaler` for feature scaling and PCA for dimensionality reduction (retaining 95% variance).  
- Trained a K-Nearest Neighbors (KNN) classifier on PCA-transformed features.  
- Evaluated model performance using a classification report, focusing on precision, recall, and F1-score.

**Impact:**  

- The model achieved **accuracy of 81%**, but performance on the minority class (diabetes) is low:  
  - Precision: 0.39  
  - Recall: 0.20  
  - F1-score: 0.26  
- Macro F1-score is 0.58, showing moderate average performance across classes.  
- PCA analysis showed that PC1 is dominated by **weight, height, BMI, and sex**, while PC2 captures **age and chronic conditions like arthritis**.  
- Scatterplots of PC1 vs PC2 indicate overlapping clusters between diabetic and non-diabetic individuals, confirming that simple linear separation is difficult.

**Next Steps:**  

- Apply oversampling methods (e.g., SMOTE) to address class imbalance.  
- Test additional classifiers such as XGBoost or Random Forest for better discrimination of diabetic cases.  


## 2026-03-25 – Milestone 5: Advanced Modeling with SMOTE & Ensemble Methods for Diabetes Prediction (Quispe)

**Context:**  
Improved the baseline diabetes prediction model by addressing class imbalance and replacing KNN with a more robust ensemble method using the BRFSS 2024 dataset.

**Solution Implemented:**  

- Used the same cleaned BRFSS 2024 dataset and selected health variables from the previous milestone.  
- Performed feature scaling using `StandardScaler` and retained PCA transformation (95% variance).  
- Applied **SMOTE** to the training data to balance the minority class (diabetes cases).  
- Trained an **XGBoost classifier** on the SMOTE-balanced dataset.  
- Evaluated model performance using classification report metrics and ROC-AUC.  

**Impact:**  

- The model achieved **accuracy of 67%**, with significantly improved detection of the diabetic class:  
  - Precision: 0.30  
  - Recall: 0.75  
  - F1-score: 0.43  
- Macro F1-score was **0.60**, indicating better balance across classes.  
- ROC-AUC score reached **0.77**, showing good class separability.  

**Next Steps:**  

- Tune XGBoost hyperparameters to improve precision-recall balance.  
- Adjust classification threshold to reduce false positives.  



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

- ________________________________________
**13th March 2026 —Milestone 3: Data Acquisition & Initial Inspection**(Lulu)
**Features Selected:**
•	Health conditions: _AGE_G, SEXVAR, _EDUCAG, _INCOMG1
•	Actionable behavioral/lifestyle features and health conditions: _BMI5, _RFBMI5, HTM4, _TOTINDA, WTKG3, _RFSMOK3, _RFDRHV9, DIABETE4, ASTHNOW, CHCKDNY2, _DRDXAR2
Impact: Successfully consolidated the dataset into a single working file and narrowed the scope from the full BRFSS variable list down to 15 meaningful predictors, reducing noise and keeping the analysis focused on obesity-related factors.



**15th March 2026 — Milestone 3: Data Cleaning & Variable Recoding (Lulu)**  

**Context:**  
The raw BRFSS dataset stores variables as numeric codes (e.g., 1, 2, 9) that are not interpretable without a codebook. These needed to be converted into meaningful labels and structured correctly for analysis and modeling.

**Solution Implemented:**  

- Renamed all 15 columns to human-readable names (e.g., `_BMI5 → BMI`, `_RFBMI5 → Obese`)  
- Recoded numeric values into categorical labels for:  
  - Income (7 ordered levels + Missing)  
  - Education (4 ordered levels + Missing)  
  - Age Group (6 ordered levels)  
  - Binary variables (Sex, Smoking, Drinking, Physical Activity, Obesity, Diseases)  
- Converted variables to appropriate data types (`Int64`, `pd.Categorical`)  
- Applied ordered categories for ordinal variables (Age, Education, Income)  
- Assigned `np.nan` to missing/unknown values (e.g., code 9)  

**Impact:**  

- Dataset became fully interpretable and analysis-ready  
- Preserved natural ordering for ordinal variables (critical for encoding)  
- Eliminated ambiguity in binary variables  
- Prepared clean input for preprocessing and modeling  

---

**15th March 2026 — Milestone 3: Exploratory Data Analysis (EDA) (Lulu)**  

**Context:**  
Understanding relationships between numeric variables is essential to detect multicollinearity, which can distort model performance and interpretation.

**Solution Implemented:**  

- Generated summary statistics for categorical variables  
- Selected numeric variables: BMI, Height (m), Weight (kg)  
- Computed Pearson correlation matrix  
- Visualized correlations using a Seaborn heatmap (coolwarm palette)  

**Impact:**  

- Identified strong correlation between BMI and Weight (0.85) → multicollinearity  
- Moderate correlation between Height and Weight (0.46)  
- No meaningful relationship between BMI and Height (-0.04)  
- Dropped Height and Weight, retaining BMI as the sole anthropometric feature  
- Reduced redundancy and improved feature interpretability  

---

**21st March 2026 — Milestone 4: Data Preprocessing & Feature Engineering (Lulu)**  

**Context:**  
Machine learning models require clean, numeric, and consistently scaled inputs. Different variable types (ordinal, binary, numeric) require different preprocessing strategies.

**Solution Implemented:**  

- Built three preprocessing pipelines:  
  - Ordinal: Imputation (most frequent) + OrdinalEncoder (Age, Education, Income)  
  - Binary: Imputation (most frequent) + encoding (Yes/No variables)  
  - Numeric: Imputation (mean) + StandardScaler (BMI)  
- Combined pipelines using `ColumnTransformer`  
- Applied `fit_transform()` to feature matrix  
- Converted output back to a structured DataFrame  
- Dropped 43,037 rows with missing target values  

**Impact:**  

- Produced a fully clean dataset with no missing values  
- Ensured correct encoding for all variable types  
- Maintained reproducibility via pipeline design  
- Created a model-ready dataset with consistent scaling and structure  

---

**22nd March 2026 — Milestone 4: Modelling & Evaluation (Lulu)**  

**Context:**  
The target variable (Obese) is imbalanced, and initial inclusion of BMI introduced data leakage since BMI directly defines obesity. This led to unrealistically high model performance.

**Solution Implemented:**  

- Built reusable `run_classifier()` pipeline including:  
  - Stratified 80/20 train-test split  
  - SMOTE for class balancing  
  - 5-Fold Cross Validation (F1 Macro)  
  - Classification report and ROC-AUC  
- Trained Logistic Regression and Random Forest models  
- Identified data leakage (BMI highly correlated with target, r = 0.647)  
- Removed BMI and retrained models  
- Further removed Sex variable and re-evaluated models  

**Impact:**  

- Eliminated data leakage, restoring realistic model performance  
- Prevented the model from learning the target definition directly  
- Ensured predictions are based on true risk factors (behavioral & socioeconomic)  
- Produced a more reliable and generalizable model for real-world use  

**Next Steps:**  

- Continue optimizing models with balanced datasets  
- Evaluate additional algorithms for improved performance  
- Perform feature importance analysis for interpretability  

________________________________________
**Milston6.Task1- April 2nd 2026 — Acquire additional dataset (Lulu) **
Work Completed- Review metadata and compare with 2024 structure
•	Retrieved and loaded additional BRFSS datasets 2023.
•	Reviewed metadata for each year, focusing on variable names, labels, coding schemes, and module availability.
•	Compared the 2023 metadata against the 2024 BRFSS structure to identify structural differences.
•	Documented variables that appear consistently across all years Diabetes, Asthma, Kidney Disease, Arthritis.
•	Identified variables present in earlier years but missing in 2024 like Hypertension and Cholesterol and heavydrinker 2023 dataset.

