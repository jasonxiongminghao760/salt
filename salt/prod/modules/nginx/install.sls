nginx-install:
  pkg.installed:
    - name: nginx

nginx-config:
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: salt://modules/nginx/files/nginx.conf.template
    - user: root
    - group: root
    - mode: 644
    - backup: minion
    - require:
      - pkg: nginx-install
