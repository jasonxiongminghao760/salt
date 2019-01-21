redis-slave:
  cmd.run:
    {% if grains['fqdn'] == 'db02' %}
      - name:  /data/redis/src/redis-cli -h 127.0.0.1 SLAVEOF 172.16.1.51 6379
      - unless:  /data/redis/src/redis-cli -h 127.0.0.1  info replication |grep role:slave
    {% endif %}

