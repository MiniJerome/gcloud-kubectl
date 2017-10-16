# GCLOUD-KUBECTL Docker image

This image contains gcloud sdk with kubectl installed.

## How to use this image

### Create a service-account and API key
To create and download a Service Account you can visit https://console.developers.google.com/, and then on the left-hand menu click ‘API & Services’, then ‘Credentials’, then ‘New credentials’, then select ‘Service account key’. Create a new service account, give it a name, make sure it’s in the JSON format, then click ‘Create’. This will download the Service Account JSON file.

### Secret management
Encode the service account JSON file as base64 with:
```
base64 <your-service-account.json>
```
then pass it as `GCLOUD_SERVICE_KEY_BASE64` env variable.

Or, if you prefer to work with volumes or copy mount this file as `/secret.json` in the container.

### Configure the container

- GCLOUD_SDK: version of gcloud sdk like `175.0.0`
- GCLOUD_PROJECT: gcloud project name
- GKE_CLUSTER: google container engine cluster id.
- ZONE: gcloud zone, e.g. `europe-west1-b`
- GCLOUD_SERVICE_KEY_BASE64: base64 encoded secret.json file