sysctl-config:
  file.managed:
    - name: /etc/sysctl.conf
    - source: salt://init/files/sysctl.conf.template
    - user: root
    - group: root
    - mode: 644
    - backup: minion

sysctl-apply:
  cmd.run:
    - name: "sysctl -p"
    - require:
      - file: sysctl-config

