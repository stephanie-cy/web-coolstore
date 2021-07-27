##############################
# Deploy catalog-spring-boot #
##############################

# CONTEXT_FOLDER=/projects/workshop/catalog-spring-boot
DIRECTORY=`dirname $0`
PROJECT_NAME=$1

cd ${DIRECTORY}

odo project set ${PROJECT_NAME}
odo delete --force &> /dev/null
rm -rf .odo/ &> /dev/null
odo create catalog --app coolstore
odo push

echo "Catalog Spring-Boot Deployed"

cd ..