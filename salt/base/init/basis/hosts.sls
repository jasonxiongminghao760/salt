hosts-config:
  file.managed:
    - name: /etc/hosts
    - source: salt://init/files/hosts.template
    - user: root
    - group: root
    - mode: 644
    - backup: minion
