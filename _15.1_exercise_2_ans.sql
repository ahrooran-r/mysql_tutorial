# 1
select name
from instructor
where dept_name = 'Finance'
order by name asc;

# 2
select title
from course
where dept_name = 'Biology'
  and credits >= 3
order by title asc;

# 3
select name, dept_name, tot_cred
from student
where dept_name = 'Comp. Sci.'
  and tot_cred >= 50
order by name asc;

# 4
select distinct instructor.name
from instructor
         left join teaches t on instructor.ID = t.ID
where semester = 'Summer'
order by name asc;

# 5
select sum(salary)
from instructor
where dept_name = 'Comp. Sci.';

# 6
select count(id)
from instructor
where dept_name = 'Finance';

# 7
select student.name, tot_cred
from student
order by tot_cred desc
limit 1;

# 8
select c.course_id, title, year, semester
from student
         left join takes t on student.ID = t.ID
         left join course c on student.dept_name = c.dept_name
where student.ID = 45678;