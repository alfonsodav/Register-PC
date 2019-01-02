BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `registerpc_representante` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`nombre`	varchar ( 30 ) NOT NULL,
	`cedula`	varchar ( 9 ) NOT NULL,
	`domicilio`	varchar ( 50 ) NOT NULL,
	`ciudad`	varchar ( 60 ) NOT NULL,
	`estado`	varchar ( 30 ) NOT NULL,
	`email`	varchar ( 254 ) NOT NULL,
	`apellido`	varchar ( 40 ) NOT NULL,
	`telefono`	varchar ( 12 ) NOT NULL
);
INSERT INTO `registerpc_representante` VALUES (1,'miriam','6767761','la Pachamama','Carvajal','trujillo','miriam@gmail.com','Saavedra','0');
INSERT INTO `registerpc_representante` VALUES (2,'alfonso enrique','5767243','carvajal','valera','trujillo','alfonsoendav@gmail.com','davila','0');
CREATE TABLE IF NOT EXISTS `registerpc_estudiante` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`nombre`	varchar ( 30 ) NOT NULL,
	`apellido`	varchar ( 40 ) NOT NULL,
	`email`	varchar ( 254 ) NOT NULL,
	`cedula`	varchar ( 10 ) NOT NULL,
	`representante_id`	integer NOT NULL,
	`año`	bigint NOT NULL,
	FOREIGN KEY(`representante_id`) REFERENCES `registerpc_representante`(`id`) DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO `registerpc_estudiante` VALUES (1,'alfonso','Davila','alfonsodavm@gmail.com','26616881',1,1);
INSERT INTO `registerpc_estudiante` VALUES (2,'manuel alfonso','davila','','151531',1,1);
INSERT INTO `registerpc_estudiante` VALUES (3,'manuel','rivas','','45536668',1,2);
CREATE TABLE IF NOT EXISTS `registerpc_computadora` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`serial`	varchar ( 100 ) NOT NULL,
	`fecha_entrega`	date,
	`estudiante_id`	integer NOT NULL UNIQUE,
	`descripcion`	text NOT NULL,
	`funciona`	bool NOT NULL,
	`representante_id`	integer NOT NULL,
	FOREIGN KEY(`estudiante_id`) REFERENCES `registerpc_estudiante`(`id`) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(`representante_id`) REFERENCES `registerpc_representante`(`id`) DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO `registerpc_computadora` VALUES (1,'12312312312312312','2018-07-15',1,'',1,1);
