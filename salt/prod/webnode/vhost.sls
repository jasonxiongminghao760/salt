include:
  - modules.nginx.service
  - modules.php.service

vhost-config:
  file.recurse:
    - name: /etc/nginx/conf.d
    - source: salt://webnode/files/config.d.template
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - include_empty: True
    - clean: True
    - watch_in:
      - service: nginx-service
      - service: php-service

