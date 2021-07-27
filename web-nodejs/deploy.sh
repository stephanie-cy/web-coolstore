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

odo create web --app coolstore
odo config set --env OPENSHIFT_BUILD_NAMESPACE=${PROJECT_NAME}
odo push

echo "Web Node.js Deployed"

cd ..