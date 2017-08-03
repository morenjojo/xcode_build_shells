#!/usr/bin/env bash

#脚本所在位置
BASE_PATH=$(cd "$(dirname "$0")"; pwd)

sh ${BASE_PATH}/build.sh &&
sh ${BASE_PATH}/pgy.sh &&
sh ${BASE_PATH}/fabric.sh

echo "\n\n\n\n******************auto distribute success***********************"
