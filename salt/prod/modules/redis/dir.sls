redis-dir-data:
  file.directory:
    - name: /data
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

redis-dir-data-6379:
  file.directory:
    - name: /data/6379
    - user: root
    - group: root
    - mode: 755
    - makedirs: True
