
-- SQL notebook for data prepocessing and analysis of the data sets
-- Input tables: disbursements, repayments
-- Author: Eric Odongo
-- Date  : 20th Mar 2025

--Basic explorations of the two given tables



select * from practice.disbursements  limit 5;

select * from practice.repayments limit 5;

--type casting


select count(*) as customer_count from practice.disbursements;

select count(*) as customer_count from practice.repayments;

--Let's EXPLORE THE DISBURSEMENTS TABLE

-- get the number of distinct loan accounts

select count(distinct account_num) as unique_accounts from practice.disbursements;

-- we have 26,542 unique accounts, we might consider droping duplicate accounts in further analysis

-- get the number of distinct customers

select count(distinct customer_id) as unique_customers from practice.disbursements;

-- we have 2,996 unique customers in the disbursements table

-- Create a new table for distinct accounts for further analysis

-- drop table practice.unique_disbursements;

create table practice.unique_disbursements as
select distinct account_num, customer_id, cast(loan_amount as integer) as loan_amount1, 
                tenure, cast(disb_date as date) as disb_date1, loan_fee
from practice.disbursements;

select * from practice.unique_disbursements ;

-- Basic Summary statistics

select round(avg(loan_amount1), 2) as avg_amount, max(loan_amount1) as max_amount, 
       min(loan_amount1) as min_amount
from practice.unique_disbursements;

















