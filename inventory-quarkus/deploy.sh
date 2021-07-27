##############################
#  Deploy inventory-quarkus  #
##############################

# CONTEXT_FOLDER=/projects/workshop/inventory-quarkus
DIRECTORY=`dirname $0`
PROJECT_NAME=$1

cd ${DIRECTORY}

odo project set ${PROJECT_NAME}
odo delete --force &> /dev/null
rm -rf .odo/ &> /dev/null

PODS="inventory-coolstore"
while [[ $PODS == *"inventory-coolstore"* ]]
do
  PODS=`oc get pod -n ${PROJECT_NAME} `
  sleep 1
done

odo create inventory --app coolstore
odo push

echo "Inventory Quarkus Deployed"

cd ..