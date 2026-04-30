
# Predicting Diabetes From A Health Survey Using Machine Learning on BRFSS data


### Team
Lulu Rashid Massasi - lr-2026
Akhil Arakkal - AkhilHaris111
Diego Quispe - dlqui
### Introduction

This project addresses the problem of predicting diabetes risk using large scale health survey data from the Behavioral Risk Factor Surveillance System (BRFSS), collected and maintained by the Centers for Disease Control and Prevention (CDC). The primary stakeholders are public health researchers, healthcare workers, and policy makers who need scalable, data driven tools to identify individuals at high risk of diabetes and design effective prevention programs.

This problem is significant because diabetes is a chronic condition that often goes undetected until serious complications arise, making early identification critical. Traditional clinical screening methods, while accurate, depend on laboratory infrastructure that is costly and difficult to deploy at a population level, leaving a clear gap that scalable, survey based prediction can help fill.

To address this, we developed a machine learning pipeline using demographic, behavioral, and clinical features from the BRFSS dataset, comparing multiple models like Random Forest, XGBoost to evaluate predictive performance. Feature importance analysis was conducted to identify the key drivers of diabetes risk, offering stakeholders interpretable insights that go beyond common assumptions, such as BMI being the primary indicator, and supporting more informed, evidence based public health decision making.

### Literature Review

Prior work shows that machine learning models are effective for diabetes prediction using structured survey data like BRFSS, though variable selection and preprocessing choices vary significantly across studies. A consistent challenge across healthcare classification tasks is class imbalance, diabetic cases represent the minority class, and models that do not account for this tend to underperform on the positive predictions that matter most to stakeholders. Techniques such as SMOTE and class weighting are widely used to address this problem.

Based on these findings, we selected Random Forest and XGBoost (base and tuned) as our models, applying SMOTE and class weights to handle the imbalance present in our BRFSS dataset. Evaluation was conducted using Macro F1, ROC-AUC, and precision-recall metrics to ensure performance was assessed beyond simple accuracy. Feature importance analysis was included to go beyond prediction and offer interpretable insights, helping stakeholders understand which risk factors most strongly drive diabetes risk, and supporting more informed, evidence-based public health decision-making.

#### Data

- Source: BRFSS (CDC),2024
- Size: ~457,669 records
- Features: ~10–15 selected variables
- Target: DIABETE_BIN (0 = no diabetes, 1 = diabetes/prediabetes)
- Class imbalance: ~83% / 17%

#### Methods

##### Preprocessing 

- Mean Imputation
- StandardScaler
- Correlation Analysis
- Categorical Encoding
- Stratified train-test split

##### Imabalance Handling
- SMOTE
- Class Weighting

##### Models
- Random Forest
- XGBoost (Base and tuned)

##### Tuning
- scale_pos_weight
- n_estimators
- learning_rate
- max_depth
- subsample
- gamma 

#### Supporting files

- Modelling_2024r.ipnyb - Combined file of Arakkal and Lulu which includes data encoding, preprocessing and modeling

### Results

##### Random Forest
- macro avg F1 scores: 0.66
- macro avg recall: 0.71
- ROC-AUC: 0.87

##### XGBoost (Base)
- macro avg F1 scores: 0.64
- macro avg recall: 0.80
- ROC-AUC: 0.90

##### XGBoost (Tuned)
- macro avg F1 scores: 0.65
- macro avg recall: 0.71
- ROC-AUC: 0.87

##### Key Findings
- Class imbalance significantly impacts all models, with recall consistently outperforming precision across Random Forest, XGBoost Base, and XGBoost Tuned
- XGBoost Base is the strongest performer, achieving the highest ROC-AUC (0.90) and macro Recall (0.80), making it the most suitable candidate for a diabetes screening tool
- Hyperparameter tuning did not meaningfully improve XGBoost, suggesting the base model was already near-optimal for this dataset
- All models show competitive ROC-AUC scores (0.87–0.90), confirming that BRFSS survey data carries strong predictive signal for diabetes risk



### Discussion

Results show diabetes risk can be predicted reasonably well using survey data, but performance is limited by imbalance and feature overlap.

The project meets its main goal by providing a scalable risk prediction system for public health use. Importantly, the system emphasizes interpretability through visualization, allowing users to understand risk patterns rather than relying only on predictions.

In addition, we explored type-specific diabetes models (Type 1 and Type 2) to evaluate whether survey features can distinguish between different diabetes types. The Type 1 model showed weaker predictive performance due to limited signal and stronger class imbalance, while the Type 2 model performed slightly better but was still constrained by overlapping feature distributions. These experiments further reinforce that BRFSS features are more suitable for general diabetes risk prediction than fine-grained subtype classification.

### Limitations

- Severe class imbalance (~95/5 diabetic vs non-diabetic) persists even after SMOTE resampling, limiting the model's ability to reliably detect the minority diabetic class
- BRFSS is a self-reported survey, meaning features like BMI, general health, and lifestyle behaviors are subject to response bias and lack the clinical precision of lab based measurements
- Hyperparameter tuning of XGBoost did not yield meaningful improvements over the base model, suggesting the performance ceiling may be constrained by the data quality rather than model configuration
- SMOTE improved training balance but did not consistently translate to better test performance, particularly for the minority (diabetic) class recall


### Future work

- Improve class imbalance handling through advanced resampling techniques and threshold tuning to better detect the minority diabetic class
- Enrich the feature space by incorporating additional BRFSS variables and engineered interaction terms to improve model separability and predictive power
- Apply SHAP values for deeper interpretability and validate the model across different BRFSS survey years to test generalizability
- Explore linking BRFSS predictions with clinical outcome data to move closer to real world deployment as a population level screening tool

#### References
1. https://pmc.ncbi.nlm.nih.gov/articles/PMC12508184/
2. https://www.cdc.gov/brfss/index.html
3. https://pmc.ncbi.nlm.nih.gov/articles/PMC12308079/
4. https://www.nature.com/articles/s41598-025-20505-9
5. https://www.nmcd-journal.com/article/S0939-4753(24)00204-7/abstract

---


