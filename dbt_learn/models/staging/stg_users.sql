{{ config(materialized='table', alias='dim_user') }}

WITH raw_users AS (
	SELECT 
		user_id AS num_user_id,
		CONCAT(first_name,' ',last_name) AS str_fullname,
		email AS str_email,
		CAST(replace(phone,'-','') AS numeric) as num_phonenumber,
		DATE(created_at) as create_date
	FROM raw.users
),
raw_cards AS (
	SELECT 
		card_id,
		account_id,
		CAST(card_number AS numeric) as card_number,
		LOWER(card_type) as card_type,
		expiry_date,
		DATE(created_at) as created_date
	FROM raw.cards
),
raw_accounts AS (
	SELECT
		account_id,
		user_id,
		LOWER(account_type) as account_type,
		CAST(balance as numeric) as balance_num,
		DATE(created_at) as created_date
	FROM raw.accounts
),
raw_account_cards AS (
	SELECT 
		acc.account_id as account_id,
		acc.user_id as user_id,
		acc.account_type as account_type,
		acc.balance_num as balance_num,
		crd.card_number as card_number,
		crd.card_type as card_type,
		crd.expiry_date as expiry_date
	FROM raw_accounts acc
	LEFT JOIN raw_cards crd ON acc.account_id = crd.account_id
),
dim_user AS(
	SELECT
		usr.num_user_id AS num_user_id,
		coalesce(acrds.account_id, 0000) as num_account_id,
		coalesce(usr.str_fullname, 'anonim') as str_fullname,
		coalesce(usr.str_email, 'anonim@example.com') as str_email,
		coalesce(usr.num_phonenumber, 0000000000) as num_phonenumber,
		coalesce(acrds.account_type, 'untype') as str_account_type,
		coalesce(acrds.balance_num, 0.0) as num_balance,
		coalesce(acrds.card_number, 0) as num_card_number,
		coalesce(acrds.card_type, 'untype') as str_card_type,
		coalesce(acrds.expiry_date, '1901-01-01') as dt_expiry_date
	FROM raw_users as usr
	LEFT JOIN raw_account_cards acrds ON usr.num_user_id = acrds.user_id
)
SELECT DISTINCT * FROM dim_user
ORDER BY 1 ASC