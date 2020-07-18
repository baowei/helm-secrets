FROM alpine/helm:3.2.4

RUN apt-get update -qq && apt-get install -y -qq --no-install-recommends \
    make git\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN helm plugin install https://github.com/zendesk/helm-secrets
