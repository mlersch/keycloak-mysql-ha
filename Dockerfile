FROM jboss/keycloak-mysql:3.3.0.CR2

USER root
RUN yum install -y telnet && yum clean all

USER jboss

COPY standalone-ha.xml /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml
COPY jgroups-module.xml /opt/jboss/keycloak/modules/system/layers/base/org/jgroups/main/module.xml
COPY docker-entrypoint.sh /opt/jboss/docker-entrypoint.sh



ENTRYPOINT [ "/opt/jboss/docker-entrypoint.sh" ]
CMD ["-b", "0.0.0.0", "--server-config", "standalone-ha.xml"]
