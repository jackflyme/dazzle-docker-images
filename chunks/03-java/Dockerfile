ARG base
FROM ${base}

ARG JAVA_VERSION

USER root

# Dazzle does not rebuild a layer until one of its lines are changed. Increase this counter to rebuild this layer.
ENV TRIGGER_REBUILD=3

RUN bash -c ". ${HOME}/.sdkman/bin/sdkman-init.sh \
             && sed -i 's/sdkman_selfupdate_enable=true/sdkman_selfupdate_enable=false/g' ${HOME}/.sdkman/etc/config \
             && sed -i 's/sdkman_selfupdate_feature=true/sdkman_selfupdate_feature=false/g' ${HOME}/.sdkman/etc/config \
             && sdk install java ${JAVA_VERSION} \
             && sdk default java ${JAVA_VERSION} \
             && sdk flush archives \
             && sdk flush temp"

ENV JAVA_HOME=${HOME}/.sdkman/candidates/java/current
ENV PATH="${JAVA_HOME}/bin:${PATH}"