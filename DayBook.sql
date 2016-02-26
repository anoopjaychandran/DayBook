create table exp_member_room_expense 
(
  id int not null auto_increment
, title varchar2(100) 
, room_id int 
, description varchar2(500) 
, expense_date date 
, amount decimal 
, created_at date 
, modified_at date 
, constraint primary key (id)
);

create table exp_menu 
(
  id int not null auto_increment
, name varchar2(50) not null 
, display_name varchar2(50) not null 
, description varchar2(500) 
, is_active smallint default 1 
, constraint primary key (id)
);

create table exp_role 
(
  id int not null auto_increment
, name varchar2(100) not null 
, description varchar2(500) 
, is_active smallint 
, constraint primary key (id)
);

create table exp_role_menu 
(
  id int not null auto_increment
, role_id int 
, menu_id int 
, constraint primary key (id)
);

create table exp_room 
(
  id int not null auto_increment
, user_id int 
, name varchar2(100) not null 
, amount varchar2(20) 
, description varchar2(500) 
, mail_notification smallint default 1 
, report_type smallint default 1 
, is_active smallint default 0 
, constraint primary key (id)
);

create table exp_room_expense_summary 
(
  id int not null auto_increment
, room_id int 
, total_amount decimal 
, exp_month date 
, created_at date 
, modified_at date 
, constraint primary key (id)
);

create table exp_room_members 
(
  id int not null auto_increment
, room_id int 
, user_id int 
, status smallint 
, is_active smallint default 0 
, constraint primary key (id)
);

create table exp_screen 
(
  id int not null auto_increment
, menu_id int not null 
, name varchar2(50) not null 
, display_name varchar2(50) not null 
, is_active smallint 
, constraint primary key (id)
);

create table exp_users 
(
  id int not null auto_increment
, first_name varchar2(100) not null 
, last_name varchar2(100) 
, email varchar2(100) not null 
, mobile varchar2(20) not null 
, user_pwd varchar2(30) not null 
, is_active smallint 
, role_id int 
, user_type smallint default 1 
, status smallint default 0 
, verify_code varchar2(150) 
, created_at timestamp 
, created_by varchar2(100) 
, modified_at timestamp 
, modified_by varchar2(20) 
, constraint primary key (id)
);

create table exp_user_logs 
(
  id int not null auto_increment
, user_id int 
, last_login timestamp 
, actions varchar2(1000) 
, constraint primary key (id) 
);

create table exp_user_profile 
(
  id int not null auto_increment
, user_id int 
, first varchar2(100) not null 
, last_name varchar2(100) 
, email varchar2(100) not null 
, mobile varchar2(20) not null 
, country int 
, state int 
, pincode varchar2(10) 
, profile_path varchar2(20) 
, constraint primary key (id)
);

alter table exp_member_room_expense
add constraint exp_member_room_expense_fk1 foreign key (room_id) references exp_room (id);

alter table exp_role_menu
add constraint exp_role_menu_exp_menu_fk1 foreign key (menu_id) references exp_menu (id);

alter table exp_role_menu
add constraint exp_role_menu_exp_role_fk1 foreign key (role_id) references exp_role (id);

alter table exp_room
add constraint exp_room_fk1 foreign key (user_id) references exp_users (id);

alter table exp_room_expense_summary
add constraint exp_room_expense_summary_fk1 foreign key (room_id) references exp_room (id);

alter table exp_room_members
add constraint exp_room_members_exp_room_fk1 foreign key (room_id) references exp_room (id);

alter table exp_screen
add constraint exp_screen_exp_menu_fk1 foreign key (menu_id) references exp_menu (id);

alter table exp_users
add constraint exp_users_exp_role_fk1 foreign key (role_id) references exp_role (id);

alter table exp_user_logs
add constraint exp_user_logs_exp_users_fk1 foreign key (user_id) references exp_users (id);

alter table exp_user_profile
add constraint exp_user_profile_fk1 foreign key (user_id) references exp_users (id);

