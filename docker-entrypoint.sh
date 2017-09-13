#!/bin/bash

sleep 5
function join_by { local IFS="$1"; shift; echo "$*"; }
ARRAY=()
for INSTANCE in $KEYCLOAK_NODE_IP
do
        IP=$(curl -sb -H "Accept: application/json" "http://rancher-metadata/latest/containers/$INSTANCE/primary_ip")
        ARRAY+=("${IP}[7600]")
done
export KEYCLOAK_NODE_IPS=$(join_by ',' ${ARRAY[@]})


if [ $KEYCLOAK_USER ] && [ $KEYCLOAK_PASSWORD ]; then
    keycloak/bin/add-user-keycloak.sh --user $KEYCLOAK_USER --password $KEYCLOAK_PASSWORD
fi

exec /opt/jboss/keycloak/bin/standalone.sh $@
exit $?
