-- First Normal Form

create table class_unformalized (
student_id serial,
advisor varchar,
room varchar,
class1 varchar,
class2 varchar,
class3 varchar
);

insert into class_unformalized (
advisor,
room,
class1,
class2,
class3
)
values
('Jones', 123, 'Biology', 'Chemistry', 'Physics'),
('Smith', 131, 'English', 'Math', 'Library Science');

-- Unnormalized Form
select * from class_unformalized;

-- First Normalized Form (1NF)
select c.student_id, c.advisor, c. room, t.*
from class_unnormalized c
cross join lateral (
values
(c.class1, 'class1'),
(c.class2, 'class2'),
(c.class3, 'class3')
) as t (subject, class_num)
order by student_id;

-- Second Normal Form (2NF)

-- Students
select distinct student_id, advisor, room
from fnf;

-- Classes
select distinct student_id, class_num
from fnf;


-- Third Normal Form (3NF)
select distinct student_id, advisor
from fnf;
-- Faculty
select distinct advisor, room, 342 as dept
from fnf;
