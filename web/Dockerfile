FROM centos:7

LABEL mantainer Numakunai_Shunichi

# CentOS7のインストール
RUN yum -y install epel-release
RUN rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

# PHPのインストール
RUN yum -y install -y --enablerepo=remi,remi-php73 php php-mbstring php-mcrypt php-mysql php-pdo php-pecl-xdebug

# MySQLのインストール
RUN yum -y install https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm

# 以下のコマンドはGPGKEYのエラーが出る
# RUN yum -y install mysql-community-client
# RUN yum -y install mysql-community-server

# ソースディレクトリの作成
# RUN mkdir -p /httpd/htdocs/passwdweb

# -----------------------------------------------------------------------------------
# 各種設定ファイルの置き換え

# php.iniの置換
# RUN cp /etc/php.ini /etc/php.ini.bak
# COPY php.ini /etc/

# これは環境ごとのphp.iniを入れておく場所、develop.iniなど
RUN cp -r /etc/php.d /etc/php.d.bak
COPY php.d/* /etc/php.d/

# Apacheのインストール
RUN yum -y install httpd httpd-devel
#    && useradd www \
#    && mkdir /home/www/htdocs \
#    && chown www:www /home/www/htdocs \
#    && chmod 0777 /home/www/htdocs

# httpdファイルを置換
RUN cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.bak
COPY httpd.conf /etc/httpd/conf

# init.shを/bin下に配置する
# COPY init.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/init.sh

CMD ["apachectl", "-D", "FOREGROUND"]