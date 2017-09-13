FROM jboss/keycloak-mysql:3.1.0.Final

USER jboss

RUN rm /opt/jboss/keycloak/standalone/configuration/standalone.xml
COPY standalone-ha.xml /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml
COPY docker-entrypoint.sh /opt/jboss/docker-entrypoint.sh

ENTRYPOINT [ "/opt/jboss/docker-entrypoint.sh" ]
CMD ["-b", "0.0.0.0", "--server-config", "standalone-ha.xml"]
