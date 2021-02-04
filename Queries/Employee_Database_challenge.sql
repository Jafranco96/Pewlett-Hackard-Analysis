------------------------------------------------------------------------------------------------Deliverable 1
Select employees.emp_no,
      employees.first_name,
	  employees.last_name,
	  titles.title,
	  titles.from_date,
	  titles.to_date
into retirement_titles	  
from titles
inner join employees
on titles.emp_no =employees.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT DISTINCT ON (retirement_titles.emp_no) retirement_titles.emp_no,retirement_titles.first_name,
retirement_titles.last_name ,
retirement_titles.title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

select count(title), title
into retiring_titles
from unique_titles
group by title
order by count(title) desc;
-------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------Deliverable 2

SELECT DISTINCT ON (employees.emp_no) employees.emp_no,
        employees.first_name,
        employees.last_name,
		employees.birth_date,
        dept_emp.from_date,
        dept_emp.to_Date,
        titles.title
INTO mentorship_eligibility
FROM employees
    INNER JOIN dept_emp
        ON (employees.emp_no = dept_emp.emp_no)
    INNER JOIN titles
        ON (employees.emp_no = titles.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

------------------------------------------------------------------------------------------------