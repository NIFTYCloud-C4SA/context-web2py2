#!/bin/bash

## web2py2コンテクスト作成シェルスクリプト

BIN_CURL="/usr/bin/curl -L"
BIN_MV="/bin/mv"
BIN_CP="/bin/cp -pr"
BIN_RM="/bin/rm -rf"
BIN_TAR="/usr/bin/tar"
BIN_UNZIP="/usr/bin/unzip -q"
BIN_CD="cd"

URL_ARCHIVE="http://www.web2py.com/examples/static/web2py_src.zip"

## make context
${BIN_CD} ./contexts/krm/docroot/project/
${BIN_CURL} -o ./web2py.zip ${URL_ARCHIVE}
${BIN_UNZIP} ./web2py.zip
${BIN_RM} ./web2py.zip
${BIN_CP} ./web2py/[A-z]* ./
${BIN_RM} ./web2py
${BIN_CD} ../

## create archive
${BIN_TAR} czpf ../docroot.tar.gz *
${BIN_CD} ../
${BIN_RM} ./docroot
${BIN_CD} ../
${BIN_TAR} czpf ./krm.tar.gz ./krm

## end
