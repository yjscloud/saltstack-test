include:
  - modules.php.install
  - modules.php.php-memcache
  - modules.php.php-redis
  - modules.nginx.service

bbs-php:
  file.managed:
    - name: /usr/local/php-fastcgi/etc/php.ini
    - source: salt://bbs/files/php.ini-production
    - user: root
    - group: root
    - mode: 644
  service.running:
    - name: php-fpm
    - enable: True
    - require:
      - cmd: php-fastcgi-service
    - watch:
      - file: bbs-php

web-bbs:
  file.managed:
    - name: /usr/local/nginx/conf/vhost_online/bbs.conf
    - source: salt://bbs/files/nginx-bbs.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - service: bbs-php
    - watch_in:
      - service: nginx-service
