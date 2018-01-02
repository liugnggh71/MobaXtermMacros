#!/bin/sh

mkdir ${1}

cp template/template.xml ${1}/${1}.xml
cp template/pwd.xml ${1}
cp template/pwd.ksh ${1}
cp template/code_list.xml ${1}
cp template/template.xpr ${1}/${1}.xpr

sed -i -e "s/template/${1}/g" ${1}/${1}.xml
sed -i -e "s/template/${1}/g" ${1}/${1}.xpr
sed -i -e "s/template/${1}/g" ${1}/code_list.xml
