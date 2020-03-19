#!/bin/sh

PROJECT=${1}

# https://cloud.google.com/endpoints/docs/openapi/enable-api
EMAIL=$(gcloud iam service-accounts create ${PROJECT}-${RANDOM} \
    --description "Hello, Google!" \
    --display-name "Hello Google" \
    --format="value(email)")

# https://cloud.google.com/iam/docs/granting-roles-to-service-accounts
# https://cloud.google.com/iam/docs/understanding-roles#predefined_roles
declare -a ROLES=("roles/cloudfunctions.developer" 
    "roles/deploymentmanager.editor"
    "roles/storage.admin"
    "roles/logging.admin")

for ROLE in "${ROLES[@]}"
do
    gcloud projects add-iam-policy-binding ${PROJECT} \
    --member serviceAccount:${EMAIL} \
    --role ${ROLE}
done
