#!/bin/sh

set -ex
gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS
gcloud config set project $GCLOUD_PROJECT
gcloud container clusters get-credentials $GKE_CLUSTER --zone $ZONE --project $GCLOUD_PROJECT