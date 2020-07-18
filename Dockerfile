FROM alpine/helm:3.2.4

RUN apk add --update --no-cache git && \
    rm -f /var/cache/apk/*
    
RUN /bin/sh -c "helm plugin install https://github.com/futuresimple/helm-secrets"
