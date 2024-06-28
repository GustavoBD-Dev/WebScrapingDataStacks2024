select e.name_enterprise,
	   t.name_tool,
	   c.name_category
  from enterprise_tool et
  left join enterprise e using(id_enterprise)
  left join tools t using (id_tool)
  left join categories c using(id_category);
  
-- tool most used by category
select c.name_category, t.name_tool, count(*)
  from enterprise_tool et
  left join enterprise e using(id_enterprise)
  left join tools t using (id_tool)
  left join categories c using(id_category)
 group by 1,2
 order by 1,3 desc;
 
-- tools most used and their category
select t.name_tool, count(e.name_enterprise), c.name_category
  from enterprise_tool et
  left join enterprise e using(id_enterprise)
  left join tools t using (id_tool)
  left join categories c using(id_category)
 group by t.name_tool, c.name_category
 order by 2;
 

select c.name_category , count(e.name_enterprise)
  from enterprise_tool et
 inner join enterprise e using(id_enterprise)
 inner join categories c using(id_category)
 group by c.name_category
 order by 2 desc;   

select count(*) from enterprise e ;


-- tools most used and their category
select distinct e.name_enterprise, count(t.name_tool)
  from enterprise_tool et
  left join enterprise e using(id_enterprise)
  left join tools t using (id_tool)
  left join categories c using(id_category)
 where c.name_category = 'Data Lakes'
 group by 1
 order by 2; 


select e.name_enterprise, t.name_tool, c.name_category
  from enterprise_tool et 
 inner join enterprise e using(id_enterprise)
 inner join tools t using(id_tool) 
 inner join categories c using(id_category)
 where e.name_enterprise = 'Yotpo'
 order by 3; 



select *
  from enterprise_tool et 
 inner join enterprise e using(id_enterprise)
 inner join tools t using(id_tool) 
 inner join categories c using(id_category)
 where c.id_category is null;


select * from enterprise_tool et  where id_enterprise  = 25;

 
select *
  from tools t 
 where t.name_tool = 'Monte Carlo Data';

select * 
  from enterprise_tool et 
 where id_tool = 43; 


select e.name_enterprise, t.name_tool, c.name_category
  from enterprise_tool et 
 inner join enterprise e using(id_enterprise)
 inner join tools t using(id_tool) 
 inner join categories c using(id_category)
 where e.id_enterprise in (11,45,136,142,209,314,317,367)
   and t.id_tool = 43 
 order by 3; 
 
 