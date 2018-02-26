redis-plugin:
  file.managed:
    - name: /usr/local/src/redis-2.2.7.tgz
    - source: salt://modules/php/files/redis-2.2.7.tgz
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: cd /usr/local/src && tar zxf redis-2.2.7.tgz && cd redis-2.2.7&& /usr/local/php-fastcgi/bin/phpize && ./configure --with-php-config=/usr/local/php-fastcgi/bin/php-config &&  make&& make install
    - unless: test -f /usr/local/php-fastcgi/lib/php/extensions/*/redis.so
  require:
    - file: redis-plugin
    - cmd: php-install
