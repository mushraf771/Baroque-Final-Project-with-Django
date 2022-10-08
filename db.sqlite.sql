BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "baroque_categorie" (
	"id"	integer NOT NULL,
	"title"	varchar(20) NOT NULL,
	"image"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "baroque_product" (
	"id"	integer NOT NULL,
	"product_name"	varchar(20) NOT NULL,
	"product_img"	varchar(100) NOT NULL,
	"product_price"	varchar(50) NOT NULL,
	"product_description"	varchar(200) NOT NULL,
	"product_size"	varchar(20) NOT NULL,
	"availability"	varchar(20) NOT NULL,
	"category_id"	bigint NOT NULL,
	FOREIGN KEY("category_id") REFERENCES "baroque_categorie"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "baroque_product_image" (
	"id"	integer NOT NULL,
	"images"	varchar(100) NOT NULL,
	"Product_images_id"	bigint NOT NULL,
	FOREIGN KEY("Product_images_id") REFERENCES "baroque_product"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "baroque_placedoreders" (
	"id"	integer NOT NULL,
	"product_name_id"	bigint NOT NULL,
	FOREIGN KEY("product_name_id") REFERENCES "baroque_product"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "baroque_order" (
	"id"	integer NOT NULL,
	"fname"	varchar(50) NOT NULL,
	"lname"	varchar(50) NOT NULL,
	"email"	varchar(50) NOT NULL,
	"phone"	varchar(50) NOT NULL,
	"quantity"	integer NOT NULL,
	"product_price"	varchar(20) NOT NULL,
	"region"	varchar(10) NOT NULL,
	"city"	varchar(50) NOT NULL,
	"address"	varchar(200) NOT NULL,
	"date"	datetime NOT NULL,
	"product_id"	bigint NOT NULL,
	FOREIGN KEY("product_id") REFERENCES "baroque_product"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2022-02-08 07:44:03.118737');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2022-02-08 07:44:03.163922');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2022-02-08 07:44:03.198941');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2022-02-08 07:44:03.229748');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2022-02-08 07:44:03.265434');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2022-02-08 07:44:03.299304');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2022-02-08 07:44:03.328815');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2022-02-08 07:44:03.353299');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2022-02-08 07:44:03.368862');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2022-02-08 07:44:03.404657');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2022-02-08 07:44:03.413606');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2022-02-08 07:44:03.435195');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2022-02-08 07:44:03.466069');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2022-02-08 07:44:03.496813');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2022-02-08 07:44:03.522852');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2022-02-08 07:44:03.553800');
