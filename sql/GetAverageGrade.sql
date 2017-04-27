select sum((sem_consist_course.grade * course.credit))/sum(course.credit) AS result,year(student.since) as year
from ((student inner join semester on student.sid = semester.sem_sid) inner join sem_consist_course 
		on semester.sem_sid = sem_consist_course.student_id and semester.semid = sem_consist_course.semester_id) 
		inner join course on sem_consist_course.course_id = course.cid
group by year(student.since);