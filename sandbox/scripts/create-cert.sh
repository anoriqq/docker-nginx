#!/bin/sh

WORKSPACE_ROOT=$(pwd)
echo "WORKSPACE_ROOT: ${WORKSPACE_ROOT}"
echo "ls -a: $(ls -a | tr '\n' '\t')"
echo "\n"



# mkcertバイナリを取得
BIN_DIR=${WORKSPACE_ROOT}/sandbox/bin
MKCERT_BIN_PATH=${BIN_DIR}/mkcert
if [ ! -e "${MKCERT_BIN_PATH}" ]; then
  if [ ! -d "$BIN_DIR" ]; then
    mkdir ${BIN_DIR}
  fi
  MKCERT_BINARY_RELEASE=https://github.com/FiloSottile/mkcert/releases/download/v1.4.1/mkcert-v1.4.1-linux-amd64
  sudo curl -L ${MKCERT_BINARY_RELEASE} -o ${MKCERT_BIN_PATH}
  sudo chmod 755 ${MKCERT_BIN_PATH}
fi

# CAファイルをコピー
sudo ${MKCERT_BIN_PATH} -install
# ROOT CAのディレクトリをバインドしない場合は以下のコメントアウトを外す
# WORKSPACE_CA_DIR=${WORKSPACE_ROOT}/packages/nginx/ca
# if [ ! -d "$WORKSPACE_CA_DIR" ]; then
#   mkdir ${WORKSPACE_CA_DIR}
# fi
# CA_DIR=/home/sandbox/.local/share/mkcert
# sudo cp ${CA_DIR}/* ${WORKSPACE_CA_DIR}

# certを作成
CERT_DIR=${WORKSPACE_ROOT}/packages/nginx/certs
if [ ! -d "$CERT_DIR" ]; then
  mkdir ${CERT_DIR}
fi
CERT_FILE=${CERT_DIR}/public.pem
KEY_FILE=${CERT_DIR}/private.pem
sudo ${MKCERT_BIN_PATH} -cert-file ${CERT_FILE} -key-file ${KEY_FILE} "*.anoriqq.local" anoriqq.local localhost 127.0.0.1 ::1

# TODO 証明書の発行が完了したら､ROOT CAファイルをWinodwsのシステムに"ユーザー証明書の管理"から登録する
