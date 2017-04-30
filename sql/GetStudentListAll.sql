-- select sid,first_name,last_name,sum(grade*credit)/sum(credit) as gpx,count(g.rewardid) as rewardAmount 
-- from ((student inner join semester on student.sid = semester.sem_sid) inner join sem_consist_course 
-- 		on semester.sem_sid = sem_consist_course.student_id and semester.semid = sem_consist_course.semester_id) 
-- 		inner join course on sem_consist_course.course_id = course.cid left join got_reward g on student.sid = g.studentid
-- group by sid
-- ;
select s.sid ,s.first_name, s.last_name, Grade.GPAX as gpax , count(g.rewardid) as rewardAmount,s.entry_year as enYear,s.tid as tid,s.mid as mid
from (student s left join got_reward g on s.sid = g.studentid) left join
					(select sum((sem_consist_course.grade*course.credit))/sum(course.credit) AS GPAX, student.sid AS Psid ,sem_consist_course.status as status
					from ((student left join semester on student.sid = semester.sem_sid) left join sem_consist_course 
								on semester.sem_sid = sem_consist_course.student_id and semester.semid = sem_consist_course.semester_id) 
								left join course on sem_consist_course.course_id = course.cid
                                where sem_consist_course.status = 'P'
					group by student.sid) AS Grade	on s.sid = Grade.Psid
where
		(Grade.GPAX >= 2 or Grade is null) and s.entry_year >= ? and s.entry_year <= ?
		and s.tid = ?
group by sid
;
