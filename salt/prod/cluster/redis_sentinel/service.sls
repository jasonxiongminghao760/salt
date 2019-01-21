{%  set RedisCmd_Path = '/data/redis/src'  %}

redis-sentinel-service:
  cmd.run: 
    - name: {{ RedisCmd_Path }}/redis-sentinel /data/26380/sentinel.conf  & 
    - unless:  ps -ef |grep sentinel |wc -l


