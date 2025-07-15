-- 💼 HR Attrition Analysis Queries	--
-- ~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.

-- General Attrition Overview --
-- 1. What is the overall attrition rate?

SELECT 
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / 
	COUNT(*), 2) AS attrition_rate_percentage
FROM "HR-Analytics";

-- 2. What is the attrition rate by gender?

SELECT 
    Gender,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / 
	COUNT(*),	2) AS attrition_rate_percentage
FROM "HR-Analytics"
GROUP BY Gender;

-- Income & Satisfaction --
-- 3. What are the average monthly income and job satisfaction for employees who left?

SELECT 
    ROUND(AVG(MonthlyIncome), 2) AS avg_income,
    ROUND(AVG(JobSatisfaction), 2) AS avg_job_satisfaction
FROM "HR-Analytics"
WHERE Attrition = 'Yes';

-- Department Insights --
-- 4. Which departments have the highest attrition rates?

SELECT 
    Department,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 /
	COUNT(*), 2) AS attrition_rate_percentage
FROM "HR-Analytics"
GROUP BY Department
ORDER BY attrition_rate_percentage DESC;

-- Overtime Impact --
-- 5. What is the relationship between overtime and attrition?

SELECT 
    OverTime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attritions,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / 
	COUNT(*), 2) AS attrition_rate_percentage
FROM "HR-Analytics"
GROUP BY OverTime;

-- Tenure & Experience --
-- 6. What is the average years at company for those who stayed vs. those who left?

SELECT 
    Attrition,
    ROUND(AVG(YearsAtCompany), 2) AS avg_years_at_company
FROM "HR-Analytics"
GROUP BY Attrition;

-- Job Role & Attrition --
-- 7. How does job role affect attrition?
SELECT 
    JobRole,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 /
 COUNT(*), 2) AS attrition_rate_percentage
FROM "HR-Analytics"
GROUP BY JobRole
ORDER BY attrition_rate_percentage DESC;

-- Age & Attrition Patterns --
-- 8. Is there a pattern in attrition based on age group?

SELECT 
    CASE 
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 40 THEN '30-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        ELSE '51+' 
    END AS age_group,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / 
	COUNT(*), 2) AS attrition_rate_percentage
FROM "HR-Analytics"
GROUP BY age_group;

-- Training Time --
-- 9. What is the average training time for employees who left?

SELECT 
    ROUND(AVG(TrainingTimesLastYear), 2) AS avg_training_time
FROM "HR-Analytics"
WHERE Attrition = 'Yes';

-- Education Field & Attrition --
-- 10. Which education fields have the highest attrition?

SELECT 
    EducationField,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / 
	COUNT(*), 2) AS attrition_rate_percentage
FROM "HR-Analytics"
GROUP BY EducationField
ORDER BY attrition_rate_percentage DESC;


