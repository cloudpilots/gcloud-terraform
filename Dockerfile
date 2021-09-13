FROM google/cloud-sdk:alpine

ARG TF_VERSION=0.14.4
ENV TF_VERSION=${TF_VERSION}

RUN \
  mkdir -p /usr/local/src && \
  cd /usr/local/src && \
  wget -q https://releases.hashicorp.com/terraform/$TF_VERSION/terraform_${TF_VERSION}_linux_amd64.zip -O tf.zip && \
  unzip tf.zip && \
  mv terraform /usr/local/bin && \
  chmod +x /usr/local/bin/terraform && \
  rm -rf tf.zip && \
  terraform version

CMD [ "/usr/local/bin/terraform" ]
