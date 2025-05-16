ARG base


FROM localhost:5000/android-cimg:cmdline AS cmdline
USER root

ARG CMAKE_VERSION='"cmake;3.18.1" \
"cmake;3.22.1" \
"cmake;3.30.5" \
"cmake;3.31.6"'

# Install Android SDK Tools
RUN bash -c ". ${HOME}/.sdkman/bin/sdkman-init.sh  && \
    echo y | sdkmanager ${CMAKE_VERSION}"

FROM ${base} AS android
USER root

ENV TRIGGER_REBUILD=5

ENV ANDROID_HOME "${HOME}/.android-sdk"
COPY --from=cmdline ${ANDROID_HOME}/cmake ${ANDROID_HOME}/cmake
