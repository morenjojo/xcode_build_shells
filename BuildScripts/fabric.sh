#!/usr/bin/env bash

#脚本所在位置
BASE_PATH=$(cd "$(dirname "$0")"; pwd)

#工程所在位置
PROJECT_PATH=${BASE_PATH}"/.."

ipa_path_file="ipa_path.txt"

#要上传的ipa文件路径
IPA_PATH=$(cat ${ipa_path_file})

#Fabric api key
FABRIC_API_KEY="XXXXXXXXXXXX"

BUILD_SECRET="XXXXXXXXXXXX"


echo "===================upload ipa to crashlytics==================="
${PROJECT_PATH}/Crashlytics.framework/submit ${FABRIC_API_KEY} ${BUILD_SECRET} -ipaPath ${IPA_PATH}
