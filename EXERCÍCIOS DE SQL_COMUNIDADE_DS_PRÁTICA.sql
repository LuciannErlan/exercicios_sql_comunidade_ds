
										--EXERCÍCIOS DE SQL_COMUNIDADE_DS_PRÁTICA

-- AULA 13 - FUNÇÕES AGREGADORAS 
-- QUESTÃO 01
 SELECT 
	COUNT( DISTINCT customer_id ) 
FROM customer c 
WHERE customer_state = 'MG'

--QUESTÃO 02
SELECT 
	COUNT (DISTINCT seller_city )
FROM sellers s
WHERE seller_state = 'SC'

-- QUESTÃO 03
SELECT 
	COUNT (DISTINCT seller_city )
FROM sellers s

--QUESTÃO 04
SELECT 
	COUNT( DISTINCT oi.order_id)  
FROM order_items oi
WHERE oi.price > 3500

--QUESTÃO 05
SELECT 
	AVG(oi.price )
FROM order_items oi 

--QUESTÃO 06 e 07
SELECT 
	MAX(oi.price ),
	MIN(oi.price)
FROM order_items oi 

--QUESTÃO 08
SELECT 
	COUNT(distinct oi.product_id)
FROM order_items oi 
WHERE oi.price < 100

--QUESTÃO 10
SELECT 
	distinct op.payment_type
FROM order_payments op 

--QUESTÃO 11 e 12 
SELECT 
	MAX(op.payment_installments ),
	MIN(op.payment_installments)
FROM order_payments op 

--QUESTÃO 13
select 
	AVG(op.payment_value)
FROM order_payments op 
WHERE op.payment_type = 'credit_card'

--QUESTÃO 14
SELECT 
	COUNT(distinct o.order_status )
FROM orders o 

--QUESTÃO 15
SELECT 
	distinct o.order_status 
FROM orders o 

--QUESTÃO 16
select 
	COUNT(distinct o.customer_id ) 
from orders o 

--QUESTÃO 17
select 
	COUNT( p.product_id )
from products p 

--QUESTÃO 18
SELECT 
	MAX(p.product_photos_qty )
FROM products p 

--QUESTÃO 19
SELECT 
	MAX(p.product_weight_g )
FROM products p 

--QUESTÃO 19
SELECT 
	AVG(p.product_height_cm )
FROM products p 



-- AULA 14 - AGRUPAMENTOS 
 
-- QUESTÃO 01
SELECT 
	c.customer_state ,
	COUNT( distinct c.customer_id )
FROM customer c 
GROUP BY c.customer_state 

-- QUESTÃO 02
SELECT 
	c.customer_id ,
	c.customer_state ,
	COUNT(distinct c.customer_city )
FROM customer c 
GROUP BY c.customer_id , c.customer_state 

-- QUESTÃO 03
SELECT 
	c.customer_state,
	c.customer_city,
	COUNT(distinct c.customer_id)
FROM customer c 
GROUP BY 
	c.customer_state,
	c.customer_city 

-- QUESTÃO 04
SELECT 
	c.customer_city,
	c.customer_state,
	COUNT(distinct c.customer_id)
FROM customer c 
GROUP BY 
	c.customer_city,	
	c.customer_state

-- QUESTÃO 05
SELECT 
	oi.seller_id ,
	COUNT (distinct oi.order_id)
FROM order_items oi 
GROUP BY oi.seller_id 

-- QUESTÃO 06
SELECT 
	oi.seller_id ,
	count (distinct oi.order_id ), 
	MIN(oi.shipping_limit_date ),
	MAX(oi.shipping_limit_date ),
	MAX(oi.freight_value ),
	MIN(oi.freight_value ),
	AVG(oi.freight_value )
FROM order_items oi 
GROUP BY oi.seller_id 

-- QUESTÃO 07
SELECT 
	oi.product_id ,
	AVG(oi.price ),
	MAX(oi.price ),
	MIN(oi.price )
FROM order_items oi 
GROUP BY oi.product_id 

-- QUESTÃO 08
SELECT 
	COUNT (distinct oi.seller_id ),
	AVG(oi.price )
FROM order_items oi 

-- QUESTÃO 09
SELECT 
	op.payment_type ,
	COUNT(op.order_id )
FROM order_payments op 
GROUP by op.payment_type 

-- QUESTÃO 10
SELECT
	op.payment_type ,	
	COUNT(op.order_id ),
	AVG(op.payment_value ),
	MAX(op.payment_installments )
FROM order_payments op 
GROUP by op.payment_type 

