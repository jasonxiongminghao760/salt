include:
  - modules.php.install

php-service:
  service.running:
   - name: php-fpm
   - enable: True
   - reload: True
   - require:
     - file: php-ini-config
     - file: php-fpm-config
     - file: php-fpm-dir-config
   - watch:
     - file: php-ini-config
     - file: php-fpm-config
     - file: php-fpm-dir-config
