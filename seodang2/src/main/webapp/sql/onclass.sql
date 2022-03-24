create table onclass(
	on_num number not null,
	user_num number not null,
	on_name varchar2(12) not null,
	on_price varchar2(30) not null,
	hit number default 0 not null,
	category not null,
	uploadfile blob,
	filename varchar2(100) not null,
	on_content clob not null,
	reg_date date default sysdate not null,
	modify_date date,
	constraint onclass_pk primary key (on_num),
	constraint onclass_fk foreign key (user_num) 
                         references ouser (user_num)
);
create table ostar(
	ostar_num number not null,
	user_num number not null,
	on_num number not null,
	text varchar2(100) not null,
	rating number default 0 not null,
	constraint ostar_pk primary key (ostar_num),
	constraint ostar_fk1 foreign key (user_num) 
                         references ouser (user_num),
	constraint ostar_fk2 foreign key (on_num)
	 					 references onclass (on_num)
);
create sequence ostar_seq;