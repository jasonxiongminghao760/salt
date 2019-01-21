www-group:
  group.present:
    - name: www
    - gid: 5000

www-user:
  user.present:
    - name: www
    - shell: /sbin/nologin
    - uid: 5000
    - gid: 5000
    - require:
      - group: www-group

