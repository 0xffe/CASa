INSERT INTO `user`(`Host`, `User`, `Password`, `Select_priv`, `Insert_priv`, `Update_priv`, `Delete_priv`, `Alter_priv`) 
VALUES ('localhost', 'web_user', PASSWORD('web_user'), 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `user`(`Host`, `User`, `Password`, `Select_priv`, `Insert_priv`, `Update_priv`, `Delete_priv`, `Alter_priv`) 
VALUES ('127.0.0.1', 'web_user', PASSWORD('web_user'), 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `user`(`Host`, `User`, `Password`, `Select_priv`, `Insert_priv`, `Update_priv`, `Delete_priv`, `Alter_priv`) 
VALUES ('localhost', 'app_user', PASSWORD('app_user'), 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `user`(`Host`, `User`, `Password`, `Select_priv`, `Insert_priv`, `Update_priv`, `Delete_priv`, `Alter_priv`) 
VALUES ('127.0.0.1', 'app_user', PASSWORD('app_user'), 'Y', 'Y', 'Y', 'Y', 'Y')
