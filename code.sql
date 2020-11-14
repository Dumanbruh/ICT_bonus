CREATE TABLE student(
 st_id INT,
 PRIMARY KEY(st_id),
 fname VARCHAR(32),
 lname VARCHAR(32),
 age DECIMAL(3),
 gender VARCHAR(10),
 place_birth VARCHAR(32),
 dateof_birth DATE,
 num_phone VARCHAR(255) 
);

CREATE TABLE ent_result(
  st_id INT,
  FOREIGN KEY(st_id) REFERENCES student(st_id),
  ent_score INT,
  PRIMARY KEY(ent_score) );
  
create table University ( 
UV_id INT,
st_id INT,
University_name VARCHAR(25),
Place VARCHAR(25), 
RANK VARCHAR(25),
Construction_year INT,
primary key(UV_id),
foreign key(st_id) REFERENCES student(st_id)
);
  

create table list_of_applicants( 
  Uv_id int,
  ST_id int, 
  foreign key(Uv_id)
  REFERENCES university(UV_id) );
  
  
  create table university_facility(
  major_id int, 
  major Varchar(25), 
  min_ent_score int, 
  ent_score int,
  UV_id INT,
    foreign key(UV_id)
    references university(Uv_id),
    foreign key ( ent_score)
    references ent_result(ent_score)
  );
  
  

  create table International_students(
inter_st_id int,
    UV_id int,
  primary key ( inter_st_id), 
  f_name Varchar(32),
  l_name Varchar(32), 
  number_phone int, 
  age int, 
  Gender varchar(32),
  date_of_birth date, 
  place_birth varchar(32),
    foreign key (Uv_id)
    references university(Uv_id)
);

create table Activity(
st_id int, 
  inter_st_id int, 
  work_ex varchar(32),
  sport_section varchar(32), 
  social_section varchar (32),
  foreign key(st_id)
  references student(st_id),
  foreign key ( inter_st_id)
  references international_students(inter_st_id)
  );
  
  
  CREATE TABLE achievement(
 st_id INT,
 FOREIGN KEY(st_id) REFERENCES student(st_id),
 international_olympiad VARCHAR(255),
 national_olympiad VARCHAR(255),
 altyn_belgy VARCHAR(3),
 others VARCHAR(255)
);

CREATE TABLE intern_result(
 SAT_res INT,
 IELTS_res INT,
 PRIMARY KEY(SAT_res,IELTS_res),
 st_id INT,
 inter_st_id INT,
 FOREIGN KEY(st_id) REFERENCES student(st_id),
 FOREIGN KEY(inter_st_id) REFERENCES international_students(inter_st_id)
);


CREATE TABLE grants(
 st_id INT,
 inter_st_id INT,
 ent_score INT,
  discount varchar(150),
 FOREIGN KEY(st_id) REFERENCES student(st_id),
 FOREIGN KEY(inter_st_id) REFERENCES international_students(inter_st_id),
 FOREIGN KEY(ent_score) REFERENCES ent_result(ent_score)
);