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

- ________________________________________
**13th March 2026 —Milestone 3: Data Acquisition & Initial Inspection**(Lulu)
**Features Selected:**
•	Health conditions: _AGE_G, SEXVAR, _EDUCAG, _INCOMG1
•	Actionable behavioral/lifestyle features and health conditions: _BMI5, _RFBMI5, HTM4, _TOTINDA, WTKG3, _RFSMOK3, _RFDRHV9, DIABETE4, ASTHNOW, CHCKDNY2, _DRDXAR2
Impact: Successfully consolidated the dataset into a single working file and narrowed the scope from the full BRFSS variable list down to 15 meaningful predictors, reducing noise and keeping the analysis focused on obesity-related factors.


**15th March 2026 —Milestone 3: Data Cleaning & Variable Recoding**( Lulu)
Tasks Completed:
•	Combined all 15 columns to human-readable names (e.g. _BMI5 → BMI, _RFBMI5 → Obese)
•	Recoded numeric codes into meaningful categorical labels for: 
o	Income Category (7 ordered levels + Missing)
o	Education Level (4 ordered levels + Missing)
o	Age Group (6 ordered levels)
o	Sex, Smoking, Heavy Drinking, Physical Activity, Obesity (binary Yes/No)
o	Asthma, Diabetes, Kidney Disease, Arthritis (binary Yes/No)
•	Converted all variables to appropriate data types (Int64, pd.Categorical)
•	Applied ordered categories where applicable to preserve natural hierarchy
Context: The raw BRFSS dataset stores all variables as numeric codes (e.g. 1, 2, 9) which are meaningless without the codebook. These codes needed to be translated into readable labels and structured as ordered or unordered categories depending on the variable type, so they could be correctly interpreted during analysis and modelling.
Solution Implemented: Used pd.Categorical() with ordered=True for variables with a natural hierarchy (Age, Education, Income) and standard mapping for binary variables (Yes/No). Assigned np.nan to unknown or missing codes (e.g. code 9) to handle them properly in later imputation steps.
Impact: Dataset became fully interpretable and self-documenting. Ordered categorical variables preserved their natural hierarchy, which is critical for OrdinalEncoder to assign correct numeric rankings during preprocessing. Binary variables were clearly labeled, eliminating any risk of misinterpretation during modelling.

**15nd March 2026 — Milestone 3:Exploratory Data Analysis (EDA)**
Tasks Completed:
•	Generated summary statistics for all categorical variables using data.describe(include="category")
•	Selected the three numeric variables: BMI, Height(m), Weight(kg)
•	Computed correlation matrix and visualized it using a Seaborn heatmap (coolwarm palette)
Key Findings:
Variable Pair	Correlation	Interpretation
BMI & Weight	0.85	Strong positive — multicollinearity detected
Height & Weight	0.46	Moderate positive
BMI & Height	-0.04	Almost no relationship
Context: Before building any model, it was important to understand how the numeric variables related to each other. Having highly correlated predictors in a model causes multicollinearity, which can distort model estimates, inflate standard errors, and make it harder to interpret which variables are truly driving predictions.
Solution Implemented: Computed a Pearson correlation matrix and visualized it using a Seaborn heatmap with coolwarm colors to make strong and weak relationships immediately visible. Upon detecting a strong correlation of 0.85 between BMI and Weight, the decision was made to drop Height(m) and Weight(kg) and retain only BMI as the sole anthropometric predictor.
Impact: Eliminated multicollinearity from the feature set. Retaining only BMI reduced redundancy while preserving clinically meaningful information, since BMI is a standardized summary measure of both height and weight. This led to a cleaner, more interpretable feature set going into preprocessing.

**21th March 2026 Milestone 4 Data Preprocessing & Feature Engineering** (Lulu)
Tasks Completed:
•	Built three separate sklearn pipelines: 
o	Ordinal Pipeline: SimpleImputer (most_frequent) + OrdinalEncoder for Age, Education, Income
o	Binary Pipeline: SimpleImputer (most_frequent) + OrdinalEncoder for Sex and health condition variables
o	Numeric Pipeline: SimpleImputer (mean) + StandardScaler for BMI
•	Combined all pipelines using ColumnTransformer
•	Applied fit_transform() on feature matrix X
•	Converted processed array back to a readable DataFrame
•	Dropped 43,037 rows with missing target variable (Obese) out of 457,669 observations
Summary Stats After Preprocessing:
•	No missing values remained in any feature column
•	Target variable (Obese) confirmed present and clean
Context: Machine learning models cannot handle raw categorical text, missing values, or variables on vastly different numeric scales. Each variable type required a different treatment strategy — ordinal variables needed order-preserving encoding, binary variables needed simple 0/1 conversion, and the numeric BMI variable needed imputation and scaling to bring it in line with the other features.
Solution Implemented: Built three tailored pipelines and combined them using ColumnTransformer so that each column type received the correct treatment simultaneously. Missing values in features were imputed before encoding to prevent errors. Rows with missing target values were removed separately after preprocessing since imputing the target variable would introduce bias into the model.
Impact: Produced a fully clean, encoded, and scaled dataset with zero missing values across all 11 features. The pipeline approach also ensures that the same transformations can be consistently reapplied to new data in future, making the preprocessing reproducible and production-ready.

