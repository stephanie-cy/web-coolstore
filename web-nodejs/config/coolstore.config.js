const { ContextExclusionPlugin } = require("webpack");

var config = {
    API_ENDPOINT: 'gateway-coolstore-' + process.env.OPENSHIFT_BUILD_NAMESPACE,
    // API_ENDPOINT: process.env.GATEWAY_COOLSTORE_SERVICE_HOST + ":" + process.env.GATEWAY_COOLSTORE_SERVICE_PORT,
    SECURE_API_ENDPOINT: 'secure-gateway-coolstore-' + process.env.SECURE_COOLSTORE_GW_SERVICE,
    SSO_ENABLED: process.env.SSO_URL ? true : false
};

if (process.env.COOLSTORE_GW_ENDPOINT != null) {
    config.API_ENDPOINT = process.env.COOLSTORE_GW_ENDPOINT;
} else if (process.env.COOLSTORE_GW_SERVICE != null) {
    config.API_ENDPOINT = process.env.COOLSTORE_GW_SERVICE + '-' + process.env.OPENSHIFT_BUILD_NAMESPACE;
}


if (process.env.SECURE_COOLSTORE_GW_ENDPOINT != null) {
    config.SECURE_API_ENDPOINT = process.env.SECURE_COOLSTORE_GW_ENDPOINT;
} else if (process.env.SECURE_COOLSTORE_GW_SERVICE != null) {
    config.SECURE_API_ENDPOINT = process.env.SECURE_COOLSTORE_GW_SERVICE + '-' + process.env.OPENSHIFT_BUILD_NAMESPACE;
}
// config.API_ENDPOINT = "172.30.54.91:8080"
// config.SECURE_API_ENDPOINT =  "172.30.54.91:8080"
module.exports = config;
