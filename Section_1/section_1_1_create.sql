create database advanced_tutorial;

create schema tutorial;

/*What is Schema in SQL?
In a SQL database, a schema is a list of logical structures of data. A database user owns the schema, which has the same name as the database manager. As of SQL Server 2005, a  schema is an individual entity (container of objects) distinct from the user who constructs the object. In other words, schemas are similar to separate namespaces or containers used to handle database files. Schemas may be assigned security permissions, making them an effective method for distinguishing and defending database objects based on user access privileges. It increases the database's stability for security-related management.

A SQL schema can be easily transferred to another user.
A schema may be shared by several users.
It enables you to transfer database objects between schemas.
We gain greater power over the access and protection of database objects.
A user can be removed without removing the database items that are connected with the user.
Database objects can be grouped into logical groups using schemas. This is advantageous when several people are collaborating on the same database program and the architecture team needs to keep the database tables' credibility.
Since a schema allows for the logical aggregation of database objects, it can assist us in cases where the database object name is the same but falls into a separate logical category.*/

create table tutorial.employees (
	id numeric primary key, 
	first_name varchar not null, 
	last_name varchar not null, 
	email varchar,
	hire_date date default current_date, 
	department varchar default 'Unassigned'
);
select * from tutorial.employees;
