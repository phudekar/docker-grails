FROM pradiphudekar/oracle-java:7

MAINTAINER Pradip Hudekar <pradiphudekar@gmail.com>

ENV SDKMAN_DIR /usr/local/sdkman

ARG GRAILS_VERSION=2.2.1

RUN curl get.sdkman.io | bash

RUN set -x \
    && echo "sdkman_auto_answer=true" > $SDKMAN_DIR/etc/config \
    && echo "sdkman_auto_selfupdate=false" >> $SDKMAN_DIR/etc/config \
    && echo "sdkman_insecure_ssl=false" >> $SDKMAN_DIR/etc/config \
    && echo "sdkman_curl_connect_timeout=30" >> $SDKMAN_DIR/etc/config \
    && echo "sdkman_curl_max_time=60" >> $SDKMAN_DIR/etc/config

WORKDIR $SDKMAN_DIR

VOLUME ["/root/.gradle", "/root/.m2", "/data"]

RUN chmod -x bin/sdkman-init.sh

RUN echo "installing grails-$GRAILS_VERSION"

RUN /bin/bash -c "source bin/sdkman-init.sh && sdk install grails $GRAILS_VERSION"

ENV GRAILS_HOME /usr/local/sdkman/candidates/grails/current

ENV PATH $GRAILS_HOME/bin:$PATH
