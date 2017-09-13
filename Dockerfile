#FROM jboss/keycloak:3.2.1.Final
#ADD changeDatabase.xsl /opt/jboss/keycloak/
#RUN java -jar /usr/share/java/saxon.jar -s:/opt/jboss/keycloak/standalone/configuration/standalone.xml -xsl:/opt/jboss/keycloak/changeDatabase.xsl -o:/opt/jboss/keycloak/standalone/configuration/standalone.xml; java -jar /usr/share/java/saxon.jar -s:/opt/jboss/keycloak/standalone/configuration/standalone-ha.xml -xsl:/opt/jboss/keycloak/changeDatabase.xsl -o:/opt/jboss/keycloak/standalone/configuration/standalone-ha.xml; rm /opt/jboss/keycloak/changeDatabase.xsl
#RUN mkdir -p /opt/jboss/keycloak/modules/system/layers/base/com/mysql/jdbc/main; cd /opt/jboss/keycloak/modules/system/layers/base/com/mysql/jdbc/main && curl -O http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.18/mysql-connector-java-5.1.18.jar
#ADD module.xml /opt/jboss/keycloak/modules/system/layers/base/com/mysql/jdbc/main/


#FROM jboss/keycloak-mysql:3.2.1.Final@sha256:8360d917402dcd2d69523ffb2d6fec11ee732fd932e214e685024d0ad68c4f19
FROM jboss/keycloak-mysql:latest

USER jboss

RUN rm keycloak/standalone/configuration/standalone.xml
COPY standalone-ha.xml keycloak/standalone/configuration/standalone-ha.xml
COPY docker-entrypoint.sh /opt/jboss/docker-entrypoint.sh


ENTRYPOINT [ "/opt/jboss/docker-entrypoint.sh" ]
CMD ["-b", "0.0.0.0", "--server-config", "standalone-ha.xml"]

#ADD xsl-transform.sh /usr/local/bin/xsl-transform
#ADD *.xsl /tmp/
#
#RUN xsl-transform /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml /tmp/jgroups-jdbc.xsl \
#  && xsl-transform /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml /tmp/node-identifier.xsl
