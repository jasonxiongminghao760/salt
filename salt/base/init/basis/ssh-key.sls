ssh-key-config:
  file.managed:
    - name: /root/.ssh/authorized_keys
    - source: salt://init/files/authorized_keys.template
    - user: root
    - group: root
    - mode: 600
    - makedirs: True
