dns-config:
  file.managed:
    - name: /etc/resolv.conf
    - source: salt://init/files/resolv.conf.template
    - user: root
    - group: root
    - mode: 644
    - backup: minion

