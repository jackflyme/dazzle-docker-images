ARG base


FROM localhost:5000/android-cimg:cmdline AS cmdline
USER root

ARG NDK_VERSION

# Install Android SDK Tools
RUN bash -c ". ${HOME}/.sdkman/bin/sdkman-init.sh  && \
    echo y | sdkmanager \"ndk;${NDK_VERSION}\""

FROM ${base} AS android
USER root
ENV TRIGGER_REBUILD=6

ENV ANDROID_HOME "${HOME}/.android-sdk"
COPY --from=cmdline ${ANDROID_HOME}/ndk ${ANDROID_HOME}/ndk
