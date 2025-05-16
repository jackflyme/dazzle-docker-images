ARG base
FROM ${base}

ARG GRADLE_VERSION

USER root

# Dazzle does not rebuild a layer until one of its lines are changed. Increase this counter to rebuild this layer.
ENV TRIGGER_REBUILD=4

RUN bash -c ". ${HOME}/.sdkman/bin/sdkman-init.sh \
             && sdk install gradle ${GRADLE_VERSION} \
             && sdk default gradle ${GRADLE_VERSION} \
             && sdk flush archives \
             && sdk flush temp"

ENV GRADLE_HOME=${HOME}/.sdkman/candidates/gradle/current
ENV PATH="${GRADLE_HOME}/bin:${PATH}"