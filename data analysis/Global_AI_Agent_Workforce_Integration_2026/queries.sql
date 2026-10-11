
-- =====================================================
-- Project: Global AI Agent Workforce Integration 2026
-- Tool: SQLiteOnline
-- Focus: SQL Business Analysis
-- =====================================================


-- 1. DATA EXPLORATION
-- Preview the dataset
SELECT *
FROM Global_AI_Agent_Workforce_Integration_2026
LIMIT 10;


-- 2. AI AGENT ADOPTION BY INDUSTRY
-- Count companies/records in each industry
SELECT
    industry,
    COUNT(company_id) AS total_agents
FROM Global_AI_Agent_Workforce_Integration_2026
GROUP BY industry
ORDER BY total_agents DESC;


-- Industry with the highest count
SELECT
    industry,
    COUNT(company_id) AS total_agents
FROM Global_AI_Agent_Workforce_Integration_2026
GROUP BY industry
ORDER BY total_agents DESC
LIMIT 1;


-- 3. PRODUCTIVITY IMPACT BY INDUSTRY
-- Average productivity gain by industry
SELECT
    industry,
    ROUND(AVG(productivity_gai), 1) AS avg_productivity_gain
FROM Global_AI_Agent_Workforce_Integration_2026
GROUP BY industry
ORDER BY avg_productivity_gain DESC;


-- Industry with the highest average productivity gain
SELECT
    industry,
    ROUND(AVG(productivity_gai), 1) AS avg_productivity_gain
FROM Global_AI_Agent_Workforce_Integration_2026
GROUP BY industry
ORDER BY avg_productivity_gain DESC
LIMIT 1;


-- 4. PRIMARY AI AGENT ROLES
-- Count records by primary AI agent role
SELECT
    primary_ai_agent AS job_role,
    COUNT(company_id) AS total_agents
FROM Global_AI_Agent_Workforce_Integration_2026
GROUP BY primary_ai_agent
ORDER BY total_agents DESC;


-- Role with the highest count
SELECT
    primary_ai_agent AS job_role,
    COUNT(company_id) AS total_agents
FROM Global_AI_Agent_Workforce_Integration_2026
GROUP BY primary_ai_agent
ORDER BY total_agents DESC
LIMIT 1;


-- 5. EMPLOYEE SENTIMENT
-- Average employee sentiment by AI agent role
SELECT
    primary_ai_agent AS job_role,
    ROUND(AVG(employee_sentime), 2) AS avg_employee_sentiment
FROM Global_AI_Agent_Workforce_Integration_2026
GROUP BY primary_ai_agent
ORDER BY avg_employee_sentiment DESC;


-- 6. AI AGENT DEPLOYMENT COST BY INDUSTRY
-- Minimum and maximum monthly costs
SELECT
    industry,
    MIN(avg_agent_cost_p) AS min_monthly_cost,
    MAX(avg_agent_cost_p) AS max_monthly_cost
FROM Global_AI_Agent_Workforce_Integration_2026
GROUP BY industry
ORDER BY max_monthly_cost DESC;


-- Industry with the highest maximum monthly cost
SELECT
    industry,
    MAX(avg_agent_cost_p) AS highest_monthly_cost
FROM Global_AI_Agent_Workforce_Integration_2026
GROUP BY industry
ORDER BY highest_monthly_cost DESC
LIMIT 1;


-- 7. DEPLOYMENT COST BY AI AGENT ROLE
-- Minimum and maximum monthly costs by role
SELECT
    primary_ai_agent AS job_role,
    MIN(avg_agent_cost_p) AS min_monthly_cost,
    MAX(avg_agent_cost_p) AS max_monthly_cost
FROM Global_AI_Agent_Workforce_Integration_2026
GROUP BY primary_ai_agent
ORDER BY max_monthly_cost DESC;


-- Role with the highest maximum monthly cost
SELECT
    primary_ai_agent AS job_role,
    MAX(avg_agent_cost_p) AS highest_monthly_cost
FROM Global_AI_Agent_Workforce_Integration_2026
GROUP BY primary_ai_agent
ORDER BY highest_monthly_cost DESC
LIMIT 1;


-- 8. AI GOVERNANCE BY INDUSTRY
-- Compare strict governance counts and adoption rates
SELECT
    industry,
    COUNT(*) AS total_records,
    SUM(
        CASE
            WHEN has_strict_ai_go = 'True' THEN 1
            ELSE 0
        END
    ) AS strict_governance_records,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN has_strict_ai_go = 'True' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS strict_governance_percentage
FROM Global_AI_Agent_Workforce_Integration_2026
GROUP BY industry
ORDER BY strict_governance_percentage ASC;


-- 9. CYBERSECURITY INCIDENTS BY INDUSTRY
SELECT
    industry,
    SUM(cybersecurity_in) AS total_cybersecurity_cases
FROM Global_AI_Agent_Workforce_Integration_2026
GROUP BY industry
ORDER BY total_cybersecurity_cases DESC;


-- 10. PRODUCTIVITY, COST AND CYBERSECURITY COMPARISON
-- Aggregate all metrics at industry level
SELECT
    industry,
    ROUND(AVG(productivity_gai), 2) AS avg_productivity_gain,
    ROUND(AVG(avg_agent_cost_p), 2) AS avg_monthly_cost,
    SUM(cybersecurity_in) AS total_cybersecurity_cases
FROM Global_AI_Agent_Workforce_Integration_2026
GROUP BY industry
ORDER BY avg_productivity_gain DESC;
