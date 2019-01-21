include:
  - modules.nginx.service

nginx-proxy:
  file.managed:
    - name: /etc/nginx/conf.d/proxy.conf
    - source: salt://cluster/proxy/files/proxy.conf.template
    - user: root
    - group: root
    - mode: 644
    - backup: minion
    - watch_in:
      - service: nginx-service

