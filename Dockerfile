FROM alpine:3.6

ENV GCLOUD_SDK 175.0.0

ENV PATH /google-cloud-sdk/bin:$PATH
ENV GOOGLE_APPLICATION_CREDENTIALS /secret.json

COPY run.sh /usr/bin/

RUN set -ex ; \
  chmod +x /usr/bin/run.sh; \
  apk --no-cache add python; \
  apk --no-cache --virtual .setup-dependencies add ca-certificates wget; \
  wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-$GCLOUD_SDK-linux-x86_64.tar.gz; \
  tar xzf google-cloud-sdk-$GCLOUD_SDK-linux-x86_64.tar.gz; \
  gcloud --quiet components update kubectl;

ENTRYPOINT [ "/usr/bin/run.sh" ]