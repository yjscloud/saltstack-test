base:
  '*':
    - init.init
prod:
  '*':
    - cluster.haproxy-outside
    - cluster.haproxy-outside-keepalived
    - bbs.web

  'saltstack02':
    - bbs.memcached 
