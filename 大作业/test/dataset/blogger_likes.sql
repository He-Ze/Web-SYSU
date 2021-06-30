create table likes
(
    lid    int auto_increment
        primary key,
    blogId int          not null,
    userId varchar(255) null
);

INSERT INTO blogger.likes (lid, blogId, userId) VALUES (1, 1, 'gth');
INSERT INTO blogger.likes (lid, blogId, userId) VALUES (2, 1, 'heze');
INSERT INTO blogger.likes (lid, blogId, userId) VALUES (3, 1, 'user');
INSERT INTO blogger.likes (lid, blogId, userId) VALUES (4, 2, 'user2');
INSERT INTO blogger.likes (lid, blogId, userId) VALUES (5, 3, 'user');
INSERT INTO blogger.likes (lid, blogId, userId) VALUES (6, 3, 'heze');
INSERT INTO blogger.likes (lid, blogId, userId) VALUES (7, 4, 'gth');
INSERT INTO blogger.likes (lid, blogId, userId) VALUES (8, 5, 'user3');
INSERT INTO blogger.likes (lid, blogId, userId) VALUES (9, 2, 'wsc');
INSERT INTO blogger.likes (lid, blogId, userId) VALUES (10, 6, 'wsc');