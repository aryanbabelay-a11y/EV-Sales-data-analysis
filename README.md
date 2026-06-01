# EV-Sales-data-analysis
EV Sales data analysis using python, sql including 96k rows
# Data Analytics Project README

# 📊 Data Analytics Project

## Overview

This project demonstrates an end-to-end data analytics workflow, starting from raw data ingestion and ending with an interactive business dashboard. The objective is to transform raw data into meaningful insights through data cleaning, exploratory data analysis (EDA), SQL querying, visualization, and reporting.

The project utilizes Python for data processing and analysis, PostgreSQL/MySQL for database management and querying, Power BI for dashboard development, and Gamma for creating a professional project presentation.

---

## Project Objectives

* Load and preprocess raw data using Python.
* Perform data cleaning and transformation.
* Conduct Exploratory Data Analysis (EDA) to uncover patterns and trends.
* Store processed data in a relational database.
* Execute SQL queries to answer business questions.
* Develop an interactive Power BI dashboard.
* Present findings through a professional presentation.

---

## Dataset

**Dataset Name:** [Dataset Name]

**Source:** [Source URL or Provider]

**Description:**
The dataset contains information related to [industry/domain], including key variables such as:

* Variable 1
* Variable 2
* Variable 3
* Variable 4

**Dataset Size:**

* Rows: XXXX
* Columns: XX

---

## Tools & Technologies

| Tool               | Purpose                       |
| ------------------ | ----------------------------- |
| Python             | Data loading, cleaning, EDA   |
| Pandas             | Data manipulation             |
| NumPy              | Numerical computations        |
| Matplotlib         | Data visualization            |
| Seaborn            | Statistical visualization     |
| PostgreSQL / MySQL | Database storage and querying |
| SQL                | Business analysis queries     |
| Power BI           | Dashboard creation            |
| Gamma              | Presentation development      |
| Jupyter Notebook   | Analysis environment          |

---

## Project Workflow

### 1. Data Loading

* Imported dataset into Python.
* Examined structure and data types.
* Identified missing values and inconsistencies.

### 2. Data Cleaning

Performed:

* Missing value treatment
* Duplicate removal
* Data type conversions
* Outlier detection
* Standardization of categorical variables

### 3. Exploratory Data Analysis (EDA)

Analyzed:

* Data distributions
* Correlations
* Trends and patterns
* Category-wise performance
* Key business metrics

Visualizations included:

* Bar Charts
* Histograms
* Box Plots
* Heatmaps
* Trend Analysis Charts

### 4. Database Integration

* Created database schema.
* Imported cleaned data into PostgreSQL/MySQL.
* Optimized tables for querying.

### 5. SQL Analysis

Performed SQL queries to answer business questions such as:

* Top-performing categories
* Revenue and sales trends
* Customer behavior analysis
* Regional performance
* Growth metrics

---

## Dashboard

An interactive Power BI dashboard was developed featuring:

### Dashboard Components

* KPI Cards
* Trend Analysis
* Category Performance
* Geographic Insights
* Interactive Filters and Slicers

### Key Metrics

* Total Sales
* Revenue
* Profit
* Growth Rate
* Customer Count

---

## Results & Insights

Key findings from the analysis include:

1. Identified top-performing segments contributing most to overall performance.
2. Discovered seasonal and monthly trends.
3. Highlighted underperforming areas requiring attention.
4. Revealed important customer behavior patterns.
5. Generated actionable business recommendations.

---

## Project Structure

```text
Project/
│
├── data/
│   ├── raw_data.csv
│   └── cleaned_data.csv
│
├── notebooks/
│   ├── data_cleaning.ipynb
│   └── eda.ipynb
│
├── sql/
│   ├── schema.sql
│   └── analysis_queries.sql
│
├── dashboard/
│   └── dashboard.pbix
│
├── presentation/
│   └── project_presentation.pptx
│
├── images/
│   └── dashboard_screenshots
│
└── README.md
```

---

## How to Run

### Prerequisites

Install required Python libraries:

```bash
pip install pandas numpy matplotlib seaborn sqlalchemy psycopg2
```

### Step 1: Clone Repository

```bash
git clone <repository-link>
cd project-folder
```

### Step 2: Run Data Cleaning

```bash
python data_cleaning.py
```

### Step 3: Perform EDA

```bash
python eda.py
```

### Step 4: Load Data into Database

Execute SQL scripts:

```sql
SOURCE schema.sql;
```

Import cleaned dataset into PostgreSQL/MySQL.

### Step 5: Run SQL Queries

Execute:

```sql
SOURCE analysis_queries.sql;
```

### Step 6: Open Power BI Dashboard

Open:

```text
dashboard.pbix
```

---

## Future Improvements

* Automated ETL pipeline.
* Real-time dashboard integration.
* Predictive analytics and forecasting.
* Machine learning-based recommendations.
* Cloud deployment.

---

## Author

**Name:** [Your Name]

**Role:** Data Analyst

**Skills Demonstrated:**

* Data Cleaning
* Exploratory Data Analysis
* SQL
* Database Management
* Data Visualization
* Dashboard Development
* Business Intelligence

---

## License

This project is intended for educational and portfolio purposes. Modify and use as needed.

