##########################
#    Deploy web-nodejs   #
##########################

DIRECTORY=`dirname $0`
PROJECT_NAME=$1

cd ${DIRECTORY}

odo project set ${PROJECT_NAME}

odo config unset --env OPENSHIFT_BUILD_NAMESPACE &> /dev/null
odo delete --force &> /dev/null
rm -rf .odo/ &> /dev/null

PODS="web-coolstore"
while [[ $PODS == *"web-coolstore"* ]]
do
  PODS=`oc get pod -n ${PROJECT_NAME} `
  sleep 1
done

odo create web --app coolstore
odo config set --env OPENSHIFT_BUILD_NAMESPACE=${PROJECT_NAME}

if [[ $DEVWORKSPACE_NAMESPACE == "che-che" ]]; then
    odo config set --env URL_PREFIX="gateway-gateway-"
else
    odo config set --env URL_PREFIX="gateway-coolstore-"
fi

odo push

echo "Web Node.js Deployed"

cd -