
CREATE TABLE IF NOT EXISTS users (
id INTEGER PRIMARY KEY,
user VARCHAR(32),
pass VARCHAR(64),
access_type INTEGER,
fname VARCHAR(32),
sname VARCHAR(32),
logged INTEGER,
date_create DATE,
date_last_login INTEGER
);

INSERT INTO `users` (`user`, `pass`, `access_type`, `date_create`)
VALUES ('user', SHA1('pass'), 0, NOW());
