# Part 2 – NumPy & Pandas

## Project
TrendPulse – YouTube Trending Analytics

## Objective
Apply NumPy and Pandas operations to analyse YouTube trending videos across India, USA and Great Britain.

## Implementation

1. NumPy arrays, shapes and data types
2. Vectorised engagement metrics
3. Min-Max normalisation
4. NumPy broadcasting
5. Dataset inspection and cleaning
6. Missing-value handling and filtering
7. Dataset merging and concatenation
8. GroupBy and aggregation
9. Days-to-trend calculation
10. Trending lifespan analysis

## Key Metrics

**Total Engagement**

Likes + Comments

**Engagement Rate**

(Total Engagement / Views) × 100

**Normalised Views**

(Views - Minimum Views) / (Maximum Views - Minimum Views)

**Days to Trend**

Difference between publication date and first observed trending date.

**Trending Lifespan**

Number of distinct dates a video appears in the trending dataset, calculated separately by country.

## Output Files

- TrendPulse_Part2_Cleaned.csv
- TrendPulse_Part2_Merged.csv
- Country_Analysis.csv
- Category_Analysis.csv
- Trending_Lifespan.csv

## Tools Used

- Python
- NumPy
- Pandas
- Google Colab

## Limitations

Trending lifespan represents observed trending dates in the available dataset, not necessarily the complete lifetime of a video on YouTube.