**22-March-2026 Milestone 4:Modelling & Evaluation**(Lulu)
Tasks Completed:
•	Built a reusable run_classifier() function incorporating: 
o	80/20 train-test split with stratification
o	SMOTE oversampling to handle class imbalance
o	5-Fold Cross Validation (scoring: F1 Macro)
o	Classification report (Precision, Recall, F1)
o	ROC-AUC score
Models Trained:
Round 1 — With BMI included:
•	Logistic Regression: Suspiciously perfect scores detected
•	Random Forest: Also showed near-perfect results
•	Investigation revealed BMI had a 0.647 correlation with the target (Obese), causing data leakage
Round 2 — BMI dropped (leakage fix):
•	Retrained both Logistic Regression and Random Forest without BMI
•	Performance dropped to realistic levels
Round 3 — Sex variable also dropped:
•	Removed Sex column and retrained both models
•	Ran correlation check on remaining features against target variable
Context: The target variable Obese was imbalanced, with a majority of observations being non-obese. Training a model directly on imbalanced data would cause it to bias towards the majority class and perform poorly at identifying obese individuals. Additionally, BMI was initially included as a feature without realizing it is the clinical definition of obesity (BMI ≥ 30 = Obese), meaning the model was essentially being given the answer during training.
Solution Implemented: Applied SMOTE within the training pipeline to synthetically balance the classes before model training. Used 5-Fold Cross Validation to get a reliable performance estimate. Upon detecting suspiciously perfect scores, ran a correlation check between all features and the target, identified BMI as the leaking variable (r = 0.647), and dropped it. Subsequently also dropped Sex and retrained to further validate the model on genuinely predictive features only.
Impact: Removing BMI brought model scores down from near-perfect to realistic levels, producing an honest and trustworthy evaluation of model performance. Resolving the leakage ensured the final model learns from genuine behavioral and socioeconomic risk factors rather than the clinical definition of the outcome itself, making it meaningful and applicable in a real-world prediction context.
________________________________________

Tasks Completed:
•	Combined all 15 columns to human-readable names (e.g. _BMI5 → BMI, _RFBMI5 → Obese)
•	Recoded numeric codes into meaningful categorical labels for: 
o	Income Category (7 ordered levels + Missing)
o	Education Level (4 ordered levels + Missing)
o	Age Group (6 ordered levels)
o	Sex, Smoking, Heavy Drinking, Physical Activity, Obesity (binary Yes/No)
o	Asthma, Diabetes, Kidney Disease, Arthritis (binary Yes/No)
•	Converted all variables to appropriate data types (Int64, pd.Categorical)
•	Applied ordered categories where applicable to preserve natural hierarchy
Context: The raw BRFSS dataset stores all variables as numeric codes (e.g. 1, 2, 9) which are meaningless without the codebook. These codes needed to be translated into readable labels and structured as ordered or unordered categories depending on the variable type, so they could be correctly interpreted during analysis and modelling.
Solution Implemented: Used pd.Categorical() with ordered=True for variables with a natural hierarchy (Age, Education, Income) and standard mapping for binary variables (Yes/No). Assigned np.nan to unknown or missing codes (e.g. code 9) to handle them properly in later imputation steps.
Impact: Dataset became fully interpretable and self-documenting. Ordered categorical variables preserved their natural hierarchy, which is critical for OrdinalEncoder to assign correct numeric rankings during preprocessing. Binary variables were clearly labeled, eliminating any risk of misinterpretation during modelling.

**15nd March 2026 — Exploratory Data Analysis (EDA)**(lulu)
Tasks Completed:
•	Generated summary statistics for all categorical variables using data.describe(include="category")
•	Selected the three numeric variables: BMI, Height(m), Weight(kg)
•	Computed correlation matrix and visualized it using a Seaborn heatmap (coolwarm palette)
Key Findings:
Variable Pair	Correlation	Interpretation
BMI & Weight	0.85	Strong positive — multicollinearity detected
Height & Weight	0.46	Moderate positive
BMI & Height	-0.04	Almost no relationship
Context: Before building any model, it was important to understand how the numeric variables related to each other. Having highly correlated predictors in a model causes multicollinearity, which can distort model estimates, inflate standard errors, and make it harder to interpret which variables are truly driving predictions.
Solution Implemented: Computed a Pearson correlation matrix and visualized it using a Seaborn heatmap with coolwarm colors to make strong and weak relationships immediately visible. Upon detecting a strong correlation of 0.85 between BMI and Weight, the decision was made to drop Height(m) and Weight(kg) and retain only BMI as the sole anthropometric predictor.
Impact: Eliminated multicollinearity from the feature set. Retaining only BMI reduced redundancy while preserving clinically meaningful information, since BMI is a standardized summary measure of both height and weight. This led to a cleaner, more interpretable feature set going into preprocessing.

