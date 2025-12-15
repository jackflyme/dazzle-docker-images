ARG base


FROM localhost:5000/android-cimg:cmdline AS cmdline
USER root

ARG SDK_VERSION
ENV ANDROID_HOME "${HOME}/.android-sdk"

# Install Android SDK Tools
RUN yes | sdkmanager "platforms;android-${SDK_VERSION}" && \
    BUILD_TOOLS_PACKAGES=$(sdkmanager --list | grep "build-tools;${SDK_VERSION}\." | awk '{print $1}' | tr '\n' ' ') && \
    yes | sdkmanager $BUILD_TOOLS_PACKAGES && \
    mkdir -p ${ANDROID_HOME}/tool-packages && \
    mv ${ANDROID_HOME}/build-tools ${ANDROID_HOME}/tool-packages/ && \
    mv ${ANDROID_HOME}/platforms ${ANDROID_HOME}/tool-packages/


FROM ${base} AS android
USER root
# Dazzle does not rebuild a layer until one of its lines are changed. Increase this counter to rebuild this layer.
ENV TRIGGER_REBUILD=2

ENV ANDROID_HOME "${HOME}/.android-sdk"
COPY --from=cmdline ${ANDROID_HOME}/tool-packages/ ${ANDROID_HOME}/