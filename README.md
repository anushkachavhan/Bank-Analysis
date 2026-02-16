# Bank-Analysis
This project focuses on analyzing banking financial data to extract meaningful insights related to loan distribution, funded amount, customer segmentation, and overall financial performance. 
The analysis was performed using SQL, Power BI, Excel, and Tableau to demonstrate end-to-end data analytics workflow — from data extraction to interactive dashboard visualization.

 Objectives

Analyze year-wise loan amount distribution
Compare Loan Amount vs Funded Amount
Perform department-wise and customer-wise analysis
Identify key KPIs for financial performance tracking
Build interactive dashboards for business decision-making

 Tools & Technologies Used
 
SQL – Data extraction & transformation
Power BI – Data modeling & interactive dashboards
Excel – KPI analysis & dashboard creation
Tableau – Advanced visualization

The first step was to understand the structure and contents of the dataset.

Actions performed:
Reviewed all available tables and columns
Identified key business fields such as:
- Loan Amount
- Funded Amount
- Customer ID
- Department
- Employee
- Fiscal Year
Understood relationships between tables
Identified important KPIs required for analysis

#Data Cleaning

1 Handling Missing Values
2 Removing Duplicate Records
3 Fixing Data Types
4 Validating Data Consistency



# Data Import

The dataset was imported into tools for analysis.

### Tools used:

* SQL Server / MySQL → for querying
* Power BI → for dashboard
* Excel → for analysis
* Tableau → for visualization

### Actions performed:

* Imported raw data files
* Verified all columns loaded correctly
* Checked data types (numeric, text, date)



#  Data Transformation using SQL

Data was transformed into meaningful format for analysis.

### Created calculated summaries such as:

### Total Loan Amount by Year

```sql
SELECT Fiscal_Year,
       SUM(Loan_Amount) AS Total_Loan
FROM Loans
GROUP BY Fiscal_Year;
```

---

### Total Funded Amount

```sql
SELECT SUM(Funded_Amount) AS Total_Funded
FROM Loans;
```

---

### Department-wise analysis

```sql
SELECT Department,
       COUNT(Employee_ID) AS Total_Employees
FROM Employees
GROUP BY Department;
```

---

# Step 5: Data Modeling in Power BI

After cleaning, data was imported into Power BI.

### Actions performed:

* Loaded cleaned tables
* Created relationships between tables
* Built proper data model (Star Schema)

Example relationships:

* Customers → Loans
* Employees → Departments

This improves performance and accuracy.

---

# Step 6: Creating Measures using DAX

Measures were created to calculate KPIs.

### Example measures:

**Total Loan Amount**

```DAX
Total Loan = SUM(Loans[Loan_Amount])
```

**Total Funded Amount**

```DAX
Total Funded = SUM(Loans[Funded_Amount])
```

# Step 7: Creating Visualizations

Visualizations were created in Power BI, Excel, and Tableau.

---

## 7.1 KPI Cards

Used to display:

* Total Loan Amount
* Total Funded Amount
* count of ownership



---

## 7.2 Bar Chart

Used to show:

* Loan Amount by Year
* Loan Amount by Department


---

## 7.3 Line Chart

Used to show:

* Loan trends over time


## 7.4 Pie Chart

Used to show:

* Loan distribution by Verification status 


---

## 7.5 Slicers / Filters

Used to filter data by:

* Year
* Ownership
* Loan status

Purpose:
Make dashboard interactive.

---

# Step 8: Dashboard Creation

Combined all visuals into interactive dashboard.

Dashboard contains:

* KPI summary
* Trend analysis
* Department comparison
* Interactive filters

Tools used:

* Power BI
* Excel
* Tableau

---

# Step 9: Insights Generated

From the dashboard, the following insights were identified:

* Identified year with highest loan amount
* Observed gap between loan and funded amount
* Identified best performing departments
* Found financial trends and patterns

---

# Step 10: Conclusion

This project successfully demonstrates the complete data analysis workflow:

* Understanding data
* Cleaning data
* Transforming data
* Modeling data
* Creating dashboards
* Generating insights


