##############################
# Deploy catalog-spring-boot #
##############################

DIRECTORY=`dirname $0`
PROJECT_NAME=$1

cd ${DIRECTORY}

odo project set ${PROJECT_NAME}
odo delete --force &> /dev/null
rm -rf .odo/ &> /dev/null

PODS="catalog-coolstore"
while [[ $PODS == *"catalog-coolstore"* ]]
do
  PODS=`oc get pod -n ${PROJECT_NAME} `
  sleep 1
done

odo create catalog --app coolstore
odo push

echo "Catalog Spring-Boot Deployed"

cd -