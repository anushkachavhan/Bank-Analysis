Create Database Bank_loan_analysis;
use  Bank_loan_analysis;

select count(*) from finance_1;
select count(*) from finance_2;

desc finance_1;
desc finance_2;

-- altering data type  for issue_d 

Alter table finance_1
add column issue_date Date;

ALTER TABLE finance_1
ADD PRIMARY KEY (id);


UPDATE finance_1
SET issue_date = STR_TO_DATE(issue_d, '%b-%Y')
WHERE id IS NOT NULL;
SET SQL_SAFE_UPDATES = 0;


UPDATE finance_1
SET issue_date = STR_TO_DATE(issue_d, '%d-%m-%Y');

alter table finance_1 drop column issue_d;
alter table finance_1 Rename column issue_date To issue_d;

select * from finance_1 ;

desc finance_1;


-- Q1 Year Wise loan Payment stats

select year(issue_d) as LoanYear,
Round(Sum(loan_amnt)/1000000,2) as LoanAmount from finance_1 group by 
LoanYear order by LoanYear;

desc finance_1;
desc finance_2;
-- Q2 Grade and sub grade wise revol_bal
select 
f1.grade as grade,f1.sub_grade as sub_grade,
round(sum(f2.revol_bal)/1000000,2) as total_revol_bal
from  finance_1 as f1 
left join finance_2 as f2
on f1.id = f2.id
group by 
f1.grade ,
f1.sub_grade
order by total_revol_bal  desc;

-- Q3 Total Payment for Verified Status Vs Total Payment for Non Verified Status

SELECT
    f1.verification_status AS verification_status,
    round(SUM(f2.total_pymnt)/1000000,2) AS total_payment
FROM finance_1 AS f1
LEFT JOIN finance_2 AS f2
    ON f1.id = f2.id
GROUP BY f1.verification_status;

-- Q4State wise and last-credi_pulled_d wise Loan status
select 
    YEAR(f1.issue_d) AS issue_year,

    SUM(CASE WHEN f1.loan_status = 'Charged Off'
             THEN 1 ELSE 0 END) AS `Charged Off`,

    SUM(CASE WHEN f1.loan_status = 'Current'
             THEN 1 ELSE 0 END) AS `Current`,

    SUM(CASE WHEN f1.loan_status = 'Fully Paid'
             THEN 1 ELSE 0 END) AS `Fully Paid`,

    COUNT(f2.last_credit_pull_d) AS `Grand Total`

FROM finance_1 f1
LEFT JOIN finance_2 f2
    ON f1.id = f2.id
GROUP BY YEAR(f1.issue_d)
ORDER BY issue_year;



-- Q5 home Ownership Vs last payment  stats

select 
f1.home_ownership as 'Home Ownership Type ',
count(f2.last_pymnt_d) as 'last Payment date'
from finance_1 as f1
left join finance_2 as f2
on f1.id = f2.id
Group by f1.home_ownership
order by 'count of last_pymnt_d';