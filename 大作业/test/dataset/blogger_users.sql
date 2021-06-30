create table users
(
    username  varchar(255) not null
        primary key,
    firstName varchar(255) not null,
    lastName  varchar(255) not null,
    dob       varchar(255) not null,
    email     varchar(255) not null,
    password  varchar(255) not null,
    photoUrl  varchar(255) null,
    roles     varchar(255) not null
);

INSERT INTO blogger.users (username, firstName, lastName, dob, email, password, photoUrl, roles) VALUES ('gth', '郭', '庭浩', '2000-05-22', 'gth@mail2.sysu.edu.cn', '123', 'pictures/1.jpeg', 'blogger');
INSERT INTO blogger.users (username, firstName, lastName, dob, email, password, photoUrl, roles) VALUES ('heze', '何', '泽', '2000-02-07', 'heze@mail2.sysu.edu.cn', '123', 'pictures/2.jpeg', 'blogger');
INSERT INTO blogger.users (username, firstName, lastName, dob, email, password, photoUrl, roles) VALUES ('mayun', '马', '云', '2000-07-17', 'mayun@mail2.sysu.edu.cn', '123', 'pictures/7.jpeg', 'blogger');
INSERT INTO blogger.users (username, firstName, lastName, dob, email, password, photoUrl, roles) VALUES ('user', 'Web', 'User1', '2000-08-30', 'WebUser1@mail2.sysu.edu.cn', '123', 'pictures/3.jpeg', 'blogger');
INSERT INTO blogger.users (username, firstName, lastName, dob, email, password, photoUrl, roles) VALUES ('user2', 'Web', 'User2', '2000-11-07', 'WebUser2@mail2.sysu.edu.cn', '123', 'pictures/4.jpeg', 'blogger');
INSERT INTO blogger.users (username, firstName, lastName, dob, email, password, photoUrl, roles) VALUES ('user3', 'Web', 'User3', '2000-03-25', 'WebUser3@mail2.sysu.edu.cn', '123', 'pictures/5.jpeg', 'blogger');
INSERT INTO blogger.users (username, firstName, lastName, dob, email, password, photoUrl, roles) VALUES ('user4', 'Web', 'User4', '2000-07-17', 'WebUser4@mail2.sysu.edu.cn', '123', 'pictures/6.jpeg', 'blogger');
INSERT INTO blogger.users (username, firstName, lastName, dob, email, password, photoUrl, roles) VALUES ('wsc', '王', '思聪', '2000-07-17', 'wsc@mail2.sysu.edu.cn', '123', 'pictures/8.jpeg', 'blogger');