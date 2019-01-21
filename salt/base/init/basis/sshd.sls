sshd-config:
  file.managed:
    - name: /etc/ssh/sshd_config 
    - source: salt://init/files/sshd_config.template
    - user: root
    - group: root
    - mode: 600
    - backup: minion

sshd-service:
  service.running:
    - name: sshd
    - enable: True
    - reload: True
    - require:
      - file: sshd-config  
    - watch:
      - file: sshd-config