INSERT INTO `registerpc_computadora` VALUES (2,'4344345634454','2018-07-17',2,'cargador dañado',0,1);
CREATE TABLE IF NOT EXISTS `django_session` (
	`session_key`	varchar ( 40 ) NOT NULL,
	`session_data`	text NOT NULL,
	`expire_date`	datetime NOT NULL,
	PRIMARY KEY(`session_key`)
);
INSERT INTO `django_session` VALUES ('uq0w9wel1judbh9brjec1qm62z9gjgje','NGMxYTZiOTk1ODNlM2JiMWU4MDFmMTYwMzNlNjg2NzY5NThiZjllYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1YjIzYzY1YmI2Y2U5YWY2YjhmZGYzNjQ2OGUyMWNjNWIyMGE3YzQwIn0=','2018-07-29 21:59:46.910918');
INSERT INTO `django_session` VALUES ('5b9drmz3ckt13xnz1dps5p7ljvpkrimv','Nzk5NDE0ZjRiYzc3MjU1YmE1NTE4MmZhNWQyYjIzZDQzNDM0YTkxYTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYWEzNTg3ODY0MmJmZWQwODkzNjdlNjkyZGRiOTRjNDg4OTFkNGI3In0=','2018-08-27 21:18:35.665261');
INSERT INTO `django_session` VALUES ('c98bk0dsz2we93kebnmnopra67kjbijv','NGZjZTViNTYxYzRmZjk1ODVhYWQzZDVmYmNmODVkMDdkNGM0YzIyNjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZDBmYTIzOGY0MDk4ZjAzNzA0NjUwMWRmYmI3ZDg1Mzc0ZTg3NzVkIn0=','2018-10-07 15:36:50.886338');
INSERT INTO `django_session` VALUES ('aeq7eol9w2mfct7cwjkhb40m0xp1kxgd','NGZjZTViNTYxYzRmZjk1ODVhYWQzZDVmYmNmODVkMDdkNGM0YzIyNjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZDBmYTIzOGY0MDk4ZjAzNzA0NjUwMWRmYmI3ZDg1Mzc0ZTg3NzVkIn0=','2018-11-29 21:39:21.028429');
INSERT INTO `django_session` VALUES ('ivxq62ackxe84wwk4a7e4w4jz2brwvyy','YzdiNzgxMWEyMDZhNTI0MmMxMzE3ODMxZGFkZjUzNmQyOWQyMTNjYzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NTkyNzMzZDYxMTJiZmM1NGQzMjA4NDBjZTVmM2IwMzYzOGE2YzU4In0=','2018-12-03 19:23:39.206378');
CREATE TABLE IF NOT EXISTS `django_migrations` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`app`	varchar ( 255 ) NOT NULL,
	`name`	varchar ( 255 ) NOT NULL,
	`applied`	datetime NOT NULL
);
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-07-15 21:58:45.814468');
INSERT INTO `django_migrations` VALUES (2,'auth','0001_initial','2018-07-15 21:58:46.015387');
INSERT INTO `django_migrations` VALUES (3,'admin','0001_initial','2018-07-15 21:58:46.208509');
INSERT INTO `django_migrations` VALUES (4,'admin','0002_logentry_remove_auto_add','2018-07-15 21:58:46.359093');
INSERT INTO `django_migrations` VALUES (5,'contenttypes','0002_remove_content_type_name','2018-07-15 21:58:46.505871');
INSERT INTO `django_migrations` VALUES (6,'auth','0002_alter_permission_name_max_length','2018-07-15 21:58:46.630906');
INSERT INTO `django_migrations` VALUES (7,'auth','0003_alter_user_email_max_length','2018-07-15 21:58:46.811609');
INSERT INTO `django_migrations` VALUES (8,'auth','0004_alter_user_username_opts','2018-07-15 21:58:46.955965');
INSERT INTO `django_migrations` VALUES (9,'auth','0005_alter_user_last_login_null','2018-07-15 21:58:47.089525');
INSERT INTO `django_migrations` VALUES (10,'auth','0006_require_contenttypes_0002','2018-07-15 21:58:47.142878');
INSERT INTO `django_migrations` VALUES (11,'auth','0007_alter_validators_add_error_messages','2018-07-15 21:58:47.281038');
INSERT INTO `django_migrations` VALUES (12,'auth','0008_alter_user_username_max_length','2018-07-15 21:58:47.431108');
INSERT INTO `django_migrations` VALUES (13,'auth','0009_alter_user_last_name_max_length','2018-07-15 21:58:47.564507');
INSERT INTO `django_migrations` VALUES (14,'registerpc','0001_initial','2018-07-15 21:58:47.750688');
INSERT INTO `django_migrations` VALUES (15,'sessions','0001_initial','2018-07-15 21:58:47.893244');
INSERT INTO `django_migrations` VALUES (16,'registerpc','0002_auto_20180715_2208','2018-07-15 22:08:57.565690');
INSERT INTO `django_migrations` VALUES (17,'registerpc','0003_auto_20180715_2218','2018-07-15 22:18:51.539884');
INSERT INTO `django_migrations` VALUES (18,'registerpc','0004_computadora_activa','2018-07-16 00:53:27.300876');
INSERT INTO `django_migrations` VALUES (19,'registerpc','0005_computadora_descripcion','2018-07-16 00:55:43.692008');
INSERT INTO `django_migrations` VALUES (20,'registerpc','0006_auto_20180715_2058','2018-07-16 00:58:05.400729');
INSERT INTO `django_migrations` VALUES (21,'registerpc','0007_auto_20180715_2100','2018-07-16 01:00:48.903996');
INSERT INTO `django_migrations` VALUES (22,'registerpc','0008_auto_20180812_2117','2018-08-13 01:17:59.911035');
INSERT INTO `django_migrations` VALUES (23,'registerpc','0009_auto_20180812_2120','2018-08-13 01:20:08.316927');
INSERT INTO `django_migrations` VALUES (24,'admin','0003_logentry_add_action_flag_choices','2018-09-23 15:26:12.083192');
INSERT INTO `django_migrations` VALUES (25,'registerpc','0010_auto_20181118_1903','2018-11-18 23:08:23.480131');
INSERT INTO `django_migrations` VALUES (26,'registerpc','0011_auto_20181118_1908','2018-11-18 23:08:23.580012');
INSERT INTO `django_migrations` VALUES (27,'registerpc','0012_auto_20181119_1401','2018-11-19 18:02:04.121429');
INSERT INTO `django_migrations` VALUES (28,'registerpc','0013_auto_20181119_1401','2018-11-19 18:02:04.246572');
INSERT INTO `django_migrations` VALUES (29,'registerpc','0014_auto_20181119_1536','2018-11-19 19:36:46.821732');
CREATE TABLE IF NOT EXISTS `django_content_type` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`app_label`	varchar ( 100 ) NOT NULL,
	`model`	varchar ( 100 ) NOT NULL
);
INSERT INTO `django_content_type` VALUES (1,'admin','logentry');
INSERT INTO `django_content_type` VALUES (2,'auth','permission');
INSERT INTO `django_content_type` VALUES (3,'auth','group');
INSERT INTO `django_content_type` VALUES (4,'auth','user');
INSERT INTO `django_content_type` VALUES (5,'contenttypes','contenttype');
INSERT INTO `django_content_type` VALUES (6,'sessions','session');
INSERT INTO `django_content_type` VALUES (7,'registerpc','computadora');
INSERT INTO `django_content_type` VALUES (8,'registerpc','estudiante');
INSERT INTO `django_content_type` VALUES (9,'registerpc','representante');
CREATE TABLE IF NOT EXISTS `django_admin_log` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`action_time`	datetime NOT NULL,
	`object_id`	text,
	`object_repr`	varchar ( 200 ) NOT NULL,
	`change_message`	text NOT NULL,
	`content_type_id`	integer,
	`user_id`	integer NOT NULL,
	`action_flag`	smallint unsigned NOT NULL,
	FOREIGN KEY(`content_type_id`) REFERENCES `django_content_type`(`id`) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`) DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO `django_admin_log` VALUES (1,'2018-07-15 22:10:35.140702','1','miriam','[{"added": {}}]',9,1,1);
INSERT INTO `django_admin_log` VALUES (2,'2018-07-15 22:10:37.003467','1','alfonso Davila','[{"added": {}}]',8,1,1);
INSERT INTO `django_admin_log` VALUES (3,'2018-07-15 22:10:42.176008','1','12312312312312312','[{"added": {}}]',7,1,1);
INSERT INTO `django_admin_log` VALUES (4,'2018-07-16 00:53:49.836770','1','12312312312312312','[{"changed": {"fields": ["activa"]}}]',7,1,2);
INSERT INTO `django_admin_log` VALUES (5,'2018-07-16 00:59:22.942461','1','12312312312312312','[{"changed": {"fields": ["da\u00f1ado"]}}]',7,1,2);
INSERT INTO `django_admin_log` VALUES (6,'2018-07-16 01:06:02.359168','2','manuel alfonso davila','[{"added": {}}]',8,1,1);
INSERT INTO `django_admin_log` VALUES (7,'2018-07-16 01:06:08.224368','2','4344345634454','[{"added": {}}]',7,1,1);
INSERT INTO `django_admin_log` VALUES (8,'2018-07-21 19:32:39.389033','2','alfonso enrique','[{"added": {}}]',9,1,1);
INSERT INTO `django_admin_log` VALUES (9,'2018-08-13 21:16:36.013933','2','profesor','[{"added": {}}]',4,1,1);
INSERT INTO `django_admin_log` VALUES (10,'2018-08-13 21:18:26.419658','2','profesor','[{"changed": {"fields": ["is_staff", "user_permissions"]}}]',4,1,2);
INSERT INTO `django_admin_log` VALUES (11,'2018-11-19 20:06:41.497991','3','manuel rivas','[{"added": {}}]',8,2,1);
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`user_id`	integer NOT NULL,
	`permission_id`	integer NOT NULL,
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(`permission_id`) REFERENCES `auth_permission`(`id`) DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO `auth_user_user_permissions` VALUES (1,2,19);
INSERT INTO `auth_user_user_permissions` VALUES (2,2,20);
INSERT INTO `auth_user_user_permissions` VALUES (3,2,21);
INSERT INTO `auth_user_user_permissions` VALUES (4,2,22);
INSERT INTO `auth_user_user_permissions` VALUES (5,2,23);
INSERT INTO `auth_user_user_permissions` VALUES (6,2,24);
INSERT INTO `auth_user_user_permissions` VALUES (7,2,25);
INSERT INTO `auth_user_user_permissions` VALUES (8,2,26);
INSERT INTO `auth_user_user_permissions` VALUES (9,2,27);
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`user_id`	integer NOT NULL,
	`group_id`	integer NOT NULL,
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`) DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS `auth_user` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`password`	varchar ( 128 ) NOT NULL,
	`last_login`	datetime,
	`is_superuser`	bool NOT NULL,
	`username`	varchar ( 150 ) NOT NULL UNIQUE,
	`first_name`	varchar ( 30 ) NOT NULL,
	`email`	varchar ( 254 ) NOT NULL,
	`is_staff`	bool NOT NULL,
	`is_active`	bool NOT NULL,
	`date_joined`	datetime NOT NULL,
	`last_name`	varchar ( 150 ) NOT NULL
);
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$honRYcXBXclx$1VOS91ZNb0A3TgRcSdt2Q17GRS7FGbesXlXhJ4XJxeo=','2018-09-23 15:27:33.638293',1,'rangel','','alfonsodavm@gmail.com',1,1,'2018-07-15 21:59:36.762775','');
INSERT INTO `auth_user` VALUES (2,'pbkdf2_sha256$120000$HEVjHQmkHNVS$M2V0HEkU/8L6FQ6YnDhk314DnZqc7a1GD3nEMrEWEvM=','2018-11-19 19:23:10.646069',0,'profesor','','',1,1,'2018-08-13 21:16:35','');
CREATE TABLE IF NOT EXISTS `auth_permission` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`content_type_id`	integer NOT NULL,
	`codename`	varchar ( 100 ) NOT NULL,
	`name`	varchar ( 255 ) NOT NULL,
	FOREIGN KEY(`content_type_id`) REFERENCES `django_content_type`(`id`) DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO `auth_permission` VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO `auth_permission` VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO `auth_permission` VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO `auth_permission` VALUES (4,2,'add_permission','Can add permission');
