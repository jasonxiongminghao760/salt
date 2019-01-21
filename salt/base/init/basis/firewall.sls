firewall-service:
  service.dead:
    - name: firewalld
    - disabled: True

selinux-config:
  file.managed:
    - name: /etc/selinux/config
    - source: salt://init/files/selinux_config.template
  cmd.run:
    - name: setenforce 0 || echo ok
