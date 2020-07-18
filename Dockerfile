FROM alpine/helm:3.2.4
RUN helm plugin install https://github.com/zendesk/helm-secrets
