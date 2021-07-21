##############################
#  Deploy inventory-quarkus  #
##############################

# CONTEXT_FOLDER=/projects/workshop/inventory-quarkus
DIRECTORY=`dirname $0`
PROJECT_NAME=$1

cd ${DIRECTORY}

odo project set ${PROJECT_NAME}
odo delete --all --force &> /dev/null
odo create inventory --app coolstore
odo push

echo "Inventory Quarkus Deployed"