INSERT INTO `auth_permission` VALUES (5,2,'change_permission','Can change permission');
INSERT INTO `auth_permission` VALUES (6,2,'delete_permission','Can delete permission');
INSERT INTO `auth_permission` VALUES (7,3,'add_group','Can add group');
INSERT INTO `auth_permission` VALUES (8,3,'change_group','Can change group');
INSERT INTO `auth_permission` VALUES (9,3,'delete_group','Can delete group');
INSERT INTO `auth_permission` VALUES (10,4,'add_user','Can add user');
INSERT INTO `auth_permission` VALUES (11,4,'change_user','Can change user');
INSERT INTO `auth_permission` VALUES (12,4,'delete_user','Can delete user');
INSERT INTO `auth_permission` VALUES (13,5,'add_contenttype','Can add content type');
INSERT INTO `auth_permission` VALUES (14,5,'change_contenttype','Can change content type');
INSERT INTO `auth_permission` VALUES (15,5,'delete_contenttype','Can delete content type');
INSERT INTO `auth_permission` VALUES (16,6,'add_session','Can add session');
INSERT INTO `auth_permission` VALUES (17,6,'change_session','Can change session');
INSERT INTO `auth_permission` VALUES (18,6,'delete_session','Can delete session');
INSERT INTO `auth_permission` VALUES (19,7,'add_computadora','Can add computadora');
INSERT INTO `auth_permission` VALUES (20,7,'change_computadora','Can change computadora');
INSERT INTO `auth_permission` VALUES (21,7,'delete_computadora','Can delete computadora');
INSERT INTO `auth_permission` VALUES (22,8,'add_estudiante','Can add estudiante');
INSERT INTO `auth_permission` VALUES (23,8,'change_estudiante','Can change estudiante');
INSERT INTO `auth_permission` VALUES (24,8,'delete_estudiante','Can delete estudiante');
INSERT INTO `auth_permission` VALUES (25,9,'add_representante','Can add representante');
INSERT INTO `auth_permission` VALUES (26,9,'change_representante','Can change representante');
INSERT INTO `auth_permission` VALUES (27,9,'delete_representante','Can delete representante');
INSERT INTO `auth_permission` VALUES (28,1,'view_logentry','Can view log entry');
INSERT INTO `auth_permission` VALUES (29,2,'view_permission','Can view permission');
INSERT INTO `auth_permission` VALUES (30,3,'view_group','Can view group');
INSERT INTO `auth_permission` VALUES (31,4,'view_user','Can view user');
INSERT INTO `auth_permission` VALUES (32,5,'view_contenttype','Can view content type');
INSERT INTO `auth_permission` VALUES (33,6,'view_session','Can view session');
INSERT INTO `auth_permission` VALUES (34,7,'view_computadora','Can view computadora');
INSERT INTO `auth_permission` VALUES (35,8,'view_estudiante','Can view estudiante');
INSERT INTO `auth_permission` VALUES (36,9,'view_representante','Can view representante');
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`group_id`	integer NOT NULL,
	`permission_id`	integer NOT NULL,
	FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(`permission_id`) REFERENCES `auth_permission`(`id`) DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS `auth_group` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar ( 80 ) NOT NULL UNIQUE
);
CREATE INDEX IF NOT EXISTS `registerpc_estudiante_representante_id_66f88df5` ON `registerpc_estudiante` (
	`representante_id`
);
CREATE INDEX IF NOT EXISTS `registerpc_computadora_representante_id_1c3afba9` ON `registerpc_computadora` (
	`representante_id`
);
CREATE INDEX IF NOT EXISTS `django_session_expire_date_a5c62663` ON `django_session` (
	`expire_date`
);
CREATE UNIQUE INDEX IF NOT EXISTS `django_content_type_app_label_model_76bd3d3b_uniq` ON `django_content_type` (
	`app_label`,
	`model`
);
CREATE INDEX IF NOT EXISTS `django_admin_log_user_id_c564eba6` ON `django_admin_log` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `django_admin_log_content_type_id_c4bce8eb` ON `django_admin_log` (
	`content_type_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` ON `auth_user_user_permissions` (
	`user_id`,
	`permission_id`
);
CREATE INDEX IF NOT EXISTS `auth_user_user_permissions_user_id_a95ead1b` ON `auth_user_user_permissions` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `auth_user_user_permissions_permission_id_1fbb5f2c` ON `auth_user_user_permissions` (
	`permission_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `auth_user_groups_user_id_group_id_94350c0c_uniq` ON `auth_user_groups` (
	`user_id`,
	`group_id`
);
CREATE INDEX IF NOT EXISTS `auth_user_groups_user_id_6a12ed8b` ON `auth_user_groups` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `auth_user_groups_group_id_97559544` ON `auth_user_groups` (
	`group_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `auth_permission_content_type_id_codename_01ab375a_uniq` ON `auth_permission` (
	`content_type_id`,
	`codename`
);
CREATE INDEX IF NOT EXISTS `auth_permission_content_type_id_2f476e4b` ON `auth_permission` (
	`content_type_id`
);
CREATE INDEX IF NOT EXISTS `auth_group_permissions_permission_id_84c5c92e` ON `auth_group_permissions` (
	`permission_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` ON `auth_group_permissions` (
	`group_id`,
	`permission_id`
);
CREATE INDEX IF NOT EXISTS `auth_group_permissions_group_id_b120cbf9` ON `auth_group_permissions` (
	`group_id`
);
COMMIT;
