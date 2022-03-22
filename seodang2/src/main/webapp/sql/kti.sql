create table okit(
	kit_num number not null,
	user_num number not null,
	kit_name varchar2(30) not null,
	kit_price number not null,
	kit_quantity number not null,
	kit_content clob not null,
    hit number(5) default 0 not null,
    filename varchar2(100),
	uploadfile blob,
	reg_date date default sysdate not null,
	modify_date date,
	constraint okit primary key (kit_num),
	constraint okit_fk foreign key (user_num) references ouser (user_num)
);

create sequence okit_seq;