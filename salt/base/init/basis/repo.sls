repo-config:
  file.recurse:
    - name: /etc/yum.repos.d
    - source: salt://init/files/yum.repos.d.template
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - include_empty: True
    - clean: True
