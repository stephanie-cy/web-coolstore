##########################
#    Deploy web-nodejs   #
##########################

PROJECT_NAME=$1

oc project ${PROJECT_NAME}
oc delete service web-coolstore 
oc delete route web-coolstore
oc delete buildconfig web-coolstore
oc delete deploymentconfig web-coolstore

oc new-app nodejs~https://github.com/yangcao77/cloud-native-workshop \
        --context-dir=labs/web-nodejs \
        --name=web-coolstore \
        --labels=app=coolstore,app.kubernetes.io/instance=web,app.kubernetes.io/part-of=coolstore,app.kubernetes.io/name=nodejs

oc expose svc/web-coolstore