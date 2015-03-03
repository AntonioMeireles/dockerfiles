FROM quay.io/devops/base:latest
MAINTAINER António Meireles <antonio.meireles@reformi.st>

ENV APP docker-registry
ENV VERSION 0.9.1
ENV TARBALL https://github.com/docker/${APP}/archive/${VERSION}.tar.gz

ENV DOCKER_REGISTRY_CONFIG /docker-registry/config/config_sample.yml
ENV SETTINGS_FLAVOR dev

EXPOSE 5000

RUN ( curl -Ls ${TARBALL} | tar xzf - ) && mv ${APP}-${VERSION} \
    ${APP} && cp ${APP}/config/boto.cfg /etc/boto.cfg

# get around py279 ssl breakage...
#   cf. https://github.com/gevent/gevent/issues/477 included
#   cf. https://github.com/shazow/urllib3/pull/526
#   cf. https://github.com/pypa/pip/issues/2395
RUN sed -i "s|requests==.*|requests==2.5.3|" /docker-registry/requirements/main.txt &&\
    sed -i "s|gevent==.*|gevent==1.1.0|" /docker-registry/requirements/main.txt &&\
    apk-install py-pip yaml yaml-dev swig python-dev gcc musl-dev \
                xz-libs xz-dev openssl-dev git curl patch make && \
    pip install cython && \
    pip install git+https://git@github.com/jaredhobbs/gevent.git@master#egg=gevent &&\
    pip install /${APP}/depends/docker-registry-core && \
    pip install pip --upgrade && pip install urllib3 --upgrade && \
    pip install file:///${APP}#egg=docker-registry[bugsnag,newrelic,cors] && \
    (for file in pip/_vendor/requests/packages/urllib3/util/ssl_.py \
        requests/packages/urllib3/util/ssl_.py urllib3/util/ssl_.py; do \
    sed -i "s|import ssl|import ssl\nimport sys|" /usr/lib/python2.7/site-packages/$file ; \
    sed -i "s|if HAS_SNI:|if HAS_SNI and sys.version_info >= (2, 7, 9):|" /usr/lib/python2.7/site-packages/$file ; \
    done; ) && apk del gcc python-dev musl-dev xz-dev openssl-dev swig git file yaml-dev patch make && \
    yes | pip uninstall cython && rm -rf /src/ /root/.cache && \
    find / | egrep "(/(tests|unittest)/|\.py(c|o)$)" | xargs rm -rf

ENTRYPOINT ["docker-registry"]