-- QUESTÃO 11
SELECT 
	op.payment_type , op.payment_installments ,
	MIN(op.payment_value ),
	max(op.payment_value ),
	avg(op.payment_value ),
	sum(op.payment_value )
FROM order_payments op 
GROUP BY op.payment_type , op.payment_installments 

-- QUESTÃO 12
SELECT 
    product_id,
    AVG(price) 
FROM 
    order_items
GROUP BY 
    product_id
    
-- QUESTÃO 13
SELECT 
	o.order_status ,
	COUNT(o.order_id )
FROM orders o 
GROUP BY o.order_status 

-- QUESTÃO 14
SELECT 
	COUNT( o.order_id ),
	 DATE(o.order_approved_at  )
FROM orders o 
GROUP BY o.order_approved_at 

-- QUESTÃO 15
SELECT 
	p.product_category_name ,
	COUNT( p.product_id )
FROM products p 
GROUP by p.product_category_name 


-- AULA 15 - OPERADORES LÓGICOS DE SUBQUERY

-- QUESTÃO 01
SELECT 
	COUNT(distinct c.customer_id )
FROM customer c 
WHERE c.customer_state = 'SP'

-- QUESTÃO 02
SELECT 
	COUNT(distinct o.order_id )
FROM orders o 
WHERE DATE( o.order_purchase_timestamp ) = '2016-10-08'

-- QUESTÃO 03
SELECT 
	COUNT(distinct o.order_id )
FROM orders o 
WHERE DATE( o.order_purchase_timestamp ) > '2016-10-08'

-- QUESTÃO 04
SELECT 
	COUNT(distinct oi.order_id )
FROM order_items oi 
WHERE DATE(oi.shipping_limit_date  ) >= '2016-10-08'

-- QUESTÃO 05
SELECT 
	COUNT(distinct oi.order_id ),
	AVG(oi.freight_value )
FROM order_items oi 
WHERE oi.price < 1100

-- QUESTÃO 06
SELECT 
	oi.seller_id ,
	COUNT(distinct oi.order_id ),
	MAX(oi.shipping_limit_date ),
	MIN(oi.shipping_limit_date ),
	MAX(oi.freight_value ),
	min(oi.freight_value ),
	avg(oi.freight_value )
FROM order_items oi 
WHERE oi.price <= 110
GROUP BY oi.seller_id 


-- AULA 16 - OPERADORES DE LÓGICA BOOLEANA

-- QUESTÃO 01
SELECT 
	c.customer_state ,
	COUNT (distinct c.customer_id )
FROM customer c 
WHERE c.customer_state = 'MG' OR c.customer_state = 'RJ'
GROUP BY c.customer_state 

-- QUESTÃO 02
SELECT 
	g.geolocation_state  ,
	COUNT(distinct g.geolocation_city )
FROM geolocation g  
WHERE 
	(g.geolocation_state  = 'SP' OR g.geolocation_state  = 'RJ')
	and g.geolocation_lat > -24.54 
	AND g.geolocation_lng < -45.63
GROUP BY g.geolocation_state 

-- QUESTÃO 03
select 
	COUNT(distinct oi.order_id ),
	COUNT(oi.product_id ),
	AVG(oi.price )
FROM order_items oi 
WHERE oi.freight_value > 20 
		AND DATE(oi.shipping_limit_date) >= '2016-10-01'
    	AND DATE(oi.shipping_limit_date) <= '2016-10-31'

-- QUESTÃO 04
SELECT 
	op.payment_installments ,
	COUNT (op.order_id),
	sum (op.payment_value)
FROM order_payments op 
WHERE (op.payment_installments >= 1 AND op.payment_installments <= 5)
	OR (op.payment_value > 5000)
GROUP BY op.payment_installments 

-- QUESTÃO 05
SELECT 
	order_status ,
	COUNT( order_id )
FROM orders o
WHERE ( order_status = 'processing' OR order_status = 'canceled' )
	  AND ( o.order_estimated_delivery_date > '2017-01-01' 
	  OR o.order_estimated_delivery_date < '2016-11-23' )
GROUP BY order_status

-- QUESTÃO 06
SELECT 
	product_category_name ,
	COUNT( DISTINCT product_id  )
FROM products p
WHERE ( product_category_name = 'perfumaria' 
        or product_category_name = 'brinquedos'
        or product_category_name = 'esporte_lazer'
        or product_category_name = 'cama_mesa_banho'
        or product_category_name = 'moveis_escritorio')
	  AND product_photos_qty > 5
	  AND product_weight_g > 5
	  AND product_height_cm > 10
	  AND product_width_cm > 20
