CREATE TABLE ev_sales (
    year INTEGER,
    month_name TEXT,
    date DATE,
    state TEXT,
    vehicle_class TEXT,
    vehicle_category TEXT,
    vehicle_type TEXT,
    ev_sales_quantity INTEGER
);
SELECT * FROM ev_sales

--Which state has the highest EV sales overall?

SELECT
    state,
    SUM(ev_sales_quantity) AS Total_EV_Sales
FROM ev_sales
GROUP BY state
ORDER BY total_ev_sales DESC
LIMIT 1;

--How have EV sales changed year by year from 2014 to 2023?
SELECT
    Year,
    SUM(EV_Sales_Quantity) AS Total_EV_Sales
FROM ev_sales
WHERE Year BETWEEN 2014 AND 2023
GROUP BY Year
ORDER BY Year;


SELECT
    Year,
    SUM(EV_Sales_Quantity) AS Total_EV_Sales,
    ROUND(
        (
            (
                SUM(EV_Sales_Quantity)
                - LAG(SUM(EV_Sales_Quantity))
                  OVER(ORDER BY Year)
            ) * 100.0
            /
            LAG(SUM(EV_Sales_Quantity))
            OVER(ORDER BY Year)
        )::numeric,
        2
    ) AS Growth_Percentage
FROM ev_sales
GROUP BY Year
ORDER BY Year;

--Which month shows the highest EV sales across the dataset?
SELECT
    Month_Name,
    SUM(EV_Sales_Quantity) AS Total_EV_Sales
FROM ev_sales
GROUP BY Month_Name
ORDER BY Total_EV_Sales DESC
LIMIT 1;

--Which vehicle category contributes the most to total EV sales?
SELECT
    Vehicle_Category,
    SUM(EV_Sales_Quantity) AS Total_EV_Sales
FROM ev_sales
GROUP BY Vehicle_Category
ORDER BY Total_EV_Sales DESC
LIMIT 1;

--Are 2-wheelers, 3-wheelers, 4-wheelers, or buses driving EV adoption the most?
SELECT
    Vehicle_Category,
    SUM(EV_Sales_Quantity) AS Total_EV_Sales,
    ROUND(
        (
            SUM(EV_Sales_Quantity) * 100.0
            /
            SUM(SUM(EV_Sales_Quantity)) OVER()
        )::NUMERIC,
        2
    ) AS Contribution_Percentage
FROM ev_sales
GROUP BY Vehicle_Category
ORDER BY Total_EV_Sales DESC;

--Which states show the fastest growth in EV sales over time?
WITH StateYearSales AS
(
    SELECT
        State,
        Year,
        SUM(EV_Sales_Quantity) AS Total_Sales
    FROM ev_sales
    GROUP BY State, Year
),

GrowthData AS
(
    SELECT
        State,

        ROUND(
            (
                (
                    Total_Sales -
                    LAG(Total_Sales)
                    OVER(PARTITION BY State ORDER BY Year)
                ) * 100.0
                /
                NULLIF(
                    LAG(Total_Sales)
                    OVER(PARTITION BY State ORDER BY Year),
                    0
                )
            )::NUMERIC,
            2
        ) AS Growth_Percentage

    FROM StateYearSales
)

SELECT
    State,
    ROUND(
        AVG(Growth_Percentage)::NUMERIC,
        2
    ) AS Avg_Growth
FROM GrowthData
WHERE Growth_Percentage IS NOT NULL
GROUP BY State
ORDER BY Avg_Growth DESC;


WITH StateYearSales AS
(
    SELECT
        State,
        Year,
        SUM(EV_Sales_Quantity) AS Total_Sales
    FROM ev_sales
    GROUP BY State, Year
)

SELECT
    State,
    Year,
    Total_Sales,

    ROUND(
        (
            (
                Total_Sales -
                LAG(Total_Sales)
                OVER(PARTITION BY State ORDER BY Year)
            ) * 100.0
            /
            NULLIF(
                LAG(Total_Sales)
                OVER(PARTITION BY State ORDER BY Year),
                0
            )
        )::NUMERIC,
        2
    ) AS Growth_Percentage

FROM StateYearSales
ORDER BY Growth_Percentage DESC NULLS LAST;

--Which vehicle type is most common in each state?
WITH VehicleSales AS
(
    SELECT
        State,
        Vehicle_Type,
        SUM(EV_Sales_Quantity) AS Total_Sales,
        RANK() OVER
        (
            PARTITION BY State
            ORDER BY SUM(EV_Sales_Quantity) DESC
        ) AS rn
    FROM ev_sales
    GROUP BY State, Vehicle_Type
)

SELECT
    State,
    Vehicle_Type,
    Total_Sales
FROM VehicleSales
WHERE rn = 1;

--Is EV adoption concentrated in a few states or spread evenly across India?
SELECT
    State,
    SUM(EV_Sales_Quantity) AS Total_Sales,
    ROUND(
        (
            SUM(EV_Sales_Quantity) * 100.0
            /
            SUM(SUM(EV_Sales_Quantity)) OVER()
        )::numeric,
        2
    ) AS Market_Share_Percentage
FROM ev_sales
GROUP BY State
ORDER BY Total_Sales DESC;

WITH StateSales AS
(
    SELECT
        State,
        SUM(EV_Sales_Quantity) AS Total_Sales
    FROM ev_sales
    GROUP BY State
)

SELECT
    ROUND(
        (
            SUM(Total_Sales) * 100.0
            /
            (
                SELECT SUM(EV_Sales_Quantity)
                FROM ev_sales
            )
        )::numeric,
        2
    ) AS Top5_State_Share
FROM
(
    SELECT Total_Sales
    FROM StateSales
    ORDER BY Total_Sales DESC
    LIMIT 5
) t;

--What is the trend of personal vs shared EV usage?
SELECT
    Vehicle_Type,
    SUM(EV_Sales_Quantity) AS Total_EV_Sales
FROM ev_sales
WHERE Vehicle_Type LIKE '%Personal%'
   OR Vehicle_Type LIKE '%Shared%'
GROUP BY Vehicle_Type
ORDER BY Total_EV_Sales DESC;

SELECT
    Year,
    Vehicle_Type,
    SUM(EV_Sales_Quantity) AS Total_EV_Sales
FROM ev_sales
WHERE Vehicle_Type LIKE '%Personal%'
   OR Vehicle_Type LIKE '%Shared%'
GROUP BY Year, Vehicle_Type
ORDER BY Year;

--Are there any seasonal spikes in EV sales for specific years or states?
SELECT
    Year,
    Month_Name,
    SUM(EV_Sales_Quantity) AS Total_EV_Sales
FROM ev_sales
GROUP BY Year, Month_Name
ORDER BY Year, Total_EV_Sales DESC;

SELECT
    State,
    Month_Name,
    SUM(EV_Sales_Quantity) AS Total_EV_Sales
FROM ev_sales
GROUP BY State, Month_Name
ORDER BY State, Total_EV_Sales DESC;

WITH MonthlySales AS
(
    SELECT
        State,
        Month_Name,
        SUM(EV_Sales_Quantity) AS Total_Sales,
        RANK() OVER
        (
            PARTITION BY State
            ORDER BY SUM(EV_Sales_Quantity) DESC
        ) AS rn
    FROM ev_sales
    GROUP BY State, Month_Name
)

SELECT
    State,
    Month_Name,
    Total_Sales
FROM MonthlySales
WHERE rn = 1;