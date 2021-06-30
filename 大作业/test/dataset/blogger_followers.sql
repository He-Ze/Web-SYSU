create table followers
(
    username  varchar(20) null,
    followers varchar(20) null,
    status    varchar(20) null
);

INSERT INTO blogger.followers (username, followers, status) VALUES ('heze', 'user3', 'following');
INSERT INTO blogger.followers (username, followers, status) VALUES ('heze', 'user', 'following');
INSERT INTO blogger.followers (username, followers, status) VALUES ('heze', 'user2', 'following');
INSERT INTO blogger.followers (username, followers, status) VALUES ('gth', 'user', 'following');
INSERT INTO blogger.followers (username, followers, status) VALUES ('user2', 'heze', 'following');
INSERT INTO blogger.followers (username, followers, status) VALUES ('user2', 'user3', 'following');
INSERT INTO blogger.followers (username, followers, status) VALUES ('user3', 'heze', 'following');
INSERT INTO blogger.followers (username, followers, status) VALUES ('user', 'heze', 'following');
INSERT INTO blogger.followers (username, followers, status) VALUES ('user', 'gth', 'following');