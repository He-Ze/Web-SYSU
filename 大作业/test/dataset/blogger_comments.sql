create table comments
(
    commentId int auto_increment
        primary key,
    username  varchar(255)  not null,
    blogId    int           not null,
    comment   varchar(1000) not null,
    date      varchar(50)   not null
);

INSERT INTO blogger.comments (commentId, username, blogId, comment, date) VALUES (1, 'heze', 1, '太精彩了', '2021-06-22');
INSERT INTO blogger.comments (commentId, username, blogId, comment, date) VALUES (2, 'user', 2, '真的很好听', '2021-06-02');
INSERT INTO blogger.comments (commentId, username, blogId, comment, date) VALUES (3, 'gth', 3, '有用', '2021-05-19');
INSERT INTO blogger.comments (commentId, username, blogId, comment, date) VALUES (4, 'user2', 4, '感谢分享', '2021-05-11');
INSERT INTO blogger.comments (commentId, username, blogId, comment, date) VALUES (5, 'user3', 5, '感谢分享', '2021-03-23');
INSERT INTO blogger.comments (commentId, username, blogId, comment, date) VALUES (6, 'user', 6, '加油！', '2021-06-21');
INSERT INTO blogger.comments (commentId, username, blogId, comment, date) VALUES (7, 'user', 7, '精彩！', '2021-06-22');
INSERT INTO blogger.comments (commentId, username, blogId, comment, date) VALUES (8, 'wsc', 6, '真好', '2021-06-22');