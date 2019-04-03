FROM alpine

RUN apk add --update --no-cache zip && \
  rm -rf /tmp/* /var/cache/apk/* && \
  adduser -D user && \
  passwd -u user