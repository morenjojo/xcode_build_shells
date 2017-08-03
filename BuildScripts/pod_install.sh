#!/usr/bin/env bash

#脚本所在位置
BASE_PATH=$(cd "$(dirname "$0")"; pwd)

#工程所在位置
PROJECT_PATH=${BASE_PATH}"/.."

pod install --project-directory=${PROJECT_PATH}
