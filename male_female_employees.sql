SELECT 
    YEAR(de.from_date) AS calendar_year,
    e.gender,
    COUNT(e.emp_no) AS no_of_employees
FROM
    t_employees e
        JOIN
    t_dept_emp de ON e.emp_no = de.emp_no
GROUP BY calendar_year, e.gender
having calendar_year >= 1990
ORDER BY YEAR(de.from_date) ASC;