use school;

# 1
select name
from instructor
where dept_name = 'Physics'
order by name;

# 2
select title
from course
where dept_name = 'Comp. Sci.'
  and credits = 3
order by title;

# 3
select name
from instructor
where dept_name = 'Comp. Sci.'
  and salary > 75000;

# 4
select name
from student
where tot_cred >= 100
order by tot_cred desc;

# 5
select building
from instructor
         inner join department on instructor.dept_name = department.dept_name
where instructor.name = 'Mozart';

# 6
select title
from course
         inner join section s on course.course_id = s.course_id
where s.year = 2009
  and s.semester = 'Summer'
order by course.course_id;

# 7
select day, start_hr
from time_slot
         inner join section s on time_slot.time_slot_id = s.time_slot_id
         inner join course c on s.course_id = c.course_id
where c.title = 'Genetics';

# 8
select c.course_id, c.title
from student
         inner join takes t on student.ID = t.ID
         inner join course c on t.course_id = c.course_id
where student.ID = 12345;

# 9
select course.title
from course
where course_id = (select prereq_id
                   from course
                            inner join prereq p on course.course_id = p.course_id
                   where course.title = 'Robotics');

# 10
select distinct name
from student
         inner join takes t on student.ID = t.ID
         inner join course c on t.course_id = c.course_id
where c.dept_name = 'Comp. Sci.';
