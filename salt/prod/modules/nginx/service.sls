include:
  - modules.nginx.install

nginx-service:
  service.running:
   - name: nginx
   - enable: True
   - reload: True
   - require:
     - file: nginx-config
   - watch:
     - file: nginx-config
