
yes | sdkmanager "platforms;android-${SDK_VERSION}" "platform-tools;android-${SDK_VERSION}"

BUILD_TOOLS_PACKAGES=$(sdkmanager --list | grep "build-tools;${SDK_VERSION}\." | awk '{print $1}' | tr '\n' ' ')
if [ -z "$BUILD_TOOLS_PACKAGES" ]; then
    echo "未找到 build-tools ${SDK_VERSION} 系列的任何版本。"
else
    echo "开始安装 Build Tools ${SDK_VERSION} 系列版本: $BUILD_TOOLS_PACKAGES"
    yes | sdkmanager $BUILD_TOOLS_PACKAGES
fi