##########################
#  Deploy gateway-vertx  #
##########################

DIRECTORY=`dirname $0`
PROJECT_NAME=$1
OPERATORS=$(oc get subscription -n openshift-operators)

cd ${DIRECTORY}


odo project set ${PROJECT_NAME}

if [[ $OPERATORS == *"rh-service-binding-operator"* ]]; then
    odo unlink catalog &> /dev/null
    odo unlink inventory &> /dev/null
else
    odo config unset --env CATALOG_COOLSTORE_SERVICE_HOST --env CATALOG_COOLSTORE_SERVICE_PORT &> /dev/null
    odo config unset --env INVENTORY_COOLSTORE_SERVICE_HOST --env INVENTORY_COOLSTORE_SERVICE_PORT &> /dev/null
fi
odo delete --force &> /dev/null
rm -rf .odo/ &> /dev/null

PODS="gateway-coolstore"
while [[ $PODS == *"gateway-coolstore"* ]]
do
  PODS=`oc get pod -n ${PROJECT_NAME} `
  sleep 1
done

odo create gateway --app coolstore

if [[ $OPERATORS == *"rh-service-binding-operator"* ]]; then
    odo push
    odo link inventory
    odo link catalog
    odo push
else
    CATALOG_HOST=$(oc get svc catalog-coolstore -o jsonpath={.spec.clusterIP})
    CATALOG_PORT=$(oc get svc catalog-coolstore -o jsonpath={.spec.ports[].port})
    INVENTORY_HOST=$(oc get svc inventory-coolstore -o jsonpath={.spec.clusterIP})
    INVENTORY_PORT=$(oc get svc inventory-coolstore -o jsonpath={.spec.ports[].port})

    odo config set --env CATALOG_COOLSTORE_SERVICE_HOST=$CATALOG_HOST --env CATALOG_COOLSTORE_SERVICE_PORT=$CATALOG_PORT
    odo config set --env INVENTORY_COOLSTORE_SERVICE_HOST=$INVENTORY_HOST --env INVENTORY_COOLSTORE_SERVICE_PORT=$INVENTORY_PORT
    
    odo push
fi

echo "Gateway Vertx Deployed"

cd ..