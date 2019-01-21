include:
  - modules.mysql.install

mysql-service:
  service.running:
   - name: mysqld
   - enable: True
   - require:
     - file: mysql-config
