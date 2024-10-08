###
### Copy createdb.sql.example to createdb.sql
### then uncomment then set database name and username to create you need databases
#
# example: .env MYSQL_USER=appuser and need db name is myshop_db
#
#    CREATE DATABASE IF NOT EXISTS `myshop_db` ;
#    GRANT ALL ON `myshop_db`.* TO 'appuser'@'%' ;
#
###
### this sql script is auto run when percona container start and $DATA_PATH_HOST/percona not exists.
###
### if your $DATA_PATH_HOST/percona is exists and you do not want to delete it, you can run by manual execution:
###
###     docker-compose exec percona bash
###     mysql -u root -p < /docker-entrypoint-initdb.d/createdb.sql
###

CREATE DATABASE IF NOT EXISTS `laravel` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `laravel`.* TO 'default'@'%' ;

CREATE DATABASE IF NOT EXISTS `symfony` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `symfony`.* TO 'default'@'%' ;

CREATE DATABASE IF NOT EXISTS `mbr` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `mbr`.* TO 'default'@'%' ;

CREATE DATABASE IF NOT EXISTS `mbr_s` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `mbr_s`.* TO 'default'@'%' ;

FLUSH PRIVILEGES ;