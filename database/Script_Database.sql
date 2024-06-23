-- command

create database data_stack;

select current_database(); 

create table enterprise(
	id_enterprise numeric,
	name_enterprise text
);

create table tools(
	id_tool numeric,
	name_tool text,
	id_category numeric
);

create table categories(
	id_category numeric,
	name_category text 
);

create table enterprise_tool(
	id_tool numeric,
	id_enterprise numeric
);


create table tool_category(
	id_tool numeric, 
	id_category numeric
);

-- delete column
alter table tools drop column id_category;


-- set primary keys and secuence autoincrement to tables

create sequence enterprise_id_sequence owned by enterprise.id_enterprise;
alter table enterprise alter column id_enterprise set default nextval('enterprise_id_sequence'); 
update enterprise set id_enterprise = nextval('enterprise_id_sequence'); 

create sequence category_id_sequence owned by categories.id_category;
alter table categories alter column id_category set default nextval('category_id_sequence'); 
update categories set id_category = nextval('category_id_sequence'); 

create sequence tool_id_sequence owned by tools.id_tool;
alter table tools alter column id_tool set default nextval('tool_id_sequence'); 
update tools set id_tool = nextval('tool_id_sequence'); 


-- command describe table
SELECT * FROM information_schema.columns
WHERE table_schema = 'public'
   AND table_name   = 'enterprise';

SELECT * FROM information_schema.columns
 WHERE table_schema = 'public'
   AND table_name   = 'categories';
  
SELECT * FROM information_schema.columns
 WHERE table_schema = 'public'
   AND table_name   = 'tools';
  
    
-- sequences
select * 
  from information_schema.sequences 
 where sequence_name in ('enterprise_id_sequence', 'category_id_sequence', 'tool_id_sequence');


-- restart sequence
alter sequence enterprise_id_sequence restart 1;
alter sequence category_id_sequence restart 1;
alter sequence tool_id_sequence restart 1;


-- test command -> insert data
--delete from enterprise ;
--insert into enterprise values (nextval('enterprise_id_sequence'), '-');


delete from enterprise;
delete from categories;
delete from tools;
delete from enterprise_tool;


-- query data
select * from enterprise e order by name_enterprise ;

select * from categories c ;

select * from tools t  order by name_tool ;

select * from enterprise_tool et ;

select * from tool_category tc;


insert into enterprise_tool 
values (
			(select id_tool from tools where name_tool = 'Segment'),
			(select id_enterprise from enterprise where name_enterprise = 'Facts')
	   );
	   
	   
select * from enterprise e where name_enterprise  = 'Facts'; 

select * from tools t where name_tool = 'Segment';

insert into enterprise_tool values (
		(select id_tool from tools where name_tool = 'Loreal'),
		(select id_enterprise from enterprise where name_enterprise = 'Azure data factory'));

insert into tool_category values (
		(select id_tool from tools where name_tool = 'Segment'),
		(select id_category from categories where name_category = 'Customer Data Platform(CDP)'));
	
-- command : get tool´s category
-- issue: one tool can have more category, find if exists more cases 	
	
	
select * 
  from enterprise e
  left join enterprise_tool et using(id_enterprise)
  left join tools t using (id_tool)
  left join tool_category tc using(id_tool)	
  left join categories c using(id_category);
	
	
	
	
	
	

