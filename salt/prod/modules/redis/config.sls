include:
  - modules.redis.install

{% set redis_port  = '6379' %}

redis-config:
  file.managed:
    - name: /data/{{ redis_port }}/redis.conf
    - source: salt://modules/redis/files/redis.conf
    - backup: minion
    - require:
      - cmd: redis-install