INSERT INTO "django_migrations" VALUES (17,'auth','0012_alter_user_first_name_max_length','2022-02-08 07:44:03.588217');
INSERT INTO "django_migrations" VALUES (18,'sessions','0001_initial','2022-02-08 07:44:03.622787');
INSERT INTO "django_migrations" VALUES (19,'baroque','0001_initial','2022-09-06 12:34:26.033553');
INSERT INTO "django_admin_log" VALUES (1,'2022-09-06 12:50:26.907468','1','Chifon','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (2,'2022-09-06 12:50:50.991445','2','Cotton','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (3,'2022-09-06 12:51:05.625743','3','Pret','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (4,'2022-09-06 12:51:22.084117','4','Shawls','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (5,'2022-09-06 12:51:42.661327','5','Ready to Wear','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (6,'2022-09-06 12:51:53.330095','6','Bottom','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (7,'2022-09-06 12:54:19.936285','6','Bottom','',7,1,3);
INSERT INTO "django_admin_log" VALUES (8,'2022-09-06 12:56:33.807161','1','chifon 1','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (9,'2022-09-06 13:14:11.925293','1','Product_image object (1)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (10,'2022-09-06 13:14:26.324956','2','Product_image object (2)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (11,'2022-09-06 13:14:39.204605','3','Product_image object (3)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (12,'2022-09-06 13:14:49.786315','4','Product_image object (4)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (13,'2022-09-06 13:15:00.812351','5','Product_image object (5)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (14,'2022-09-06 13:15:07.917848','6','Product_image object (6)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (15,'2022-09-06 13:15:16.206328','7','Product_image object (7)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (16,'2022-09-06 13:18:36.361640','2','chifon 2','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (17,'2022-09-06 13:20:05.373890','3','chifon 3','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (18,'2022-09-06 13:20:56.030859','8','Product_image object (8)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (19,'2022-09-06 13:21:13.549781','9','Product_image object (9)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (20,'2022-09-06 13:21:33.305301','10','Product_image object (10)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (21,'2022-09-06 13:21:48.534996','11','Product_image object (11)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (22,'2022-09-06 13:22:44.494413','12','Product_image object (12)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (23,'2022-09-06 13:23:04.612556','13','Product_image object (13)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (24,'2022-09-06 13:23:20.116592','14','Product_image object (14)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (25,'2022-09-06 13:23:31.585549','15','Product_image object (15)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (26,'2022-09-06 13:23:46.194343','16','Product_image object (16)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (27,'2022-09-06 13:26:43.873071','4','Cotton 1','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (28,'2022-09-06 13:28:49.186112','5','Cotton 2','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (29,'2022-09-06 13:29:28.270522','6','cotton 3','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (30,'2022-09-06 13:35:12.632719','17','Product_image object (17)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (31,'2022-09-06 13:35:27.205915','18','Product_image object (18)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (32,'2022-09-06 13:35:45.008613','19','Product_image object (19)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (33,'2022-09-06 13:36:52.031293','20','Product_image object (20)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (34,'2022-09-06 13:38:00.827718','21','Product_image object (21)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (35,'2022-09-06 13:38:22.767368','22','Product_image object (22)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (36,'2022-09-06 13:38:43.269803','23','Product_image object (23)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (37,'2022-09-06 13:39:11.271842','24','Product_image object (24)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (38,'2022-09-06 13:39:47.977379','24','Product_image object (24)','',10,1,3);
INSERT INTO "django_admin_log" VALUES (39,'2022-09-06 13:40:22.593149','25','Product_image object (25)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (40,'2022-09-06 13:40:33.212408','26','Product_image object (26)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (41,'2022-09-06 13:41:34.108902','26','Product_image object (26)','',10,1,3);
INSERT INTO "django_admin_log" VALUES (42,'2022-09-06 13:41:34.129561','25','Product_image object (25)','',10,1,3);
INSERT INTO "django_admin_log" VALUES (43,'2022-09-06 13:42:49.048192','27','Product_image object (27)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (44,'2022-09-06 13:43:03.616946','28','Product_image object (28)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (45,'2022-09-06 13:43:19.994655','29','Product_image object (29)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (46,'2022-09-06 13:43:32.480004','30','Product_image object (30)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (47,'2022-09-06 13:45:50.501907','7','pret 1','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (48,'2022-09-06 13:46:31.829703','8','pret 2','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (49,'2022-09-06 13:47:03.494197','9','pret 3','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (50,'2022-09-06 13:47:27.981876','31','Product_image object (31)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (51,'2022-09-06 13:47:39.079823','32','Product_image object (32)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (52,'2022-09-06 13:47:51.181081','33','Product_image object (33)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (53,'2022-09-06 13:48:02.389082','34','Product_image object (34)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (54,'2022-09-06 13:48:09.468745','35','Product_image object (35)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (55,'2022-09-06 13:49:09.393453','36','Product_image object (36)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (56,'2022-09-06 13:49:19.527512','37','Product_image object (37)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (57,'2022-09-06 13:49:43.915087','38','Product_image object (38)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (58,'2022-09-06 13:49:55.887173','39','Product_image object (39)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (59,'2022-09-06 13:50:39.316765','40','Product_image object (40)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (60,'2022-09-06 13:50:51.425543','41','Product_image object (41)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (61,'2022-09-06 13:51:02.689974','42','Product_image object (42)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (62,'2022-09-06 13:53:36.177054','4','Shawls','[{"changed": {"fields": ["Image"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (63,'2022-09-06 13:54:35.176225','10','shawls 1','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (64,'2022-09-06 13:55:15.059987','11','shawls 2','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (65,'2022-09-06 13:55:54.923089','12','shawls 3','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (66,'2022-09-06 13:56:11.813014','43','Product_image object (43)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (67,'2022-09-06 13:56:26.949373','44','Product_image object (44)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (68,'2022-09-06 13:56:38.304452','45','Product_image object (45)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (69,'2022-09-06 13:56:49.685311','46','Product_image object (46)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (70,'2022-09-06 13:57:06.487674','47','Product_image object (47)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (71,'2022-09-06 13:57:32.181593','48','Product_image object (48)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (72,'2022-09-06 13:57:45.538353','49','Product_image object (49)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (73,'2022-09-06 13:57:57.095662','50','Product_image object (50)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (74,'2022-09-06 13:59:08.967021','51','Product_image object (51)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (75,'2022-09-06 13:59:17.689986','52','Product_image object (52)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (76,'2022-09-06 13:59:29.737951','53','Product_image object (53)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (77,'2022-09-06 13:59:53.261779','54','Product_image object (54)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (78,'2022-09-06 14:00:03.894213','55','Product_image object (55)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (79,'2022-09-06 14:02:47.084837','13','rtw-1','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (80,'2022-09-06 14:03:48.701174','14','rtw-2','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (81,'2022-09-06 14:04:20.491517','15','rtw-3','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (82,'2022-09-06 14:05:02.088491','56','Product_image object (56)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (83,'2022-09-06 14:05:16.891175','57','Product_image object (57)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (84,'2022-09-06 14:05:28.318659','58','Product_image object (58)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (85,'2022-09-06 14:05:39.054478','59','Product_image object (59)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (86,'2022-09-06 14:05:51.429483','60','Product_image object (60)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (87,'2022-09-06 14:06:03.276924','61','Product_image object (61)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (88,'2022-09-06 14:06:16.209242','62','Product_image object (62)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (89,'2022-09-06 14:06:25.687635','63','Product_image object (63)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (90,'2022-09-06 14:06:35.566844','64','Product_image object (64)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (91,'2022-09-06 14:06:45.030395','65','Product_image object (65)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (92,'2022-09-06 14:06:55.534717','66','Product_image object (66)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (93,'2022-09-07 04:16:14.829890','7','unstiched','[{"added": {}}]',7,1,1);
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'baroque','categorie');
INSERT INTO "django_content_type" VALUES (8,'baroque','placedoreders');
INSERT INTO "django_content_type" VALUES (9,'baroque','product');
INSERT INTO "django_content_type" VALUES (10,'baroque','product_image');
INSERT INTO "django_content_type" VALUES (11,'baroque','order');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_categorie','Can add categorie');
INSERT INTO "auth_permission" VALUES (26,7,'change_categorie','Can change categorie');
INSERT INTO "auth_permission" VALUES (27,7,'delete_categorie','Can delete categorie');
INSERT INTO "auth_permission" VALUES (28,7,'view_categorie','Can view categorie');
INSERT INTO "auth_permission" VALUES (29,8,'add_placedoreders','Can add placed oreders');
INSERT INTO "auth_permission" VALUES (30,8,'change_placedoreders','Can change placed oreders');
INSERT INTO "auth_permission" VALUES (31,8,'delete_placedoreders','Can delete placed oreders');
INSERT INTO "auth_permission" VALUES (32,8,'view_placedoreders','Can view placed oreders');
INSERT INTO "auth_permission" VALUES (33,9,'add_product','Can add product');
INSERT INTO "auth_permission" VALUES (34,9,'change_product','Can change product');
INSERT INTO "auth_permission" VALUES (35,9,'delete_product','Can delete product');
INSERT INTO "auth_permission" VALUES (36,9,'view_product','Can view product');
INSERT INTO "auth_permission" VALUES (37,10,'add_product_image','Can add product_image');
INSERT INTO "auth_permission" VALUES (38,10,'change_product_image','Can change product_image');
INSERT INTO "auth_permission" VALUES (39,10,'delete_product_image','Can delete product_image');
INSERT INTO "auth_permission" VALUES (40,10,'view_product_image','Can view product_image');
INSERT INTO "auth_permission" VALUES (41,11,'add_order','Can add order');
INSERT INTO "auth_permission" VALUES (42,11,'change_order','Can change order');
INSERT INTO "auth_permission" VALUES (43,11,'delete_order','Can delete order');
INSERT INTO "auth_permission" VALUES (44,11,'view_order','Can view order');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$320000$rktVEKlkxErg7ehFDzZnFO$IPKyIoMgn5XsoA1KW7dFuwTFAxEnUr5Ra5GQUFTGQsA=','2022-09-06 12:45:38.766980',1,'king','','a@a.com',1,1,'2022-09-06 12:35:20.444952','');
INSERT INTO "django_session" VALUES ('uh3lu4knomskhlpt6qhqej5b4l3l4rds','.eJxVjDsOgzAQBe-ydWRl_cNQpucM1q4_MUkEkoEKcfeARJG0b-bNBp7Wpfh1TtUPETpAuP1uTOGdxhPEF43PSYRpXOrA4lTERWfRTzF9Hpf7Fyg0l-NNKLW2Luuo7oRIwdjcBKM1aWdbFaVSjmwbFbIhizY5psQKDTuZQ-IjGqgu0G3QQCf3_QssQDv2:1oVsm2:2qt-xX5Hoxw9gKJBFDjNiHv7BYeyPYxVCsZgb3nIDy0','2022-09-21 10:59:14.234109');
INSERT INTO "baroque_categorie" VALUES (1,'Chifon','uploads/category/22/01_2_600x_crop_center.jpg');
INSERT INTO "baroque_categorie" VALUES (2,'Cotton','uploads/category/22/30_ce436077-a091-43df-8300-6467558cb2f1_600x_crop_center2.jpg');
INSERT INTO "baroque_categorie" VALUES (3,'Pret','uploads/category/22/1Q0A0015_600x_crop_center.jpg');
INSERT INTO "baroque_categorie" VALUES (4,'Shawls','uploads/category/22/51_6d75a945-988b-401b-ade1-e5c1b4ec9e47_600x_crop_center.jpg');
INSERT INTO "baroque_categorie" VALUES (5,'Ready to Wear','uploads/category/22/01_eb64c6e0-650c-4d20-b894-0acff3d09b6b_600x_crop_center.jpg');
INSERT INTO "baroque_categorie" VALUES (7,'unstiched','uploads/category/22/Untitled-56_600x_crop_center.jpg');
INSERT INTO "baroque_product" VALUES (1,'chifon 1','uploads/products/22/01_2_600x_crop_center.jpg','4560','this is chifon 1','Medium','In Stock',1);
INSERT INTO "baroque_product" VALUES (2,'chifon 2','uploads/products/22/C6_95ffb827-987e-406e-b03f-b5528ac1b229_600x_crop_center.jpg','4800','this is chifon 2','Large','In Stock',1);
INSERT INTO "baroque_product" VALUES (3,'chifon 3','uploads/products/22/PS1_1_600x_crop_center.jpg','4700','this is chifon 3','Large','In Stock',1);
INSERT INTO "baroque_product" VALUES (4,'Cotton 1','uploads/products/22/30_ce436077-a091-43df-8300-6467558cb2f1_600x_crop_center.jpg','3200','Khaddar vip suits 1','Large','In Stock',2);
INSERT INTO "baroque_product" VALUES (5,'Cotton 2','uploads/products/22/37_d925545f-7682-4bd4-aa8e-d6725fd2fa0e_600x_crop_center.jpg','3350','Embroidered cotton front body Plain chiffon back body Embroidered chiffon front Embroidered chiffon back Embroidered chiffon sleeves Embroidered chiffon Sleeve patch Embroidered net dupatta patch Emb','Large','In Stock',2);
INSERT INTO "baroque_product" VALUES (6,'cotton 3','uploads/products/22/C6_600x_crop_center.jpg','3800','Embroidered chiffon front body Plain chiffon back body Embroidered chiffon front Embroidered chiffon back Embroidered chiffon sleeves Embroidered chiffon Sleeve patch Embroidered net dupatta patch Emb','Medium','In Stock',2);
INSERT INTO "baroque_product" VALUES (7,'pret 1','uploads/products/22/1Q0A0015_600x_crop_center.jpg','2300','Embroidered chiffon front body Plain chiffon back body Embroidered chiffon front Embroidered chiffon back Embroidered chiffon sleeves Embroidered chiffon Sleeve patch Embroidered net dupatta patch Emb','Large','In Stock',3);
INSERT INTO "baroque_product" VALUES (8,'pret 2','uploads/products/22/FL1_600x_crop_center.jpg','2700','Embroidered chiffon front body Plain chiffon back body Embroidered chiffon front Embroidered chiffon back Embroidered chiffon sleeves Embroidered chiffon Sleeve patch Embroidered net dupatta patch Emb','Large','In Stock',3);
INSERT INTO "baroque_product" VALUES (9,'pret 3','uploads/products/22/Pearl_luster_3_600x_crop_center.jpg','3000','Embroidered chiffon front body Plain chiffon back body Embroidered chiffon front Embroidered chiffon back Embroidered chiffon sleeves Embroidered chiffon Sleeve patch Embroidered net dupatta patch Emb','Large','In Stock',3);
INSERT INTO "baroque_product" VALUES (10,'shawls 1','uploads/products/22/51_6d75a945-988b-401b-ade1-e5c1b4ec9e47_600x_crop_center.jpg','2300','Embroidered chiffon front body Plain chiffon back body Embroidered chiffon front Embroidered chiffon back Embroidered chiffon sleeves Embroidered chiffon Sleeve patch Embroidered net dupatta patch Emb','Large','In Stock',4);
INSERT INTO "baroque_product" VALUES (11,'shawls 2','uploads/products/22/41_6c05f602-1c5d-4840-b5b9-85ac295e4211_600x_crop_center.jpg','2100','Embroidered chiffon front body Plain chiffon back body Embroidered chiffon front Embroidered chiffon back Embroidered chiffon sleeves Embroidered chiffon Sleeve patch Embroidered net dupatta patch Emb','Large','In Stock',4);
INSERT INTO "baroque_product" VALUES (12,'shawls 3','uploads/products/22/SH3_3485a587-23c3-4191-b973-90fdf57388f3_600x_crop_center.jpg','2900','Embroidered chiffon front body Plain chiffon back body Embroidered chiffon front Embroidered chiffon back Embroidered chiffon sleeves Embroidered chiffon Sleeve patch Embroidered net dupatta patch Emb','Large','In Stock',4);
INSERT INTO "baroque_product" VALUES (13,'rtw-1','uploads/products/22/01_eb64c6e0-650c-4d20-b894-0acff3d09b6b_600x_crop_center.jpg','1700','Embroidered chiffon front body Plain chiffon back body Embroidered chiffon front Embroidered chiffon back Embroidered chiffon sleeves Embroidered chiffon Sleeve patch Embroidered net dupatta patch Emb','Large','In Stock',5);
INSERT INTO "baroque_product" VALUES (14,'rtw-2','uploads/products/22/22_9_600x_crop_center.jpg','2300','Embroidered chiffon front body Plain chiffon back body Embroidered chiffon front Embroidered chiffon back Embroidered chiffon sleeves Embroidered chiffon Sleeve patch Embroidered net dupatta patch Emb','Large','In Stock',5);
INSERT INTO "baroque_product" VALUES (15,'rtw-3','uploads/products/22/9_20_600x_crop_center2.jpg','2100','Embroidered chiffon front body Plain chiffon back body Embroidered chiffon front Embroidered chiffon back Embroidered chiffon sleeves Embroidered chiffon Sleeve patch Embroidered net dupatta patch Emb','Large','In Stock',5);
INSERT INTO "baroque_product_image" VALUES (1,'uploads/products/details/22/01_2_600x_crop_center.jpg',1);
INSERT INTO "baroque_product_image" VALUES (2,'uploads/products/details/22/02_2_600x_crop_center.jpg',1);
INSERT INTO "baroque_product_image" VALUES (3,'uploads/products/details/22/03_1_600x_crop_center.jpg',1);
INSERT INTO "baroque_product_image" VALUES (4,'uploads/products/details/22/04_1_600x_crop_center.jpg',1);
INSERT INTO "baroque_product_image" VALUES (5,'uploads/products/details/22/05_ded27aba-9a6c-4f5f-a52e-e8320deaba57_600x_crop_center.jpg',1);
INSERT INTO "baroque_product_image" VALUES (6,'uploads/products/details/22/06_25487664-3005-4b49-910e-1661d7bf09b7_600x_crop_center.jpg',1);
INSERT INTO "baroque_product_image" VALUES (7,'uploads/products/details/22/07_1acbe95c-88ad-4217-9811-ecc760618ed3_600x_crop_center.jpg',1);
INSERT INTO "baroque_product_image" VALUES (8,'uploads/products/details/22/C6_95ffb827-987e-406e-b03f-b5528ac1b229_600x_crop_center.jpg',2);
INSERT INTO "baroque_product_image" VALUES (9,'uploads/products/details/22/C8_4cb4383d-4f46-4f67-afcc-26ea12ff1350_600x_crop_center.jpg',2);
INSERT INTO "baroque_product_image" VALUES (10,'uploads/products/details/22/C5_82f70fce-636a-44f1-aa8c-cc3b2cc4d3e0_600x_crop_center.jpg',2);
INSERT INTO "baroque_product_image" VALUES (11,'uploads/products/details/22/C7_8e42ed7d-5a1f-4dba-8a6e-dad9b6e1ee6f_600x_crop_center.jpg',2);
INSERT INTO "baroque_product_image" VALUES (12,'uploads/products/details/22/PS1_1_600x_crop_center.jpg',3);
INSERT INTO "baroque_product_image" VALUES (13,'uploads/products/details/22/PS2_600x_crop_center.jpg',3);
INSERT INTO "baroque_product_image" VALUES (14,'uploads/products/details/22/PS4_600x_crop_center.jpg',3);
INSERT INTO "baroque_product_image" VALUES (15,'uploads/products/details/22/PS5_600x_crop_center.jpg',3);
INSERT INTO "baroque_product_image" VALUES (16,'uploads/products/details/22/PS6_600x_crop_center.jpg',3);
INSERT INTO "baroque_product_image" VALUES (17,'uploads/products/details/22/30_ce436077-a091-43df-8300-6467558cb2f1_600x_crop_center.jpg',4);
INSERT INTO "baroque_product_image" VALUES (18,'uploads/products/details/22/28_962ec064-bc39-41c3-9e87-a0ce89c48204_600x_crop_center.jpg',4);
INSERT INTO "baroque_product_image" VALUES (19,'uploads/products/details/22/32_889ebb19-5456-4610-b749-b8b3d291502d_600x_crop_center.jpg',4);
INSERT INTO "baroque_product_image" VALUES (20,'uploads/products/details/22/33_de328da7-e3d5-4c2e-847a-f6206242637d_600x_crop_center.jpg',4);
INSERT INTO "baroque_product_image" VALUES (21,'uploads/products/details/22/36_0ba09608-2b96-4591-90f5-4d16673df546_600x_crop_center.jpg',5);
INSERT INTO "baroque_product_image" VALUES (22,'uploads/products/details/22/37_d925545f-7682-4bd4-aa8e-d6725fd2fa0e_600x_crop_center.jpg',5);
INSERT INTO "baroque_product_image" VALUES (23,'uploads/products/details/22/38_8e888d99-d4b7-4c23-b8a3-40983f1345d4_600x_crop_center.jpg',5);
INSERT INTO "baroque_product_image" VALUES (27,'uploads/products/details/22/C6_600x_crop_center.jpg',6);
INSERT INTO "baroque_product_image" VALUES (28,'uploads/products/details/22/Untitled-36_600x_crop_center.jpg',6);
INSERT INTO "baroque_product_image" VALUES (29,'uploads/products/details/22/C5_600x_crop_center.jpg',6);
INSERT INTO "baroque_product_image" VALUES (30,'uploads/products/details/22/Untitled-37_600x_crop_center.jpg',6);
INSERT INTO "baroque_product_image" VALUES (31,'uploads/products/details/22/1Q0A0015_600x_crop_center.jpg',7);
INSERT INTO "baroque_product_image" VALUES (32,'uploads/products/details/22/1Q0A0103_600x_crop_center.jpg',7);
INSERT INTO "baroque_product_image" VALUES (33,'uploads/products/details/22/1Q0A0030_600x_crop_center.jpg',7);
INSERT INTO "baroque_product_image" VALUES (34,'uploads/products/details/22/1Q0A0048_600x_crop_center.jpg',7);
INSERT INTO "baroque_product_image" VALUES (35,'uploads/products/details/22/1Q0A0067_600x_crop_center.jpg',7);
INSERT INTO "baroque_product_image" VALUES (36,'uploads/products/details/22/FL1_600x_crop_center.jpg',8);
INSERT INTO "baroque_product_image" VALUES (37,'uploads/products/details/22/FL2_600x_crop_center.jpg',8);
INSERT INTO "baroque_product_image" VALUES (38,'uploads/products/details/22/FL5_600x_crop_center.jpg',8);
INSERT INTO "baroque_product_image" VALUES (39,'uploads/products/details/22/FL5_600x_crop_center_pO1446n.jpg',8);
INSERT INTO "baroque_product_image" VALUES (40,'uploads/products/details/22/Pearl_luster_3_600x_crop_center.jpg',9);
INSERT INTO "baroque_product_image" VALUES (41,'uploads/products/details/22/Pearl_luster_2_600x_crop_center.jpg',9);
INSERT INTO "baroque_product_image" VALUES (42,'uploads/products/details/22/Pearl_luster_1_600x_crop_center.jpg',9);
INSERT INTO "baroque_product_image" VALUES (43,'uploads/products/details/22/51_6d75a945-988b-401b-ade1-e5c1b4ec9e47_600x_crop_center.jpg',10);
INSERT INTO "baroque_product_image" VALUES (44,'uploads/products/details/22/50_e8913db3-7434-4d04-98b3-c44795650b9a_600x_crop_center.jpg',10);
INSERT INTO "baroque_product_image" VALUES (45,'uploads/products/details/22/52_00152315-0929-42a1-84ff-69fe5bd59b88_600x_crop_center_ZJv6hUi.jpg',10);
INSERT INTO "baroque_product_image" VALUES (46,'uploads/products/details/22/53_0e1d8ed6-05b7-44bc-934a-bcd01d17b718_600x_crop_center_3UtS8PY.jpg',10);
INSERT INTO "baroque_product_image" VALUES (47,'uploads/products/details/22/41_6c05f602-1c5d-4840-b5b9-85ac295e4211_600x_crop_center.jpg',11);
INSERT INTO "baroque_product_image" VALUES (48,'uploads/products/details/22/42_c447910a-dbb7-4ce5-814e-3116a5d5374c_600x_crop_center.jpg',11);
INSERT INTO "baroque_product_image" VALUES (49,'uploads/products/details/22/44_d2f226f1-5eb3-4b84-a5b0-f36e54a5a6fe_600x_crop_center.jpg',11);
INSERT INTO "baroque_product_image" VALUES (50,'uploads/products/details/22/45_8e2f65ee-f0df-4ab3-929d-127983268a84_600x_crop_center.jpg',11);
INSERT INTO "baroque_product_image" VALUES (51,'uploads/products/details/22/SH3_3485a587-23c3-4191-b973-90fdf57388f3_600x_crop_center.jpg',12);
INSERT INTO "baroque_product_image" VALUES (52,'uploads/products/details/22/SH4_600x_crop_center.jpg',12);
INSERT INTO "baroque_product_image" VALUES (53,'uploads/products/details/22/SH1_1_600x_crop_center.jpg',12);
INSERT INTO "baroque_product_image" VALUES (54,'uploads/products/details/22/SH2_7260660b-5365-42dd-9c48-584ee7ad350f_600x_crop_center.jpg',12);
INSERT INTO "baroque_product_image" VALUES (55,'uploads/products/details/22/SH5_600x_crop_center.jpg',12);
INSERT INTO "baroque_product_image" VALUES (56,'uploads/products/details/22/22_9_600x_crop_center.jpg',14);
INSERT INTO "baroque_product_image" VALUES (57,'uploads/products/details/22/23_7_600x_crop_center.jpg',14);
INSERT INTO "baroque_product_image" VALUES (58,'uploads/products/details/22/24_8_600x_crop_center.jpg',14);
INSERT INTO "baroque_product_image" VALUES (59,'uploads/products/details/22/25_6_600x_crop_center.jpg',14);
INSERT INTO "baroque_product_image" VALUES (60,'uploads/products/details/22/8_22_600x_crop_center.jpg',15);
INSERT INTO "baroque_product_image" VALUES (61,'uploads/products/details/22/9_20_600x_crop_center2.jpg',15);
INSERT INTO "baroque_product_image" VALUES (62,'uploads/products/details/22/9_1_1d5d80b3-c04a-43fc-bac6-6036cbac8457_600x_crop_center.jpg',15);
INSERT INTO "baroque_product_image" VALUES (63,'uploads/products/details/22/10_1_3c2ca455-d3af-4930-9b17-55545160be88_600x_crop_center.jpg',15);
INSERT INTO "baroque_product_image" VALUES (64,'uploads/products/details/22/01_eb64c6e0-650c-4d20-b894-0acff3d09b6b_600x_crop_center.jpg',13);
INSERT INTO "baroque_product_image" VALUES (65,'uploads/products/details/22/03_585f6b41-33e4-4d0f-9279-14c70767627f_600x_crop_center.jpg',13);
INSERT INTO "baroque_product_image" VALUES (66,'uploads/products/details/22/02_04e4d73d-ba98-421b-a37d-cbbf7b9c2fb1_600x_crop_center.jpg',13);
INSERT INTO "baroque_order" VALUES (1,'Mushraf sharif','Muhmmad sharif','mushraf256@gmail.com','03028976771',1,'4560','Pakistan','Ellahabad','kot smeet khan akikay rasool pur','2022-09-06 17:36:01.327490',1);
INSERT INTO "baroque_order" VALUES (2,'king','khan','a@a.com','03040889767',2,'4560','Pakistan','chunian','bhrwall','2022-09-06 17:36:01.327490',1);
INSERT INTO "baroque_order" VALUES (3,'king','khan','a@a.com','03040889767',3,'3000','Pakistan','chunian','bhrwall','2022-09-06 17:36:01.327490',9);
INSERT INTO "baroque_order" VALUES (4,'king','khan','a@a.com','03040889767',2,'2100','Pakistan','chunian','bhrwall','2022-09-06 17:36:01.327490',15);
INSERT INTO "baroque_order" VALUES (5,'Yousaf','khan','mushraf256@gmail.com','03028976771',2,'3800','Pakistan','Ellahabad','Lahore','2022-09-07 12:22:50.575479',6);
INSERT INTO "baroque_order" VALUES (6,'Yousaf','khan','mushraf256@gmail.com','03028976771',2,'3000','Pakistan','Ellahabad','Lahore','2022-09-07 12:22:50.575479',9);
INSERT INTO "baroque_order" VALUES (7,'Mushraf sharif','Muhmmad sharif','mushraf256@gmail.com','03028976771',1,'3000','Pakistan','Ellahabad','smeet khan akikay','2022-09-07 12:22:50.575479',9);
INSERT INTO "baroque_order" VALUES (8,'Mushraf sharif','Muhmmad sharif','mushraf256@gmail.com','03028976771',1,'2300','Pakistan','Ellahabad','smeet khan akikay','2022-09-07 12:22:50.575479',10);
INSERT INTO "baroque_order" VALUES (9,'Mushraf sharif','Muhmmad sharif','mushraf256@gmail.com','03028976771',1,'2900','Pakistan','Ellahabad','smeet khan akikay','2022-09-07 12:22:50.575479',12);
INSERT INTO "baroque_order" VALUES (10,'Mushraf sharif','Muhmmad sharif','mushraf256@gmail.com','03028976771',1,'2300','Pakistan','Ellahabad','smeet khan akikay','2022-09-07 12:22:50.575479',14);
INSERT INTO "baroque_order" VALUES (11,'Mushraf sharif','Mushraf Sharif','mushraf256@gmail.com','03040889767',1,'4800','Pakistan','Ellahabad','0','2022-09-07 12:22:50.575479',2);
INSERT INTO "baroque_order" VALUES (12,'Mushraf sharif','Mushraf Sharif','mushraf256@gmail.com','03040889767',2,'2900','Pakistan','Ellahabad','0','2022-09-07 12:22:50.575479',12);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "baroque_product_category_id_27d79093" ON "baroque_product" (
	"category_id"
);
CREATE INDEX IF NOT EXISTS "baroque_product_image_Product_images_id_d569c7f7" ON "baroque_product_image" (
	"Product_images_id"
);
CREATE INDEX IF NOT EXISTS "baroque_placedoreders_product_name_id_329bc4a1" ON "baroque_placedoreders" (
	"product_name_id"
);
CREATE INDEX IF NOT EXISTS "baroque_order_product_id_40c2e613" ON "baroque_order" (
	"product_id"
);
COMMIT;
