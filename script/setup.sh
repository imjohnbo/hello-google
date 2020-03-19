#!/bin/sh

# https://serverless.com/framework/docs/providers/google/guide/credentials/

PROJECT=MYPROJECTHERE

# Enable APIs
./api.sh "${PROJECT}"

# Create new service account and assign roles to it
./credentials.sh "${PROJECT}"