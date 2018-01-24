FROM centos:7
LABEL maintainer "Makoto Yoshida <mattintosh4@gmail.com>"

RUN sed -i'' '/^mirrorlist/{s|^|#|};/^#baseurl/{s|^#||;s|mirror.centos.org|ftp.riken.jp/Linux|}' /etc/yum.repos.d/CentOS-Base.repo \
&&  yum -y install httpd php php-mbstring php-gd php-pdo php-fpm php-mysql \
&&  yum clean all \
&&  printf '<Directory "/var/www/html">\n    AllowOverride All\n</Directory>\n' | tee -a /etc/httpd/conf/httpd.conf

EXPOSE 80

CMD /usr/sbin/httpd -DFOREGROUND
