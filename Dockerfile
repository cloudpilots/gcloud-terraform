FROM google/cloud-sdk:slim

ARG TF_VERSION=0.12.25
ENV TF_VERSION=${TF_VERSION}
# ENV DEBIAN_FRONTEND noninteractive

RUN \
  apt-get update && \
  apt-get -y install kubectl wget curl unzip && \
  rm -rf /var/lib/apt/lists/*

RUN \
  cd /usr/local/src && \
  wget -q https://releases.hashicorp.com/terraform/$TF_VERSION/terraform_${TF_VERSION}_linux_amd64.zip -O tf.zip && \
  unzip tf.zip && \
  mv terraform /usr/local/bin && \
  chmod +x /usr/local/bin/terraform && \
  rm -rf tf.zip && \
  terraform version

ENTRYPOINT [ "/usr/local/bin/terraform" ]
