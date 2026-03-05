# BRFSS 2024 Obesity Analysis – Project Summary & Key Findings

## Project Overview

This project analyzes the **BRFSS 2024 dataset** to identify **risk factors and high-risk population groups associated with obesity**.

The goal is to produce **interpretable insights and predictive models** that can help public health organizations identify populations that may benefit from targeted interventions.

Obesity is defined as:

BMI ≥ 30

The analysis focuses on **health, behavioral, and demographic predictors** to understand patterns related to obesity.

---

# Project Progress Summary

## Milestone 1 – Variable Mapping and Feature Selection (Quispe)

### What We Did

- Loaded the BRFSS dataset (`brfss_clean_processed.parquet`)
- Explored column names to identify relevant variables
- Created a **mapping of health, behavioral, and demographic variables**
- Generated a binary **obesity target variable (BMI ≥ 30)**
- Saved a filtered dataset containing selected features

Output dataset:

brfss_2024_mapped_vars.parquet


### Variables Considered

**Health Variables**
- BMI
- Hypertension
- Diabetes
- Cholesterol
- Asthma
- Heart disease
- Physical health days
- Mental health days

**Behavioral Variables**
- Exercise
- Smoking
- Alcohol consumption
- Fruit and vegetable intake

**Demographic Variables**
- Age
- Sex
- Race
- Education
- Income

---

# Milestone 1 – Data Acquisition & Understanding (Lulu)

The purpose of this task was to establish the **foundation for the entire project** by downloading the BRFSS 2024 dataset and the official codebook, which are required to properly interpret the survey variables before any preprocessing or modeling.

### Dataset Acquisition

- The original BRFSS dataset was provided in **.XPT format**.
- File size was approximately **1.01 GB**, which exceeded GitHub storage limitations.
- The dataset was converted into **Parquet format** and divided into smaller files to meet the **GitHub 25 MB limit**.

The combined dataset contains:

- **457,669 observations**
- Hundreds of variables covering:
  - demographics
  - health conditions
  - lifestyle behaviors
  - chronic disease indicators

The **BRFSS 2024 codebook** was downloaded and uploaded successfully to help interpret variable definitions and coding structures.

### Initial Data Inspection

Preliminary exploration included:

- Reviewing **data types**
- Inspecting **memory usage**
- Generating **summary statistics**

These steps helped guide later decisions about **data cleaning, feature encoding, and modeling preparation**.

---

## Milestone 1 – Task 2: Review Variables and Categorize Features (Lulu)

This task focused on understanding the structure and meaning of the BRFSS variables using the official codebook.

The objective was to **categorize variables into meaningful groups** and identify **behavioral/lifestyle predictors related to obesity**.

### Key Behavioral Variables Identified

**Physical Activity (_TOTINDA)**  
Indicates whether the respondent engaged in exercise during the past 30 days.

Results:

Had physical activity or exercise: 350,061  
No physical activity in last 30 days: 106,294

---

**Smoking Status (_RFSMOK3)**  
Represents current smoking risk classification.

The variable was converted from numeric codes into a **binary categorical variable** to improve interpretability.

Results:

No: 378,554  
Yes: 47,094

---

**Heavy Drinking (_RFDRHV9)**  
Indicates heavy alcohol consumption.

The variable was converted from numeric codes into **Yes/No labels** for clarity.

Results:

No: 386,812  
Yes: 24,160

---

These variables represent **key lifestyle behaviors known to influence obesity risk**.

---

## Milestone 1 – Task 3: Identify Obesity Target Variable (Lulu)

This task focused on defining the **target variable for obesity prediction**.

The project uses:

_RFBMI5

This variable directly encodes **obesity status based on the clinical definition of BMI ≥ 30**.

### Processing Steps

- Converted numeric coding into **binary categorical labels**:
  - Yes = Obese
  - No = Not Obese
- Missing values were preserved as **NaN** to avoid introducing bias during modeling.

### Results

Obese (Yes): 286,203  
Not Obese (No): 128,430

This step established a **clean and interpretable target variable** for predictive modeling.

---

# Milestone 2 – Data Cleaning and Preprocessing (Quispe)

### What We Did

- Investigated missing values
- Applied **median imputation** to numeric variables
- Encoded ordinal categorical variables
- Applied **RobustScaler** to normalize features
- Flagged potential outliers using Z-score methods

Output dataset:

brfss_2024_cleaned_qusipe.parquet

---

# Milestone 2 – Behavioral Data Cleaning (Lulu)

Missing value handling was critical to prevent biased analysis and model failures.

### Imputation Strategy

- Median imputation is robust for skewed data.
- Mode imputation was applied for categorical variables.

### Feature Adjustments

Three numeric variables were **removed due to data leakage**:

- BMI
- Height
- Weight

These variables directly determine the **target variable (Obese)** and including them would cause **model leakage**.

---