GROUP BY product_category_name


-- AULA 16 - OPERADORES DE LÓGICA DE INTERVALO 

-- QUESTÃO 01
SELECT
	order_status, 
	COUNT( DISTINCT customer_id  ) 
FROM orders o
WHERE order_purchase_timestamp BETWEEN '2016-10-01' AND '2016-10-31'
	  AND order_status IN ( 'processing', 'shipped', 'delivered' )
GROUP BY order_status 
HAVING COUNT( DISTINCT customer_id  ) > 5

-- QUESTÃO 02
SELECT  
  payment_installments, 
  COUNT( op.order_id ) ,
  SUM( op.payment_value)  
FROM order_payments op 
WHERE(op.payment_installments BETWEEN 1 and 5 ) OR ( op.payment_value > 5000)
GROUP BY payment_installments

-- QUESTÃO 03
SELECT 
	product_category_name ,
	COUNT( DISTINCT product_id  ) 
FROM products p
WHERE product_category_name IN ( 'perfumaria', 'brinquedos', 
		'esporte_lazer', 'cama_mesa_banho')
	  AND product_photos_qty BETWEEN 5 AND 10
	  AND product_weight_g NOT BETWEEN 1 AND 5
	  AND product_height_cm > 10
	  AND product_width_cm > 20
GROUP BY product_category_name
HAVING COUNT( DISTINCT product_id  ) > 10

-- QUESTÃO 04
SELECT 
	order_status ,
	COUNT( order_id )
FROM orders o
WHERE order_status IN ('processing', 'canceled' )
	  AND ( o.order_estimated_delivery_date BETWEEN '2017-01-01'
	  AND '2017-12-31' )
GROUP BY order_status

-- QUESTÃO 05

SELECT 
	g.geolocation_state,
	COUNT( DISTINCT g.geolocation_city ) 
FROM geolocation g
WHERE g.geolocation_state IN ( 'SP', 'RJ' )
	  AND ( g.geolocation_lat > -24.54 AND g.geolocation_lng < -45.63 )
GROUP BY g.geolocation_state

-- QUESTÃO 06
SELECT 
	product_category_name ,
	COUNT( DISTINCT product_id  )
FROM products p
WHERE product_category_name LIKE 'a%o'
	  AND product_photos_qty > 5
GROUP BY product_category_name
HAVING COUNT( DISTINCT product_id  ) > 10

-- QUESTÃO 07
SELECT 
	customer_state,
	c.customer_city,
	COUNT( DISTINCT c.customer_id ) 
FROM customer c 
WHERE c.customer_city LIKE 'm%o%a'
GROUP BY customer_state, customer_city
HAVING COUNT( DISTINCT c.customer_id ) > 10


-- AULA 24 - O INNER JOIN 

-- QUESTÃO 01
SELECT 
	o.order_id , 
	o.customer_id ,
	o.order_status ,
	oi.product_id ,
	oi.price 
FROM orders o INNER JOIN order_items oi ON (oi.order_id = o.order_id )
limit 10

-- QUESTÃO 02
SELECT 
	o.order_id ,
	c.customer_state ,
	c.customer_city ,
	o.order_status, 
	oi.product_id,
	oi.price
FROM orders o inner join customer c ON (c.customer_id = o.customer_id) 
				INNER JOIN order_items oi on (oi.order_id = o.order_id)
WHERE c.customer_state = 'SP'
LIMIT 20

-- QUESTÃO 03
SELECT 
	o.order_id ,
	c.customer_state ,
	c.customer_city ,
	o.order_status ,
	oi.price ,
	p.product_category_name 
FROM orders o INNER JOIN customer c on (c.customer_id = o.customer_id)
			inner join order_items oi on (oi.order_id = o.order_id )
			INNER JOIN products p on (p.product_id = oi.product_id )
WHERE o.order_status = 'canceled'
LIMIT 50

-- QUESTÃO 04
SELECT 
	 o.order_id ,
	 c.customer_state ,
	 c.customer_city ,
	 o.order_status ,
	 p.product_category_name ,
	 oi.price ,
	 o.order_approved_at ,
	 s.seller_state ,
	 s.seller_city 
FROM orders o inner join customer c on (c.customer_id = o.customer_id)
			INNER JOIN order_items oi on (oi.order_id = o.order_id )				
			INNER JOIN products p ON (p.product_id = oi.product_id)
			INNER JOIN sellers s on (s.seller_id = oi.seller_id)	
