#!/bin/bash

#. ./RenameClasses.sh
#. ./RenameProperty.sh

projectName="huojiandai"
appName="火箭贷"
Production="FhvLYdmAg9l7ilz9FOePoUpuoO10697eaf73-30b7-4281-ab86-b300bbb2e7eb"
Staging="UeQrUHJIiJl0mMu4ysuAPOuyuyuq697eaf73-30b7-4281-ab86-b300bbb2e7eb"

class_name_replace_dir="$(pwd)/../${projectName}"
projFile="${class_name_replace_dir}.xcodeproj" ##两个文件夹可以逗号隔开


# 替换字符串
replaceText() {
    # echo "第一个参数为 $1 !"
    # echo "第二个参数为 $2 !"
    sed -i '{
            s/'"${1}"'/'"${2}"'/g
        }' `grep ${1} -rl ${class_name_replace_dir} --exclude-dir="Assets.xcassets"`

    sed -i '{
            s/'"${1}"'/'"${2}"'/g
        }' `grep ${1} -rl ${projFile} --exclude-dir="Assets.xcassets"`
}


replaceText "速贷之家" ${appName}

replaceText "武传亮" ${appName}

replaceText "赵志丹" ${appName}

replaceText "智借iOS" ${appName}

replaceText "\/\/  sudaizhijia" "\/\/  ${projectName}"

replaceText "wUbZq8JRcsNKC_jnzx7kmwUi4eYR697eaf73-30b7-4281-ab86-b300bbb2e7eb" ${Production}

replaceText "zz4Pt93xSz6Ww7t6Xg8OsZzR7NAT697eaf73-30b7-4281-ab86-b300bbb2e7eb" ${Staging}


