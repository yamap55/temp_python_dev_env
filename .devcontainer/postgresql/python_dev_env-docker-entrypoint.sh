#!/usr/bin/env bash

if [ -d "/var/log/postgresql" ];then
  # CircleCi（Linux）で実行する場合、VolumeのPermissionはホストの設定を引き継ぐ
  # これによりLog出力でエラーが発生するため、オーナーを変更する
  chown -R postgres:postgres /var/log/postgresql
fi

docker-entrypoint.sh "$@"
