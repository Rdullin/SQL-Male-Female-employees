SELECT 
    d.dept_name,
    ee.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    e.calendar_year,
    CASE
        WHEN
            e.calendar_year <= YEAR(dm.to_date)
                AND e.calendar_year >= YEAR(dm.from_date)
        THEN
            1
        ELSE 0
    END AS active
FROM
    (SELECT 
        YEAR(hire_date) AS calendar_year
    FROM
        t_employees
    GROUP BY calendar_year) e
        CROSS JOIN
    t_dept_manager dm
        JOIN
    t_departments d ON d.dept_no = dm.dept_no
        JOIN
    t_employees ee ON ee.emp_no - dm.emp_no
ORDER BY dm.emp_no , calendar_year;