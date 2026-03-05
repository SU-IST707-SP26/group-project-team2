# BRFSS 2024 Obesity Analysis – Key Findings (M1-M3) (Quispe)

## 1. Context

- **Objective:** Identify actionable, interpretable risk factors and high-risk subgroups for obesity using BRFSS 2024 data.  
- **Scope:** Focus on health, demographic, and behavioral predictors.  
- **Target Variable:** Obesity defined as **BMI ≥ 30**.  
- **Team Role (Quispe):** Variable mapping, dataset preprocessing, exploratory data analysis, cluster analysis.

---

## 2. Data Processing Summary (Milestones 1–2)

### 2.1 Variable Mapping (Milestone 1)

- Auto-mapped health, demographic, and behavioral variables due to unavailability of codebook.  
- **Health variables** included: BMI, hypertension, diabetes, cholesterol, heart disease, asthma, physical/mental health days, insurance, dental visits.  
- **Demographic variables:** Age, sex, race, education, income.  
- **Behavioral variables:** Exercise, smoking, alcohol, fruit/vegetable consumption.  
- Obesity target variable created as `BMI ≥ 30`.  
- **Saved mapped dataset:** `brfss_2024_mapped_vars.parquet`.

### 2.2 Data Cleaning & Preprocessing (Milestone 2)

- Missing values imputed with **median**; features with >20% missing flagged.  
- Ordinal variables (e.g., asthma severity) encoded using **OrdinalEncoder**.  
- Numeric features scaled using **RobustScaler**.  
- Outliers flagged using **z-score method**.  
- **Cleaned dataset saved:** `brfss_2024_cleaned_qusipe.parquet`.

---

## 3. Exploratory Data Analysis (Milestone 3)

### 3.1 Distribution of Health Variables

- Histograms and KDE plots show skewness, peaks, and outliers.  
- **Observations:**
  - BMI is right-skewed; most respondents below obesity threshold.  
  - Chronic conditions are often binary; spikes at 0 and 1.  
  - PHYS14D and MENT14D (physical/mental unhealthy days) show heavy tails.  

**Implication:** Identifies common vs. rare risk factors for targeted interventions.

### 3.2 Correlation Analysis

- Pearson correlation heatmap highlights relationships between health variables and obesity.  
- **Key correlations:**
  - BMI ↔ Hypertension  
  - BMI ↔ Diabetes  
  - BMI ↔ Cholesterol  
- Low correlations for some variables indicate unique contributions.

**Implication:** Correlated risk factors may form clusters of metabolic risk and inform feature selection.

### 3.3 PCA and Explained Variance

- **Explained variance:**
  - Component 1: 25%  
  - Component 2: 22%  
  - Component 3: 17%  
  - Remaining components <12% each  
- Scree plot shows clear elbow after the first few components.

**Interpretation:**
- **PC1:** Likely represents cardiometabolic risk (BMI, hypertension, diabetes, cholesterol).  
- **PC2:** Likely represents health burden / self-reported mental-physical health (PHYS14D, MENT14D, RFHLTH).  

**Implication:** Dimensionality reduction using 2–3 components is sufficient for capturing most variation in health predictors.

### 3.4 Health Risk Clusters

- **K-means clustering (3 clusters):**
  1. **Low-risk:** Low BMI, few chronic conditions, good self-reported health.  
  2. **Moderate-risk:** Some chronic conditions, slightly elevated BMI.  
  3. **High-risk:** High BMI, multiple chronic conditions, poor self-reported health.

- **Visualization:**
  - Scatter plot of clusters using first two health variables shows partial separation.  
  - PCA-based 2D scatter plot shows better separation of clusters in reduced-dimensional space.

**Implication:** Clusters identify actionable subgroups for targeted interventions.

---

## 4. Key Insights

1. Obesity strongly correlates with cardiometabolic conditions (hypertension, diabetes, cholesterol).  
2. Mental and physical health burden contributes to obesity-related risk.  
3. PCA confirms that **2–3 components summarize the majority of variance**.  
4. Clustering identifies **distinct high-risk subgroups** for potential intervention.  
5. Analysis provides **interpretable, actionable insights** for public health stakeholders.

---

## 5. Next Steps

- Rank **modifiable predictors** based on cluster contribution and public health relevance.  
- Prepare **visual summary plots**