**21th March 2026 Data Preprocessing & Feature Engineering** (Lulu)****
Tasks Completed:
•	Built three separate sklearn pipelines: 
o	Ordinal Pipeline: SimpleImputer (most_frequent) + OrdinalEncoder for Age, Education, Income
o	Binary Pipeline: SimpleImputer (most_frequent) + OrdinalEncoder for Sex and health condition variables
o	Numeric Pipeline: SimpleImputer (mean) + StandardScaler for BMI
•	Combined all pipelines using ColumnTransformer
•	Applied fit_transform() on feature matrix X
•	Converted processed array back to a readable DataFrame
•	Dropped 43,037 rows with missing target variable (Obese) out of 457,669 observations
Summary Stats After Preprocessing:
•	No missing values remained in any feature column
•	Target variable (Obese) confirmed present and clean
Context: Machine learning models cannot handle raw categorical text, missing values, or variables on vastly different numeric scales. Each variable type required a different treatment strategy — ordinal variables needed order-preserving encoding, binary variables needed simple 0/1 conversion, and the numeric BMI variable needed imputation and scaling to bring it in line with the other features.
Solution Implemented: Built three tailored pipelines and combined them using ColumnTransformer so that each column type received the correct treatment simultaneously. Missing values in features were imputed before encoding to prevent errors. Rows with missing target values were removed separately after preprocessing since imputing the target variable would introduce bias into the model.
Impact: Produced a fully clean, encoded, and scaled dataset with zero missing values across all 11 features. The pipeline approach also ensures that the same transformations can be consistently reapplied to new data in future, making the preprocessing reproducible and production-ready.

**22-March-2026 Modelling & Evaluation** **Lulu**
Tasks Completed:
•	Built a reusable run_classifier() function incorporating: 
o	80/20 train-test split with stratification
o	SMOTE oversampling to handle class imbalance
o	5-Fold Cross Validation (scoring: F1 Macro)
o	Classification report (Precision, Recall, F1)
o	ROC-AUC score
Models Trained:
Round 1 — With BMI included:
•	Logistic Regression: Suspiciously perfect scores detected
•	Random Forest: Also showed near-perfect results
•	Investigation revealed BMI had a 0.647 correlation with the target (Obese), causing data leakage
Round 2 — BMI dropped (leakage fix):
•	Retrained both Logistic Regression and Random Forest without BMI
•	Performance dropped to realistic levels
Round 3 — Sex variable also dropped:
•	Removed Sex column and retrained both models
•	Ran correlation check on remaining features against target variable
Context: The target variable Obese was imbalanced, with a majority of observations being non-obese. Training a model directly on imbalanced data would cause it to bias towards the majority class and perform poorly at identifying obese individuals. Additionally, BMI was initially included as a feature without realizing it is the clinical definition of obesity (BMI ≥ 30 = Obese), meaning the model was essentially being given the answer during training.
Solution Implemented: Applied SMOTE within the training pipeline to synthetically balance the classes before model training. Used 5-Fold Cross Validation to get a reliable performance estimate. Upon detecting suspiciously perfect scores, ran a correlation check between all features and the target, identified BMI as the leaking variable (r = 0.647), and dropped it. Subsequently also dropped Sex and retrained to further validate the model on genuinely predictive features only.
Impact: Removing BMI brought model scores down from near-perfect to realistic levels, producing an honest and trustworthy evaluation of model performance. Resolving the leakage ensured the final model learns from genuine behavioral and socioeconomic risk factors rather than the clinical definition of the outcome itself, making it meaningful and applicable in a real-world prediction context.
________________________________________
**Milston6.Task1- April 2nd 2026 — Acquire additional dataset (Lulu) **
Work Completed- Review metadata and compare with 2024 structure
•	Retrieved and loaded additional BRFSS datasets 2023.
•	Reviewed metadata for each year, focusing on variable names, labels, coding schemes, and module availability.
•	Compared the 2023 metadata against the 2024 BRFSS structure to identify structural differences.
•	Documented variables that appear consistently across all years Diabetes, Asthma, Kidney Disease, Arthritis.
•	Identified variables present in earlier years but missing in 2024 like Hypertension and Cholesterol.

