# !/bin/bash
set -e
echo "Deploying to ${DEPLOYMENT_ENVIRONMENT}"
export CLOUDSDK_CORE_DISABLE_PROMPTS=1
echo $GCP_PROJECT_KEY > service_key.txt
base64 -i service_key.txt -d > ${HOME}/gcloud-service-key.json
cat ${HOME}/gcloud-service-key.json
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-461.0.0-linux-x86_64.tar.gz
tar -xf google-cloud-cli-461.0.0-linux-x86_64.tar.gz
./google-cloud-sdk/install.sh
cat /home/circleci/workspace/google-cloud-sdk/completion.bash.inc
source /home/circleci/workspace/google-cloud-sdk/completion.bash.inc
source /home/circleci/workspace/google-cloud-sdk/path.bash.inc


gcloud auth activate-service-account --key-file ${HOME}/gcloud-service-key.json

gcloud config set project $PROJECT_ID
gcloud --quiet config set container/cluster $CLUSTER_NAME
gcloud  config set compute/zone $CLOUDSDK_COMPUTE_ZONE
gcloud  --quiet container clusters get-credentials $CLUSTER_NAME
gcloud components install kubectl
gcloud components install gke-gcloud-auth-plugin
gcloud components list
docker build -t gcr.io/${PROJECT_ID}/${REG_ID}:$CIRCLE_SHA1 .
gcloud docker -- push gcr.io/${PROJECT_ID}/${REG_ID}:$CIRCLE_SHA1
kubectl set image deployment/${DEPLOYMENT_NAME} ${CONTAINER_NAME}=gcr.io/${PROJECT_ID}/${REG_ID}:$CIRCLE_SHA1
echo "Success fully deployed to ${DEPLOYMENT_ENVIRONMENT}"


