# LEGO Data Analysis Project (SQL)

## Overview  
LEGO is a popular brand of toy building bricks. They are often sold in sets in order to build a specific object. Each set contains a number of parts in different shapes, sizes and colors. It's a popular fact that LEGO reuses pieces in a variety of sets. This project aims to analyze the extent to which different LEGO sets share common parts. Specifically, we investigate whether a user could theoretically recreate or approximate new LEGO builds using only the pieces from sets they already own. By analyzing part and color overlap across sets, we evaluate how interchangeable LEGO components are and how feasible it is to construct alternative builds without purchasing new sets.This analysis can provide insight into sustainability and creativity within LEGO building, highlighting how existing pieces can be reused to expand building possibilities.


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
