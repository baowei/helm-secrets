FROM alpine:3

# variable "VERSION" must be passed as docker environment variables during the image build
# docker build --no-cache --build-arg VERSION=3.2.4 -t cyberbtc/helm-secrets:3.2.4 .

ARG VERSION=3.4.2

# ENV BASE_URL="https://storage.googleapis.com/kubernetes-helm"
ENV BASE_URL="https://get.helm.sh"
ENV TAR_FILE="helm-v${VERSION}-linux-amd64.tar.gz"

RUN apk add --update --no-cache curl ca-certificates git bash py3-pip && \
    curl -L ${BASE_URL}/${TAR_FILE} |tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    pip install awscli && \
    rm -rf linux-amd64 && \
    rm -f /var/cache/apk/*

RUN helm plugin install https://github.com/zendesk/helm-secrets

RUN curl -L https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.8/2020-09-18/bin/linux/amd64/kubectl -o /usr/bin/kubectl \
    && chmod +x /usr/bin/kubectl

WORKDIR /apps

ENTRYPOINT ["helm"]
CMD ["--help"]