WHERE o.order_approved_at >= '2016-09-16'
LIMIT 80

-- QUESTÃO 05
SELECT 
	o.order_id ,
	c.customer_city ,
	c.customer_state ,
	o.order_status ,
	p.product_category_name ,
	oi.price ,
	s.seller_city ,
	s.seller_state ,
	o.order_approved_at ,
	op.payment_type 
FROM orders o inner JOIN customer c on (c.customer_id = o.customer_id)
			INNER JOIN order_items oi on (oi.order_id = o.order_id )
			INNER JOIN products p on (p.product_id = oi.product_id)
			INNER JOIN sellers s on (s.seller_id = oi.seller_id)
			INNER JOIN order_payments op on (op.order_id = o.order_id )
WHERE op.payment_type = 'boleto'
LIMIT 50

-- QUESTÃO 06
SELECT 
	o.order_id ,
	c.customer_city ,
	c.customer_state ,
	o.order_status ,
	p.product_category_name ,
	oi.price ,
	s.seller_city ,
	s.seller_state ,
	o.order_approved_at ,
	op.payment_type ,
	t.review_score 
FROM orders o inner join order_items oi on (oi.order_id = o.order_id)
				INNER JOIN customer c on (c.customer_id = o.customer_id)
				INNER JOIN products p on (p.product_id  = oi.product_id)
				INNER JOIN sellers s on (s.seller_id = oi.seller_id)
				INNER JOIN order_payments op on (op.order_id = o.order_id)
				INNER JOIN order_reviews t on (t.order_id = o.order_id)
where t.review_score = 1
LIMIT 70

-- AULA 25 - O LEFT JOIN 

-- QUESTÃO 01
SELECT 
	o.order_id,
	o.order_status,
	oi.product_id,
	p.product_category_name,
	or2.review_score,
	op.payment_value,
	op.payment_type,
	s.seller_city,
	g.geolocation_lat, 
	g.geolocation_lng 
FROM orders o LEFT JOIN order_items oi    ON ( oi.order_id = o.order_id )
			  LEFT JOIN order_reviews or2 ON ( or2.order_id = o.order_id )
			  LEFT JOIN order_payments op ON ( op.order_id = o.order_id )
			  LEFT JOIN products p        ON ( p.product_id = oi.product_id )
			  LEFT JOIN sellers s         ON ( s.seller_id = oi.seller_id )
			  LEFT JOIN geolocation g     ON ( g.geolocation_zip_code_prefix = s.seller_zip_code_prefix )
LIMIT 20;

-- QUESTÃO 02
SELECT 
	o.order_id,
	o.order_status,
	p.product_category_name,
	op.payment_type 
FROM orders o LEFT JOIN order_items oi    ON ( oi.order_id = o.order_id )
			  LEFT JOIN products p        ON ( p.product_id = oi.product_id )
			  LEFT JOIN order_payments op ON ( op.order_id = o.order_id )
WHERE o.order_id = 'e481f51cbdc54678b7cc49136f2d6af7'

-- QUESTÃO 03
SELECT 
	o.order_id,
	COUNT( DISTINCT oi.product_id ) as produt_id 
FROM orders o LEFT JOIN order_items oi ON ( oi.order_id = o.order_id )
GROUP BY o.order_id 
HAVING COUNT( DISTINCT oi.product_id ) > 5

-- QUESTÃO 04
SELECT
	o.order_id,
	COUNT( or2.review_id ) AS review_id
FROM orders o LEFT JOIN order_reviews or2 ON ( or2.order_id = o.order_id )
GROUP BY o.order_id 
HAVING COUNT( or2.review_id ) > 1

-- QUESTÃO 05
SELECT
	o.order_id,
	or2.review_score 
FROM orders o LEFT JOIN order_reviews or2 ON ( or2.order_id = o.order_id )
WHERE or2.order_id IS NULL

-- QUESTÃO 06
SELECT
	s.seller_id,
	COUNT( c.customer_id ) AS customer_id
FROM orders o  LEFT JOIN order_items oi ON ( oi.order_id = o.order_id )
	 		   LEFT JOIN sellers s ON ( s.seller_id = oi.seller_id ) 
	 		   LEFT JOIN customer c ON ( c.customer_id = o.customer_id)
GROUP BY s.seller_id 
ORDER BY customer_id DESC
LIMIT 10;	

-- QUESTÃO 07
SELECT 
	COUNT(o.order_id)
