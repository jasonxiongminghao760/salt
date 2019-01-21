include:
  - modules.keepalived.install

keep-service:
  service.running:
    - name: keepalived
    - enable: True
    - reload: True
    - require:
      - file: keep-config
    - watch:
      - file: keep-config
 
