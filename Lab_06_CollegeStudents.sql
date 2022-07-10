-- Create database
CREATE DATABASE IF NOT EXISTS CollegeStudents;
USE CollegeStudents;


-- Create table
CREATE TABLE IF NOT EXISTS student (
student_id int primary key auto_increment, 
first_name varchar(100), 
last_name varchar(100), 
course varchar(50), 
country varchar(50)
);

CREATE TABLE IF NOT EXISTS users (
user_id int primary key auto_increment, 
username varchar(100), 
password varchar(100)
);

CREATE TABLE IF NOT EXISTS roles (
role_id int primary key auto_increment, 
name varchar(100)
);

CREATE TABLE IF NOT EXISTS users_roles (
user_id int, 
role_id int
);

alter table users_roles add constraint users_fkey foreign key (user_id) references users (user_id);
alter table users_roles add constraint roles_fkey foreign key (role_id) references roles (role_id);


-- Insert into tables
INSERT INTO student (student_id, first_name, last_name, course, country) VALUES (1, 'Suresh', 'Reddy', 'B.Tech', 'India');
INSERT INTO student (student_id, first_name, last_name, course, country) VALUES (2, 'Murali', 'Mohan', 'B.Arch', 'Canada');
INSERT INTO student (student_id, first_name, last_name, course, country) VALUES (3, 'Daniel', 'Denson', 'B.Tech', 'New Zealand');
INSERT INTO student (student_id, first_name, last_name, course, country) VALUES (4, 'Tanya', 'Gupta', 'B.Com', 'USA');

INSERT INTO users (user_id, username, password) VALUES (1, 'ADMIN', 'admin');
INSERT INTO users (user_id, username, password) VALUES (2, 'USER', 'user');
INSERT INTO users (user_id, username, password) VALUES (3, 'Maidily', 'maidily');

INSERT INTO roles (role_id, name) VALUES (1, 'ADMIN');
INSERT INTO roles (role_id, name) VALUES (2, 'USER');
INSERT INTO roles (role_id, name) VALUES (3, 'GUEST');

INSERT INTO users_roles (user_id, role_id) VALUES (1, 1);
INSERT INTO users_roles (user_id, role_id) VALUES (2, 2);
INSERT INTO users_roles (user_id, role_id) VALUES (3, 3);


-- select query :: testing
select * from students;
select * from roles;
select * from users;
select * from users_roles;
