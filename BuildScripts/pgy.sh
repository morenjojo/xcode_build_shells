#蒲公英上的User Key
uKey="XXXXXXXXX"
#蒲公英上的API Key
apiKey="XXXXXXXXX"

ipa_path_file="ipa_path.txt"

#要上传的ipa文件路径
IPA_PATH=$(cat ${ipa_path_file})

#执行上传至蒲公英的命令
echo "++++++++++++++upload+++++++++++++"
curl -F "file=@${IPA_PATH}" -F "uKey=${uKey}" -F "_api_key=${apiKey}" http://www.pgyer.com/apiv1/app/upload
