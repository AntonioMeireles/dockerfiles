FROM quay.io/devops/base
MAINTAINER António Meireles <antonio.meireles@reformi.st>

ENV JAVA_HOME /usr/lib/jvm/java-1.7-openjdk
ENV PATH ${JAVA_HOME}/bin:${PATH}
# - ca-certs hack from from https://github.com/denvazh/java
#   via gliderlabs/docker-alpine#11
RUN apk-install openjdk7-jre-base && \
    find /usr/share/ca-certificates/mozilla/ \
      -name *.crt \
      -exec keytool \
      -import \
      -trustcacerts \
      -keystore ${JAVA_HOME}/jre/lib/security/cacerts \
      -storepass changeit \
      -noprompt \
      -file {} \
      -alias {} \; && \
    keytool \
      -list \
      -keystore ${JAVA_HOME}/jre/lib/security/cacerts \
      --storepass changeit
