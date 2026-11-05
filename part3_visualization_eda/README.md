# Part 3 – Visualization and Exploratory Data Analysis (EDA)

## Project Name
**TrendPulse – YouTube Trending Analytics**

## Overview
Part 3 focuses on analysing YouTube trending video data from India, the United States and Great Britain. The objective is to identify patterns, understand audience engagement, analyse video retention and present meaningful insights through data visualisations.

## Objectives
- Perform descriptive statistical analysis.
- Identify outliers using the IQR method.
- Compare average views across countries.
- Analyse video categories and engagement rates.
- Study correlations between video performance metrics.
- Perform engagement funnel analysis.
- Analyse trending retention on days 2, 3, 5 and 7.
- Conduct cohort analysis.
- Develop data-driven content strategy recommendations.

## Tools and Technologies
- Python – Programming language
- Google Colab – Notebook execution
- Pandas – Data manipulation and analysis
- NumPy – Numerical computations
- Matplotlib – Static visualisation
- Plotly – Interactive visualisation

## Dataset
The project uses the cleaned YouTube trending dataset generated in Part 2.

Countries covered:
- India
- United States
- Great Britain

## Analysis Performed

### 1. Descriptive Statistics
Calculated mean, median, mode and skewness for numerical variables.

### 2. Outlier Detection
Applied the Interquartile Range (IQR) method to identify unusual values in views, likes and engagement rates.

### 3. Data Visualisation
Created five Matplotlib visualisations:
- Average views by country
- Top 10 trending video categories
- Engagement rate distribution
- Views versus likes
- Trending records over time

Created two interactive Plotly visualisations:
- Interactive views versus likes by country
- Average engagement rate by category

### 4. Correlation Analysis
Generated a correlation matrix and heatmap to examine relationships between numerical metrics.

### 5. Engagement Funnel
Analysed unique videos with views, likes and comments.

### 6. Retention Analysis
Measured observed trending presence on days 2, 3, 5 and 7 after the first trending date.

### 7. Cohort Analysis
Grouped videos according to their first trending month and compared their subsequent trending presence.

## Project Structure

```text
part3_visualization_eda/
│
├── data/
│   └── TrendPulse_Part2_Cleaned.csv
│
├── notebooks/
│   └── Part3_Visualization_EDA.ipynb
│
├── output/
│   ├── TrendPulse_Part3_Analysis.csv
│   ├── Descriptive_Statistics.csv
│   ├── Engagement_Funnel.csv
│   ├── Retention_Analysis.csv
│   └── Cohort_Analysis.csv
│
├── README.md
├── requirements.txt
└── PART3_RUBRIC.md
```

## How to Run
1. Open the notebook using Google Colab.
2. Upload `TrendPulse_Part2_Cleaned.csv`.
3. Install the required libraries if they are not already available.
4. Execute the notebook cells sequentially.
5. Review the generated charts and analysis.
6. Export the output CSV files.

## Expected Outcome
The analysis provides insights into country-wise video performance, popular categories, engagement patterns, correlations and observed trending retention. These findings can support data-driven YouTube content planning.

## Note
Retention in this project refers to a video's observed presence in the trending dataset. It does not represent actual viewer retention or watch time.

---

**Project:** TrendPulse – YouTube Trending Analytics  
**Module:** Part 3 – Visualization and EDA