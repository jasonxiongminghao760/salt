{%  set RedisCmd_Path = '/data/redis/src'  %}

redis-slave:
  {% if grains['fqdn'] == 'db02' %}
    cmd.run:
      - name:  {{ RedisCmd_Path }}/redis-cli -h 127.0.0.1 SLAVEOF 172.16.1.51 6379
      - unless:  {{ RedisCmd_Path }}/redis-cli -h 127.0.0.1  info replication |grep role:slave
  {% elif grains['fqdn'] == 'db03' %}
    cmd.run:
      - name:  {{ RedisCmd_Path }}/redis-cli -h 127.0.0.1 SLAVEOF 172.16.1.51 6379
      - unless:  {{ RedisCmd_Path }}/redis-cli -h 127.0.0.1  info replication |grep role:slave     
  {% endif %}

