include:
  - modules.redis.dir

redis-install:
  cmd.run: 
    - name: cd /data && [  ! -d /data/redis/src ] && wget http://download.redis.io/releases/redis-3.2.2.tar.gz && tar xf redis-3.2.2.tar.gz && mv redis-3.2.2 redis && cd redis && make  && echo 'export PATH="/data/redis/src/:$PATH"' >>/etc/profile && source  /etc/profile ||exit 0 
