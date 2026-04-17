# LEGO Data Analysis Project (SQL)

## Overview  
This project focuses on analyzing LEGO set data using SQL to identify patterns in how colors and parts are used across different sets and themes. The goal is to explore the structure of LEGO sets and understand trends such as the most commonly used colors, parts, and how these elements vary by theme.

## Project Objective  
The main objective of this project is to answer the following question:

**What patterns can be identified in the use of colors and parts across LEGO sets and themes?**

## Dataset  
The dataset used in this project consists of multiple related tables representing LEGO data, including:

- `sets` – information about each LEGO set  
- `themes` – categories/themes of LEGO sets  
- `inventories` – links sets to their inventories  
- `inventory_parts` – contains part, color, and quantity data  
- `parts` – details about individual LEGO parts  
- `colors` – color information  
- `part_categories` – classification of parts  

These tables are connected using primary and foreign keys, allowing for complex queries across multiple datasets.

## Key Analysis Topics  

The project includes the following SQL analyses:

- Top 10 most reused parts across all LEGO sets
- Top 10 most reused colors across all LEGO sets
- Total number of parts used per set
- Number of unique parts used per set
- Number of shared parts between two LEGO sets (using variables)
- Parts used in more than 10 sets (using HAVING)
- Sets with more than 500 total pieces (using HAVING)
- Parts used more than the average (using subqueries)
- Number of sets per theme
- Color usage distribution by theme
- Number of LEGO sets released per year
- Total number of LEGO pieces used per year

## Example Query  

The following query analyzes the distribution of colors across different LEGO themes:

```sql
--SELECT STATEMENT GOES HERE
```

## Tools Used  

- SQL (T-SQL)  
- SQL Workbench / Azure Data Studio / VS Code  
- Excel (for data preparation)  
- GitHub (for version control and project documentation)

## Key Insights  

- Certain colors, such as black and gray tones, are consistently used across multiple themes  
- Some themes show a wider variety of colors, indicating more complex or detailed designs  
- A small number of parts appear very frequently across many sets  
- Larger sets tend to have significantly higher part diversity  

## Conclusion  

This project demonstrates how SQL can be used to analyze relational datasets and uncover meaningful patterns. By combining multiple tables and applying aggregation, filtering, and advanced query techniques, it is possible to gain insights into how LEGO sets are designed and structured.
