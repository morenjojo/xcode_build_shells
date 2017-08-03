# 工程名
APP_NAME="XXXXXX"

#脚本所在位置  
BASE_PATH=$(cd "$(dirname "$0")"; pwd)

#工程所在位置
PROJECT_PATH=${BASE_PATH}"/.."
    
#导出位置  
PRODUCT_PATH=${PROJECT_PATH}"/Release-iphoneos"  

# info.plist路径
project_infoplist_path="${PROJECT_PATH}/${APP_NAME}/Info.plist"

#取版本号
bundleShortVersion=$(/usr/libexec/PlistBuddy -c "print CFBundleShortVersionString" "${project_infoplist_path}")

DATE="$(date +%Y%m%d)"
IPANAME="${APP_NAME}_V${bundleShortVersion}_${DATE}"

#ipa path 存储文件
ipa_path_file="ipa_path.txt"

rm -rf ${ipa_path_file}

#要上传的ipa文件路径
IPA_PATH="${PRODUCT_PATH}/${IPANAME}/${APP_NAME}.ipa"
echo "${IPA_PATH}">> ${ipa_path_file}  

echo "=================clean================="
xcodebuild -workspace "${PROJECT_PATH}/${APP_NAME}.xcworkspace" -scheme "${APP_NAME}"  -configuration "Release" clean

echo "+++++++++++++++++build+++++++++++++++++"
xcodebuild archive -archivePath "${PRODUCT_PATH}/${APP_NAME}.xcarchive" -workspace "${PROJECT_PATH}/${APP_NAME}.xcworkspace" -scheme "${APP_NAME}" -sdk iphoneos -configuration "Release" -derivedDataPath "${PRODUCT_PATH}"

#打包ipa
echo "****************archive****************"
xcodebuild -exportArchive -archivePath "${PRODUCT_PATH}/${APP_NAME}.xcarchive" -exportPath "${PRODUCT_PATH}/${IPANAME}" -exportOptionsPlist "${BASE_PATH}/adhocArchiveOptions.plist"
  
