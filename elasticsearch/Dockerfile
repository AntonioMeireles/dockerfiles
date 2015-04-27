FROM progrium/busybox
MAINTAINER António Meireles <antonio.meireles@reformi.st>

ENV ES_VERSION 1.5.2
ENV ES_URL https://download.elasticsearch.org/elasticsearch/elasticsearch

ENV KP_VERSION 1.1.1
ENV KP_URL io.fabric8/elasticsearch-cloud-kubernetes

ENV ES_HOME /elasticsearch

ENV JRE_MAJOR 8
ENV JRE_MINOR 45
ENV JRE_VERSION ${JRE_MAJOR}u${JRE_MINOR}
ENV JRE_BUILD b14
ENV JAVA_HOME /opt/jre1.${JRE_MAJOR}.0_${JRE_MINOR}
ENV JRE_URL http://download.oracle.com/otn-pub/java/jdk/$JRE_VERSION-$JRE_BUILD/jre-$JRE_VERSION-linux-x64.tar.gz

EXPOSE 9200 9300

# before someone asks: the big java trimming bellow was inspired in the java-1.8.0-openjdk-headless pkg from fedora.
RUN ( opkg-install curl grep bash coreutils diffutils procps ca-certificates && \
      curl -Lskj -b "oraclelicense=accept-securebackup-cookie" $JRE_URL | \
      gunzip -c - | tar xf - ) && \
    mv jre1.${JRE_MAJOR}.0_${JRE_MINOR} /opt/ && \
    ( curl -Lskj ${ES_URL}/elasticsearch-${ES_VERSION}.tar.gz | gunzip -c - | tar xf - ) && \
    mv elasticsearch-${ES_VERSION} ${ES_HOME} && \
    bash -c 'rm -rf ${JAVA_HOME}/{lib/{desktop,locale,{,oblique-}fonts,deploy,fontconfig.*},plugin,man/} && \
             rm -rf ${JAVA_HOME}/lib/amd64/lib{javafx,avplugin,prism,awt,jfx}* && \
             rm -rf ${JAVA_HOME}/lib/{deploy,ext/jfxrt,javaws,jfr,jfxswt,plugin}.jar && \
             rm -rf ${JAVA_HOME}/bin/{javaws,jcontrol} && \
             rm -rf ${JAVA_HOME}/lib/jfr && \
             rm -rf ${JAVA_HOME}/lib/amd64/lib{bci,dcpr,decora_sse,deploy,fxplugins,glass,gstreamer-lite,jawt,jfr,jpeg,jsoundalsa,kcms,lcms,npjp2,resource,splashscreen,sunec,t2k}.so && \
             rm -rf $(find ${ES_HOME} | grep -E "(\.(exe|bat)$|sigar/.*(dll|winnt|x86-linux|solaris|ia64|freebsd|macosx))")'

RUN ${ES_HOME}/bin/plugin --install ${KP_URL}/${KP_VERSION} --verbose

ADD boot.sh /bin/boot
RUN chmod u+x /bin/boot

ADD elasticsearch.default.yml ${ES_HOME}/config/elasticsearch.yml

VOLUME ["/data"]

WORKDIR /data

ENTRYPOINT ["/bin/boot"]
