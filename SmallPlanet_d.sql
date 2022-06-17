use smallplanet;

insert into community(seq,subject,title,writer,content) values(3,'fff','dfgdf','dgsx','dfgdf');
drop table qnaBoard;
create table users(
	email varchar(50) not null primary key,
    name varchar(20) not null,
    password varchar(20) not null,
    birthday date not null,
    regDate datetime not null default current_timestamp,
    authority varchar(10) not null default 'guest'
);

create table community(
	seq int not null primary key auto_increment,
    ref int not null,
    is_comment int not null,
    is_comment_reply int not null,
    subject varchar(5) not null,
    title varchar(50) not null,
    writer varchar(20) not null,
    content longtext not null,
    fileName text default null,
    fileSize int default 0,
    uploadDate datetime not null default current_timestamp,
    updateDate datetime default null,
    depth int not null,
    cnt int default 0
);

create table dataBoard(
	seq int not null primary key auto_increment,
    ref int not null,
    is_comment int not null,
    is_comment_reply int not null,
    subject varchar(5) not null,
    title varchar(50) not null,
    writer varchar(20) not null,
    content longtext not null,
    fileName text default null,
    fileSize int default 0,
    uploadDate datetime not null default current_timestamp,
    updateDate datetime default null,
    depth int not null,
    cnt int default 0
);

create table qnaBoard(
	seq int not null primary key auto_increment,
    ref int not null,
    is_comment int not null,
    is_comment_reply int not null,
    subject varchar(5) not null,
    title varchar(50) not null,
    writer varchar(20) not null,
    content longtext not null,
    fileName text default null,
    fileSize int default 0,
    uploadDate datetime not null default current_timestamp,
    updateDate datetime default null,
    depth int not null,
    cnt int default 0
);

create table inquiryBoard(
	seq int not null primary key auto_increment,
    title varchar(50) not null,
    writer varchar(20) not null,
    email varchar(20) not null,
    phoneNumber varchar(20) not null,
    content longtext not null,
    fileName text default null,
    fileSize int default 0,
    uploadDate datetime not null default current_timestamp
);