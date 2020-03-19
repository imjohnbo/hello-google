#!/bin/sh

PROJECT=${1}

gcloud --project ${PROJECT} services enable \
    cloudfunctions.googleapis.com \
    deploymentmanager.googleapis.com \
    storage-component.googleapis.com \
    stackdriver.googleapis.com