include:
  - modules.redis.install

{% set Port  = '6379' %}

redis-config:
  file.managed:
    - name: /data/{{ Port }}/redis.conf
    - source: salt://modules/redis/files/redis.conf
    - backup: minion
    - template: jinja
    - defaults:
      Redis_Port: {{ Port }}
      Redis_Dir: /data/{{ Port }}
    - require:
      - cmd: redis-install

