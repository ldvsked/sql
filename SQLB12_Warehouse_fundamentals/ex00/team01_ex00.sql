WITH 
latest_currency_rates AS (
    SELECT DISTINCT ON (c.id)
        c.id AS currency_id,
        c.name AS currency_name,
        c.rate_to_usd
    FROM currency c
    ORDER BY c.id, c.updated DESC
),

sum_balances AS (
    SELECT 
        b.user_id,
        b.type,
        SUM(b.money) AS volume,
        (SELECT b1.currency_id 
         FROM balance b1 
         WHERE b1.user_id = b.user_id 
           AND b1.type = b.type 
         ORDER BY b1.updated DESC 
         LIMIT 1) AS last_currency_id
    FROM balance b
    GROUP BY b.user_id, b.type
)

SELECT 
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    sb.type,
    sb.volume,
    COALESCE(lcr.currency_name, 'not defined') AS currency_name,
    COALESCE(lcr.rate_to_usd, 1) AS last_rate_to_usd,
    sb.volume * COALESCE(lcr.rate_to_usd, 1) AS total_volume_in_usd
FROM sum_balances sb
LEFT JOIN latest_currency_rates lcr ON lcr.currency_id = sb.last_currency_id
LEFT JOIN public."user" u ON u.id = sb.user_id
ORDER BY 
    name DESC, 
    lastname ASC, 
    type ASC;