#!/bin/sh

# -----------------------------------------------------------------------------------------------------------------------------
# systemctl実行
# -----------------------------------------------------------------------------------------------------------------------------
exec /sbin/init

# -----------------------------------------------------------------------------------------------------------------------------
# MySQLの初期設定
# -----------------------------------------------------------------------------------------------------------------------------
# 初期パスワードの確認
# DB_INITPASS=$(grep "A temporary password is generated" /var/log/mysqld.log | sed -e "s/.*root@localhost: //")
# 入手した初期パスワードでログインし、パスワードポリシーを下げる
# mysql --connect-expired-password -uroot -p"${DB_INITPASS}" -e "set global validate_password_policy=LOW;"
# 初期パスワードを変更する
# mysql --connect-expired-password -uroot -p"${DB_INITPASS}" -e "alter user 'root'@'localhost' identified by 'snstoola00';"
# sqlファイルを流すDBを作成する
# mysql --connect-expired-password -uroot -p'snstoola00' -e 'CREATE DATABASE snstoola00;'

# Apache起動
#systemctl start httpd.service 