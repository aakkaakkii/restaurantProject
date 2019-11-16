create sequence hibernate_sequence start 1 increment 1;

create table app_state
(
  id  int8 not null,
  key varchar(255),
  val varchar(255),
  primary key (id)
);

create table category
(
  id       int8 not null,
  img_name varchar(255),
  name_en  varchar(255),
  name_fi  varchar(255),
  primary key (id)
);

create table food
(
  id             int8   not null,
  description_en varchar(4096),
  description_fi varchar(4096),
  img_name       varchar(255),
  name_en        varchar(255),
  name_fi        varchar(255),
  price          float8 not null,
  category_id    int8,
  foodtype_id    int8,
  primary key (id)
);

create table food_type
(
  id       int8 not null,
  img_name varchar(255),
  name_en  varchar(255),
  name_fi  varchar(255),
  primary key (id)
);

create table gallery
(
  id        int8 not null,
  category  varchar(255),
  file_name varchar(255),
  primary key (id)
);

create table reservation
(
  id                  int8 not null,
  is_reserved_from    timestamp,
  is_reserved_to      timestamp,
  name                varchar(255),
  phone_number        varchar(255),
  restaurant_table_id int8,
  primary key (id)
);

create table restaurant_table
(
  id          int8 not null,
  table_count int4,
  table_size  int4,
  primary key (id)
);

create table review
(
  id         int8    not null,
  is_visible boolean not null,
  message    varchar(4096),
  name       varchar(255),
  subject    varchar(255),
  primary key (id)
);

create table service
(
  id             int8 not null,
  description_en varchar(4096),
  description_fi varchar(4096),
  img_name       varchar(255),
  title_en       varchar(255),
  title_fi       varchar(255),
  primary key (id)
);

create table user_role
(
  user_id int8 not null,
  roles   varchar(255)
);

create table usr
(
  id       int8    not null,
  active   boolean not null,
  mail     varchar(255),
  password varchar(255),
  username varchar(255),
  primary key (id)
);

alter table if exists food
  add constraint food_category_fk foreign key (category_id) references category;
alter table if exists food
  add constraint food_food_type_fk foreign key (foodtype_id) references food_type;
alter table if exists reservation
  add constraint reservation_restaurant_table_fk foreign key (restaurant_table_id) references restaurant_table;
alter table if exists user_role
  add constraint user_role_user_fk foreign key (user_id) references usr;