### Encoding Strategy

No nominal categorical variables were present.

Feature types included:

**Ordinal variables**
- Age group
- Education level
- Income category

Encoded using **OrdinalEncoder** to preserve ranking.

**Binary variables**
- Sex
- Smoker
- Heavy Drinker
- Physical Activity

Encoded as **0/1 values**.

---

### Feature Scaling

StandardScaler was not applied because:

- After removing leakage variables, no continuous numeric features remained.

---

### PCA

PCA was not applied in this stage because:

- PCA requires continuous numeric features
- The remaining dataset contained mostly encoded categorical variables.

---

# Milestone 3 – Exploratory Data Analysis (EDA)

### Analyses Performed

1. **Distribution analysis of health variables**
2. **Correlation heatmap**
3. **Principal Component Analysis (PCA)**
4. **Clustering analysis (K-means)**

---

# Key Findings from the Analysis

## Distribution Insights

- BMI distribution is **right-skewed**, meaning most respondents are below the obesity threshold but a significant tail represents obese individuals.
- Binary health variables (diabetes, hypertension) show strong separation patterns.
- Mental and physical health days show **long-tail distributions**, indicating variability in health burden.

---

## Correlation Findings

Several cardiometabolic variables show positive association with obesity:

Strong correlations observed between:

- BMI and Hypertension
- BMI and Diabetes
- BMI and Cholesterol

These relationships indicate the presence of **cardiometabolic risk clusters**.

---

## PCA Results

Explained variance by principal components:

Component | Variance Explained
--- | ---
PC1 | 0.25
PC2 | 0.22
PC3 | 0.17
PC4 | 0.12
PC5 | 0.09

The first **three components explain approximately 64% of the variance**.

Interpretation:

- **PC1 likely represents cardiometabolic risk**
- **PC2 captures general health burden**
- **PC3 may represent behavioral or lifestyle differences**

This confirms that a **small number of latent health factors drive much of the variability in the dataset.**

---

## Health Risk Clusters

Using **K-means clustering (k = 3)** we identified three groups:

Cluster | Description
--- | ---
Low Risk | Lower BMI and fewer chronic conditions
Moderate Risk | Some chronic conditions and moderate BMI
High Risk | High BMI and multiple chronic health issues

When visualized using **PCA space**, clusters become more distinguishable.

This suggests that **dimensionality reduction improves cluster separation**.

---

# Challenges Encountered During the Project

## 1. High Number of Columns

The BRFSS dataset contains **hundreds of variables**, many of which are:

- redundant
- survey-specific codes
- not relevant to obesity prediction

This required **manual and heuristic-based feature selection**.

---

## 2. Sparse Data

Many variables contain:

- large numbers of missing values
- conditional survey questions

This results in **sparse columns**, meaning:

Many rows exist but **few valid values per feature**.

Sparse data can introduce **bias when selecting features too early**.

To address this we:

- focused on variables with stronger population coverage
- applied robust scaling and imputation

---

## 3. Codebook

The dataset initially did not include a codebook, which required:

- interpreting column names
- referencing external BRFSS documentation
- identifying health variables heuristically

---

# What We Learned

### 1. Cardiometabolic Factors Drive Obesity Patterns

Variables related to **hypertension, diabetes, and cholesterol** consistently align with obesity risk.

---

### 2. Dimensionality Reduction is Effective

PCA shows that **a small number of components capture most of the health variability**.

---

### 3. Clustering Reveals Population Subgroups

Clustering allows us to detect **groups of individuals with similar health risk profiles**, which can help design **targeted interventions**.

---

### 4. Data Sparsity Must Be Managed Carefully

Feature selection must avoid introducing bias from sparse variables.

---

# Project Direction Toward Final Goal

The exploratory analysis indicates that the dataset contains **clear health risk patterns**.

The project will now shift from **exploration to prediction**.

The final objective is to build **predictive models capable of identifying obesity risk using health and behavioral variables.**

---

# Milestone 4 – Model Development (Next Step)

Planned models include:

### Logistic Regression
- Interpretable baseline model
- Useful for identifying feature importance

### Random Forest
- Captures nonlinear relationships
- Handles feature interactions well

### Gradient Boosting (XGBoost or similar)
- High predictive performance
- Often strong on tabular health datasets

---

## Evaluation Metrics

Models will be evaluated using:

- Accuracy
- Precision
- Recall
- F1-score
- ROC-AUC

Cross-validation will be used to ensure **robust model evaluation**.

---

# Expected Outcome

By the end of the project we aim to:

1. Identify **key predictors of obesity**
2. Develop **predictive models for obesity risk**
3. Provide **interpretable insights for public health decision-making**

---

# Next Steps

Milestone 4 tasks:

1. Prepare final modeling dataset
2. Split data into training and testing sets
3. Train baseline models
4. Compare model performance
5. Identify most important predictors
