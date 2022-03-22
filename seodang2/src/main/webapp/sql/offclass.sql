create table offclass(
	off_num number not null,
	category_num number not null,
	off_name varchar2(100) not null,
	off_limit number(2) not null,
	off_price number(8) not null,
	off_content clob not null,
	off_filename varchar2(100),
	off_uploadfile blob,
	reg_date date default sysdate not null,
	modify_date date,
	user_num number not null,
	constraint offclass_pk primary key (off_num),
	constraint offclass_fk foreign key(user_num) references ouser(user_num),
	/*constraint offclass_fk2 foreign key(category_num) references category(category_num)*/
);

create sequence offclass_seq;