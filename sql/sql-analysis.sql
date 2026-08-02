--DATABASE--
USE TVET_Project_DB

--VIEW ALL RECORDS
SELECT *
FROM TVET_Data;

--TOTAL NUMBER OF RESPONDENTS--
SELECT COUNT(*) AS Total_Respondents
FROM TVET_Data;

--GENDER DISTRIBUTION--
SELECT
    Gender,
    COUNT(*) AS Total_Respondents,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM TVET_Data), 2) AS Percentage
FROM TVET_Data
GROUP BY Gender;

--AGE STATISTICS--
SELECT
    MIN(Age) AS Minimum_Age,
    MAX(Age) AS Maximum_Age,
    AVG(Age) AS Average_Age
FROM TVET_Data;

--EDUCATION LEVEL DISTRIBUTION--
SELECT
    Education_Level,
    COUNT(*) AS Total
FROM TVET_Data
GROUP BY Education_Level
ORDER BY Total DESC;

--EMPLOYMENT STATUS--
SELECT
    Employment_Status,
    COUNT(*) AS Total
FROM TVET_Data
GROUP BY Employment_Status;

--TRADE COMPLETED--
SELECT
    Trade_Completed,
    COUNT(*) AS Total
FROM TVET_Data
GROUP BY Trade_Completed
ORDER BY Total DESC;

--EMPLOYMENT BY GENDER--
SELECT
    Gender,
    Employment_Status,
    COUNT(*) AS Total
FROM TVET_Data
GROUP BY Gender, Employment_Status
ORDER BY Gender;

--EMPLOYMENT BY EDUCTION LEVEL--
SELECT
    Education_Level,
    Employment_Status,
    COUNT(*) AS Total
FROM TVET_Data
GROUP BY Education_Level, Employment_Status
ORDER BY Education_Level;

--OVERALL SATISFACTION--
SELECT
    Overall_Satisfaction,
    COUNT(*) AS Total
FROM TVET_Data
GROUP BY Overall_Satisfaction
ORDER BY Total DESC;

--PROGRAMME RECOMMENDATION--
SELECT
    Recommend_Programme,
    COUNT(*) AS Total
FROM TVET_Data
GROUP BY Recommend_Programme;

--FUTURE PARTICIPANTION--
SELECT
    Future_Participation,
    COUNT(*) AS Total
FROM TVET_Data
GROUP BY Future_Participation;

--INCOME IMPROVEMENT--
SELECT
    Income_Improvement,
    COUNT(*) AS Total
FROM TVET_Data
GROUP BY Income_Improvement;

--TOP 3 MOST POPULAR TRADES--
SELECT TOP 3
    Trade_Completed,
    COUNT(*) AS Total
FROM TVET_Data
GROUP BY Trade_Completed
ORDER BY Total DESC;

--RESPONDENDTS ABOVE AVERAGE AGE--
SELECT
    Respondent_ID,
    Age,
    Gender
FROM TVET_Data
WHERE Age > (
    SELECT AVG(Age)
    FROM TVET_Data
)
ORDER BY Age DESC;

--AGE GROUP CLASSIFICATION--
SELECT
    Respondent_ID,
    Age,
    CASE
        WHEN Age BETWEEN 18 AND 24 THEN 'Youth'
        WHEN Age BETWEEN 25 AND 34 THEN 'Young Adult'
        WHEN Age BETWEEN 35 AND 44 THEN 'Adult'
        ELSE 'Older Adult'
    END AS Age_Group
FROM TVET_Data;

--SUMMARY--
SELECT
    CASE
        WHEN Age BETWEEN 18 AND 24 THEN 'Youth'
        WHEN Age BETWEEN 25 AND 34 THEN 'Young Adult'
        WHEN Age BETWEEN 35 AND 44 THEN 'Adult'
        ELSE 'Older Adult'
    END AS Age_Group,
    COUNT(*) AS Total_Respondents
FROM TVET_Data
GROUP BY
    CASE
        WHEN Age BETWEEN 18 AND 24 THEN 'Youth'
        WHEN Age BETWEEN 25 AND 34 THEN 'Young Adult'
        WHEN Age BETWEEN 35 AND 44 THEN 'Adult'
        ELSE 'Older Adult'
    END
ORDER BY Total_Respondents DESC;

--TRADE THAT HAVE MORETHAN 2 RESPONDENTS--
SELECT
    Trade_Completed,
    COUNT(*) AS Total
FROM TVET_Data
GROUP BY Trade_Completed
HAVING COUNT(*) >= 2
ORDER BY Total DESC;

--COMMON TABLE EXPRESSION--
WITH EmploymentSummary AS
(
    SELECT
        Employment_Status,
        COUNT(*) AS Total
    FROM TVET_Data
    GROUP BY Employment_Status
)

SELECT *
FROM EmploymentSummary;

--ROW NUMBER--
SELECT
    Respondent_ID,
    Gender,
    Age,
    ROW_NUMBER() OVER (ORDER BY Age DESC) AS Row_Num
FROM TVET_Data;

--DENSE RANK--
SELECT
    Respondent_ID,
    Age,
    RANK() OVER (ORDER BY Age DESC) AS Age_Rank
FROM TVET_Data;

--RANKING OF AGE IN BASE GENDER--
SELECT
    Respondent_ID,
    Gender,
    Age,
    ROW_NUMBER() OVER
    (
        PARTITION BY Gender
        ORDER BY Age DESC
    ) AS Gender_Rank
FROM TVET_Data;

--TOP PERFORMING TRADE--
SELECT TOP 5
    Trade_Completed,
    COUNT(*) AS Total_Respondents
FROM TVET_Data
GROUP BY Trade_Completed
ORDER BY Total_Respondents DESC;

--DASHBOARD SUMMARY QUERRY--
SELECT
    COUNT(*) AS Total_Respondents,
    AVG(Age) AS Average_Age,
    MIN(Age) AS Minimum_Age,
    MAX(Age) AS Maximum_Age
FROM TVET_Data;




--END OF MY ANALYSIS--
--By: umar musa isah--