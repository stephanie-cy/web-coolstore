##########################
#  Deploy gateway-vertx  #
##########################

DIRECTORY=`dirname $0`
PROJECT_NAME=$1

cd ${DIRECTORY}

odo project set ${PROJECT_NAME}
odo delete --all --force
odo create gateway --app coolstore

CATALOG_HOST=$(oc get svc catalog-coolstore -o jsonpath={.spec.clusterIP})
CATALOG_PORT=$(oc get svc catalog-coolstore -o jsonpath={.spec.ports[].port})
INVENTORY_HOST=$(oc get svc inventory-coolstore -o jsonpath={.spec.clusterIP})
INVENTORY_PORT=$(oc get svc inventory-coolstore -o jsonpath={.spec.ports[].port})

odo config set --env COMPONENT_CATALOG_HOST=$CATALOG_HOST --env COMPONENT_CATALOG_PORT=$CATALOG_PORT
odo config set --env COMPONENT_INVENTORY_HOST=$INVENTORY_HOST--env COMPONENT_INVENTORY_PORT=$INVENTORY_PORT

odo push

echo "Gateway Vertx Deployed"