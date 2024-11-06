--  1. Analyze Payment Methods and Sales
--  ● Question: What are the different payment methods, and how many transactions and
--  items were sold with each method?
--  ● Purpose: This helps understand customer preferences for payment methods, aiding in
--  payment optimization strategies

SELECT distinct(payment_method), COUNT(payment_method) AS payments_done_by
FROM ecomm_sales
GROUP BY payment_method;

 -- 2. Identify the Highest-Rated Category in Each Branch
--  ● Question: Which category received the highest average rating in each branch?
--  ● Purpose: This allows Walmart to recognize and promote popular categories in specific
--  branches, enhancing customer satisfaction and branch-specific marketing

SELECT branch, category
FROM ecomm_sales
WHERE rating = (
    SELECT MAX(rating)
    FROM ecomm_sales
);

 -- 3. Determine the Busiest Day for Each Branch
--  ● Question: What is the busiest day of the week for each branch based on transaction
--  volume?
--  ● Purpose: This insight helps in optimizing staffing and inventory management to
--  accommodate peak days
 
 SELECT
     distinct branch,
    DAYNAME(date) AS day_of_week,
    COUNT(*) AS transaction_count
FROM
    ecomm_sales
GROUP BY
    branch, day_of_week 
    ORDER BY
branch, transaction_count DESC;

 -- 4. Calculate Total Quantity Sold by Payment Method
--  ● Question: How many items were sold through each payment method?
--  ● Purpose: This helps Walmart track sales volume by payment type, providing insights
--  into customer purchasing habits
 
select payment_method,sum(quantity) as Tquantity
from ecomm_sales
group by payment_method

-- 5. Analyze Category Ratings by City
--  ● Question: What are the average, minimum, and maximum ratings for each category in
--  each city?
--  ● Purpose: This data can guide city-level promotions, allowing Walmart to address
--  regional preferences and improve customer experiences

SELECT
    city,
    category,
    AVG(rating) AS avg_rating,
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating
FROM
    ecomm_sales
GROUP BY
    city,
    category;
    
    