include:
   - cluster.redis_sentinel.dir

{% set Port  = '26380' %}

redis-config:
  file.managed:
    - name: /data/{{ Port }}/sentinel.conf
    - source: salt://cluster/redis_sentinel/files/sentinel.conf
    - backup: minion
    - template: jinja
    - defaults:
      Sentinel_Port: {{ Port }}
      Sentinel_Dir:  /data/{{ Port }}
      Redis_Master: 172.16.1.51 6379 1
    - require:
      - file: redis-dir-data-26380
