SELECT
  eb.user_id,
  first_name,
  email,
  last_product_created_date,
  rfm_recency,
  has_app,
  emailable_state,
  num_products_published,
  last_seller_engagement_date,
  num_items_sold,
  CASE
    WHEN (last_product_created_date < DATEADD(day, -117, GETDATE()) AND num_items_sold BETWEEN 1 AND 4) THEN 'active_low'
    WHEN (last_product_created_date < DATEADD(day, -47, GETDATE()) AND num_items_sold BETWEEN 5 AND 14) THEN 'active_average'
    WHEN (last_product_created_date < DATEADD(day, -27, GETDATE()) AND num_items_sold BETWEEN 15 AND 34) THEN 'active_high'
    WHEN (last_product_created_date < DATEADD(day, -14, GETDATE()) AND num_items_sold BETWEEN 35 AND 86) THEN 'active_premium'
    WHEN (last_product_created_date < DATEADD(day, -6, GETDATE()) AND num_items_sold  > 86) THEN 'active_super_premium'
    ELSE ''
  END AS rfm_class

FROM [Enjoei Subscribers] as eb
LEFT JOIN propension_model_daily AS p
ON eb.user_id = p.user_id
WHERE
  num_items_sold > 0
  AND life_cycle_stage = 'active'
  AND emailable_state = 'deliverable'
  AND has_app = 'TRUE'
  AND 
    (
    last_product_created_date < DATEADD(day, -117, GETDATE()) AND num_items_sold BETWEEN 1 AND 4 OR
    last_product_created_date < DATEADD(day, -47, GETDATE()) AND num_items_sold BETWEEN 5 AND 14 OR
    last_product_created_date < DATEADD(day, -27, GETDATE()) AND num_items_sold BETWEEN 15 AND 34 OR
    last_product_created_date < DATEADD(day, -14, GETDATE()) AND num_items_sold BETWEEN 35 AND 86 OR
    last_product_created_date < DATEADD(day, -6, GETDATE()) AND num_items_sold  > 86
    )
