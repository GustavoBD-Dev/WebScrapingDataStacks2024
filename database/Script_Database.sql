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
