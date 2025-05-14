{{ config(materialized = 'table', alias='fact_transaction') }}

SELECT
	transaction_id as tr_id,
	account_id as account_id,
	card_id,
	LOWER(transaction_type) as transaction_type,
	CAST(amount as numeric) as amount,
	merchant,
	DATE(transaction_date) as transaction_date
FROM raw.transactions