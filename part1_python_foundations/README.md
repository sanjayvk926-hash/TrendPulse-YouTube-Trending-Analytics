# Part 1 – Python Foundations & Data Structures

## Project
TrendPulse – YouTube Trending Analytics

## Objective
Apply core Python programming concepts to analyse YouTube trending video records from India, USA and Great Britain.

## Dataset
- INvideos.csv
- USvideos.csv
- GBvideos.csv
- categories.csv

## Concepts Implemented
- Python data types and variables
- Lists, dictionaries, tuples and sets
- Loops and conditional statements
- Functions and variable scope
- Type conversion
- Exception handling
- Date parsing
- Title feature extraction
- Rule-based video classification
- Code refactoring

## Processing
- Removed exact duplicate records.
- Combined three country datasets.
- Converted records into a list of dictionaries.
- Extracted title length, word count and hashtag count.
- Identified uppercase titles and punctuation.
- Parsed trending dates.
- Classified video popularity using view-count thresholds.
- Classified content using title keywords.

## Popularity Classification
- Viral: 1,000,000 or more views
- Popular: 100,000–999,999 views
- Regular: Below 100,000 views
- Unknown: Invalid or unavailable view count

These are project-defined thresholds.

## Content Classification
Education, Gaming, Entertainment, Sports, News and Other.

This is a basic keyword-based classification approach.

## Output
`output/TrendPulse_processed_records.json`

## Tools
Python, Pandas and Google Colab.

## Limitations
Keyword-based classification may not accurately identify every video's actual content category.