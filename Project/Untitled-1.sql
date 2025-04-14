##Q1:Which departments have the lowest average performance scores, and do they correlate with higher turnover rates?

SELECT jt.department_id, d.department_name, AVG(p.performance_score) AS avg_performance_score
    FROM Employee e
    JOIN JOB_TITLE jt ON e.job_title_id = jt.job_title_id
    JOIN Department d ON jt.department_id = d.department_id
    JOIN Performance p ON e.employee_id = p.employee_id
    GROUP BY d.department_id, d.department_name;