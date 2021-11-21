FROM alpine:edge

RUN apk --update --no-cache add nodejs npm python3 py3-pip jq curl bash git docker && \
	ln -sf /usr/bin/python3 /usr/bin/python

COPY --from=golang:alpine /usr/local/go/ /usr/local/go/
ENV PATH="/usr/local/go/bin:${PATH}"

RUN apk add openjdk17-jdk maven

RUN which java
ENV JAVA_HOME="/usr/lib/jvm/default-jvm"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
