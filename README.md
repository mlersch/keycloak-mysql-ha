## Keycloack-mysql-ha

A Optimised version of Keycloak that run in a rancher setup with a mySQL DB.


docker run --rm \
    naqoda/mysql-client \
    mysql --host=35.197.241.60 --user=oxokcLi0p74t793x --password=fslgadfiowemruwomemdumruqou89874952948357597j9342745jznb79ouag3236gge5jdw342345fqs1iosu340 --database=keycloakX23io12iu5 \
    --execute='CREATE TABLE IF NOT EXISTS JGROUPSPING (
                                           own_addr VARCHAR(200) NOT NULL,
                                           cluster_name VARCHAR(200) NOT NULL,
                                           ping_data BLOB DEFAULT NULL,
                                           PRIMARY KEY (own_addr, cluster_name)
                                           );'


docker run --rm \
    naqoda/mysql-client \
    mysql --host=35.197.241.60 --user=oxokcLi0p74t793x --password=fslgadfiowemruwomemdumruqou89874952948357597j9342745jznb79ouag3236gge5jdw342345fqs1iosu340 --database=keycloakX23io12iu5 \
    --execute='UPDATE REALM SET SSL_REQUIRED="NONE" WHERE ID="master";'