FROM orders o LEFT  JOIN order_items oi on (oi.order_id  = o.order_id)
			LEFT JOIN products p on (p.product_id = oi.product_id)
where p.product_id is null


-- AULA 26 - MONTANDO A GRANDE TABELA 

-- QUESTÃO 01
SELECT 
	*
FROM orders o 
	FULL OUTER JOIN customer c on (c.customer_id = o.customer_id)
	FULL OUTER JOIN geolocation g on (g.geolocation_zip_code_prefix = c.customer_zip_code_prefix)
	FULL OUTER JOIN order_items oi on (oi.order_id = o.order_id )
	FULL OUTER JOIN order_payments op on (op.order_id = o.order_id )
	FULL OUTER JOIN order_review_backup orb on (orb.order_id = o.order_id )
	FULL OUTER JOIN order_review_shorts ors on (ors.order_id = o.order_id)
	FULL OUTER JOIN order_reviews t on (t.order_id  = o.order_id)
	FULL OUTER JOIN products p on (p.product_id = oi.product_id)
	FULL OUTER JOIN product_category_name pcn on (pcn.product_category_name = p.product_category_name)
	FULL OUTER JOIN sellers s on (s.seller_id = oi.seller_id)
	

	-- AULA 26 - MONTANDO A GRANDE TABELA 

-- QUESTÃO 01
SELECT 
	COUNT(o.order_id) 
FROM orders o 
WHERE o.order_id in (select distinct op.order_id 
						from order_payments op 
						where op.payment_type = 'boleto')

-- QUESTÃO 02
SELECT 
	COUNT(o.order_id )
FROM orders o left join order_payments op on (op.order_id = o.order_id )
WHERE op.payment_type = 'boleto'

-- QUESTÃO 03
SELECT 
	o.order_id ,
	AVG(t.review_score ),
	AVG(oi.price ),
	SUM(oi.price),
	MIN(oi.price ),
	COUNT (o.order_id ),
	COUNT(distinct o.customer_id )
FROM orders o left join order_items oi on (oi.order_id = o.order_id)
				left join order_reviews t on (t.order_id = o.order_id)
				
-- não acertei				
SELECT  t1.date_
       ,t1.avg_review
       ,t2.avg_price
       ,t2.sum_price
       ,t2.min_price
       ,t3.pedido_por_dia
       ,t3.clientes_unicos
FROM
(
	SELECT  DATE( review_creation_date ) AS date_
	       ,AVG( review_score )          AS avg_review
	FROM order_reviews or2
	GROUP BY  DATE( review_creation_date )
) AS t1
LEFT JOIN
(
	SELECT  DATE( oi.shipping_limit_date ) AS date_
	       ,AVG( price )                   AS avg_price
	       ,SUM( price )                   AS sum_price
	       ,MIN( price )                   AS min_price
	FROM order_items oi
	GROUP BY  DATE( oi.shipping_limit_date )
) AS t2
ON ( t2.date_ = t1.date_ )
LEFT JOIN
(
	SELECT  DATE( o.order_purchase_timestamp ) AS date_
	       ,COUNT( o.order_id )                AS pedido_por_dia
	       ,COUNT( DISTINCT o.customer_id )    AS clientes_unicos
	FROM orders o
	GROUP BY  DATE( o.order_purchase_timestamp )
) AS t3
ON ( t3.date_ = t1.date_ )

-- QUESTÃO 04
select 
	p.product_category_name ,
	COUNT(p.product_id ),
	AVG(p.product_length_cm ),
	(select AVG(p2.product_length_cm) from products p2 WHERE p2.product_category_name = 'alimentos'),
	(select AVG(p2.product_length_cm ) from products p2  )
FROM products p 
GROUP BY p.product_category_name 
	
-- QUESTÃO 05
SELECT 
	p.product_category_name
FROM products p 
WHERE p.product_id = 
( SELECT product_id
	 FROM ( SELECT
		product_id,
		MAX( max_product ) AS max_all
  FROM ( SELECT
   				product_id,
	 	   		MAX( price ) as max_product 
				 FROM order_items oi 
			   GROUP BY product_id ) ) )
	
	
	
	
	

	SELECT
o.order_status,
COUNT( o.customer_id ) AS clientes
FROM orders o
WHERE o.order_approved_at < '2016-10-05'
GROUP BY o.order_status
HAVING order_status = 'canceled'
						

	
	
	SELECT *
	FROM customer c inner join orders o on (o.customer_id = c.customer_id)
	WHERE c.customer_id is null
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	



















