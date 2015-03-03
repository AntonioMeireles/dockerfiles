*work in progress*

###### basics
- **quay.io/devops/base**  
    [![Docker Repository on Quay.io]
    (https://quay.io/repository/devops/base/status "Docker Repository on
    Quay.io")](https://quay.io/repository/devops/base)
      - slim, but not _too_ slim, base container.
        - unless noted otherwise all containers bellow are based on top of this
        one.
- **quay.io/devops/jre**  
    [![Docker Repository on Quay.io]
    (https://quay.io/repository/devops/jre/status "Docker Repository on
    Quay.io")](https://quay.io/repository/devops/jre)
    - slim, but not _too_ slim, base container for java based workloads.
        + java7 based for now.
- **quay.io/devops/docker-registry**  
    [![Docker Repository on Quay.io]
    (https://quay.io/repository/devops/docker-registry/status
    "Docker Repository on Quay.io")]
    (https://quay.io/repository/devops/docker-registry)
    - lightweight [docker-registry](https://github.com/docker/docker-registry) container.
        + **59 MB** *vs* the 424 MB size of the *upstream* official one.

###### elasticsearch
- **quay.io/devops/elasticsearch**  
        [![Docker Repository on Quay.io]
        (https://quay.io/repository/devops/elasticsearch/status "Docker
        Repository on Quay.io")]
        (https://quay.io/repository/devops/elasticsearch)
    - lightweight, kubernetes aware, elasticsearch *base* container.
        + *just* **170 MB**...
- **quay.io/devops/elasticsearch-master**  
        [![Docker Repository on Quay.io]
        (https://quay.io/repository/devops/elasticsearch-master/status
        "Docker Repository on Quay.io")]
        (https://quay.io/repository/devops/elasticsearch-master)
    - lightweight, kubernetes aware, elasticsearch "master" container.
        - intended for cluster management roles. has no data, nor HTTP API.
- **quay.io/devops/elasticsearch-data**  
         [![Docker Repository on Quay.io]
        (https://quay.io/repository/devops/elasticsearch-data/status
        "Docker Repository on Quay.io")]
        (https://quay.io/repository/devops/elasticsearch-data)
    - lightweight, kubernetes aware, elasticsearch "data" container.
        - intended for storing and indexing data, has no HTTP API.
- **quay.io/devops/elasticsearch-fe**  
        [![Docker Repository on Quay.io]
        (https://quay.io/repository/devops/elasticsearch-fe/status
        "Docker Repository on Quay.io")]
        (https://quay.io/repository/devops/elasticsearch-fe)
    - lightweight, kubernetes aware, elasticsearch "front-end" container.
        - intended for front-end/load-balancing usage, stores no data, with
        HTTP API.

## Licensing
this work is **[open source](http://opensource.org/osd)** and is released under
the **[Apache License, Version 2.0](http://opensource.org/licenses/Apache-2.0)**.
