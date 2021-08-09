##########################
#    Deploy web-nodejs   #
##########################

DIRECTORY=`dirname $0`
PROJECT_NAME=$1

cd ${DIRECTORY}

odo project set ${PROJECT_NAME} &> /dev/null

DESCRIBE_COMPONENT=`odo component describe web`

if [[ $DESCRIBE_COMPONENT != *"web-nodejs"* ]]; then
    # not an odo component
    odo create web --app coolstore
fi

# unset namespace if exist in devfile
odo config unset --env OPENSHIFT_BUILD_NAMESPACE &> /dev/null

# set namespace name in an env for webpage be able to access gateway
odo config set --env OPENSHIFT_BUILD_NAMESPACE=${PROJECT_NAME}

odo config set --env URL_PREFIX="gateway-coolstore-"


odo push

echo "Web Node.js Deployed"
