-- SQL notebook for data preprocessing and analysis of the data sets
-- Input tables: disbursements, repayments
-- Author: Joseph Kibira
-- Date  : 21st Mar 2025

-- Basic explorations of the two given tables

-- Preview the first few rows of the disbursements table
select * from practice.disbursements limit 5;

-- Preview the first few rows of the repayments table
select * from practice.repayments limit 5;

-- Data type conversions and initial counts

-- Count the total number of records in the disbursements table
select count(*) as total_disbursements from practice.disbursements;

-- Count the total number of records in the repayments table
select count(*) as total_repayments from practice.repayments;

-- Detailed exploration of the disbursements table

-- Determine the number of unique loan accounts
select count(distinct account_num) as unique_loan_accounts from practice.disbursements;

-- Note: There are 26,542 unique loan accounts. Consider removing duplicates for further analysis.

-- Determine the number of unique customers
select count(distinct customer_id) as unique_customers from practice.disbursements;

-- Note: There are 2,996 unique customers in the disbursements table.

-- Create a new table with distinct loan accounts for further analysis

-- Drop the existing table if it exists
drop table if exists practice.distinct_disbursements;

-- Create a new table with distinct loan accounts
create table practice.distinct_disbursements as
select distinct account_num, customer_id, 
       cast(loan_amount as decimal(10,2)) as loan_amount, 
       tenure, 
       cast(disb_date as date) as disbursal_date, 
       loan_fee
from practice.disbursements;

-- Preview the new table
select * from practice.distinct_disbursements limit 10;

-- Summary statistics for the distinct disbursements table

-- Calculate average, maximum, and minimum loan amounts
select 
       round(avg(loan_amount), 2) as average_loan_amount, 
       max(loan_amount) as maximum_loan_amount, 
       min(loan_amount) as minimum_loan_amount
from practice.distinct_disbursements;
