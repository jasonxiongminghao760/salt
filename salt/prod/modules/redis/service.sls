{% set redis_config  = '6379/redis.conf' %}

redis-service:
  cmd.run:
    - name: /data/redis/src/redis-server /data/{{ redis_config }}
