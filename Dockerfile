FROM alpine/helm:3.2.4

RUN apk add --update --no-cache git && \
    rm -f /var/cache/apk/*
    
RUN helm init --client-only --home=/.helm \
&& helm plugin install https://github.com/futuresimple/helm-secrets --home=/.helm

WORKDIR /apps

ENTRYPOINT ["helm"]
CMD ["--help"]
