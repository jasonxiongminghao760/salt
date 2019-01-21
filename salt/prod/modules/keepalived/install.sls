keep-install:
  pkg.installed:
   - name: keepalived

keep-config:
  file.managed:
    - name: /etc/keepalived/keepalived.conf
    - source: salt://modules/keepalived/files/keepalived.conf.template
    - require:
      - pkg: keep-install
    - template: jinja
    {% if grains['fqdn'] == 'salt3-minion' %}
    - ROUTER_ID: salt3
    - STATE: MASTER
    - PRIORITY: 100
    {% elif grains['fqdn'] == 'salt4-minion' %}
    - ROUTER_ID: salt4
    - STATE: BACKUP
    - PRIORITY: 50
    {% endif %}


