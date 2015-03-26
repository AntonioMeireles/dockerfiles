FROM quay.io/devops/jre
MAINTAINER António Meireles <antonio.meireles@reformi.st>

ENV ES_VERSION 1.5.0
ENV ES_URL https://download.elasticsearch.org/elasticsearch/elasticsearch

ENV KP_VERSION 1.1.0
ENV KP_URL io.fabric8/elasticsearch-cloud-kubernetes

ENV ES_HOME /elasticsearch

EXPOSE 9200 9300

RUN ( curl -Ls ${ES_URL}/elasticsearch-${ES_VERSION}.tar.gz | tar xzf - ) && \
     mv elasticsearch-${ES_VERSION} ${ES_HOME} && \
     rm -rf $(find ${ES_HOME} | egrep \
       "(\.(exe|bat)$|sigar/.*(dll|winnt|x86-linux|solaris|ia64|freebsd|macosx))")

RUN ${ES_HOME}/bin/plugin --install ${KP_URL}/${KP_VERSION} --verbose

ADD boot.sh /bin/boot
RUN chmod u+x /bin/boot

ADD elasticsearch.default.yml ${ES_HOME}/config/elasticsearch.yml

VOLUME ["/data"]

WORKDIR /data

ENTRYPOINT ["/bin/boot"]
