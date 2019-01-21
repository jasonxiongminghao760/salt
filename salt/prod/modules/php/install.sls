{%set php_directory = 'modules/php/files' %}

php-install:
  pkg.installed:
    - names:
      - php70w
      - php70w-fpm
      - php70w-gd
      - php70w-opcache
      - php70w-pdo
      - php70w-cli
      - php70w-mysql 

php-ini-config:
  file.managed:
    - name: /etc/php.ini
    - source: salt://{{ php_directory }}/php.ini.template
    - user: root
    - group: root
    - mode: 644
    - backup: minion
    - require:
      - pkg: php-install

php-fpm-config:
  file.managed:
    - name: /etc/php-fpm.conf
    - source: salt://{{ php_directory }}/php-fpm.conf.template
    - user: root
    - group: root
    - mode: 644
    - backup: minion
    - require:
      - pkg: php-install

php-fpm-dir-config:
  file.recurse:
    - name: /etc/php-fpm.d
    - source: salt://{{ php_directory }}/php-fpm.d
    - user: root
    - group: root
    - file_mode: 644
    - dir_mode: 755
    - clean: True
    - include_empty: True
    - require:
      - pkg: php-install
