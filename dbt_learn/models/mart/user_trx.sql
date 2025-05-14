{{config(materialized='table', alias='user_trx_daily')}}

with daily_trx AS (
	SELECT 
		account_id,
		SUM(amount) as total_trx_amount
	FROM staging.fact_transaction
	GROUP BY 1
),
user_detail AS (
	SELECT 
		num_account_id,
		str_fullname
	FROM staging.dim_user
)
SELECT DISTINCT
	account_id,
	str_fullname as fullname,
	total_trx_amount
FROM daily_trx as dt
LEFT JOIN user_detail as ud on dt.account_id = ud.num_account_id
WHERE 1=1
ORDER BY 1