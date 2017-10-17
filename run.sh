#!/bin/sh

set -ex

if [[ ! $GCLOUD_PROJECT ]]; then
  echo "[ERROR] You need to set the GCLOUD_PROJECT environment variable for this script to work"
  exit 1
fi
if [[ ! $GKE_CLUSTER ]]; then
  echo "[ERROR] You need to set the GKE_CLUSTER environment variable for this script to work"
  exit 1
fi
if [[ ! $ZONE ]]; then
  echo "[ERROR] You need to set the ZONE environment variable for this script to work"
  exit 1
fi

if [[ ! -z $GCLOUD_SERVICE_KEY_BASE64 ]]; then
  echo $GCLOUD_SERVICE_KEY_BASE64 | base64 -d > $GOOGLE_APPLICATION_CREDENTIALS
fi

gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS

gcloud config set project $GCLOUD_PROJECT
gcloud container clusters get-credentials $GKE_CLUSTER --zone $ZONE --project $GCLOUD_PROJECT