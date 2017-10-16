#!/bin/sh

set -ex

if [[ $GCLOUD_SERVICE_KEY_BASE64 ]]; then
  echo $GCLOUD_SERVICE_KEY_BASE64 | base64 -d > $GOOGLE_APPLICATION_CREDENTIALS
fi

gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS

gcloud config set project $GCLOUD_PROJECT
gcloud container clusters get-credentials $GKE_CLUSTER --zone $ZONE --project $GCLOUD_PROJECT