ARG base


FROM localhost:5000/android-cimg:cmdline AS cmdline
USER root

ARG SDK_VERSION

# Install Android SDK Tools
COPY install_packages.sh install_packages.sh
RUN bash -c ". ${HOME}/.sdkman/bin/sdkman-init.sh  && \
    echo y | . install_packages.sh"

FROM ${base} AS android
USER root
# Dazzle does not rebuild a layer until one of its lines are changed. Increase this counter to rebuild this layer.
ENV TRIGGER_REBUILD=2

ENV ANDROID_HOME "${HOME}/.android-sdk"
COPY --from=cmdline ${ANDROID_HOME}/build-tools ${ANDROID_HOME}/build-tools
COPY --from=cmdline ${ANDROID_HOME}/platforms ${ANDROID_HOME}/platforms