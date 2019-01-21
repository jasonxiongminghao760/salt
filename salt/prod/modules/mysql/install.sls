mysql-install:
  pkg.installed:
    - name: mysql-community-server

mysql-config:
  file.managed:
    - name: /etc/my.cnf
    - source: salt://modules/mysql/files/my.cnf.template
    - user: root
    - group: root
    - mode: 644
    - backup: minion
    - require:
      - pkg: mysql-install
