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


-- set primary keys and secuence autoincrement to tables

create sequence enterprise_id_sequence owned by enterprise.id_enterprise;

alter table enterprise alter column id_enterprise set default nextval('enterprise_id_sequence'); 

update enterprise set id_enterprise = nextval('enterprise_id_sequence'); 

-- command describe table
SELECT * FROM information_schema.columns
WHERE table_schema = 'public'
   AND table_name   = 'enterprise';
  
-- see sequence
SELECT * FROM information_schema.sequences;
  