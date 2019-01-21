{%set dir_backup = '/backup' %}
{%set dir_scripts = '/server/scripts' %}
directory_to_/backup:
   file.directory:
    - name: {{ dir_backup }}
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

directory_to_/server/scripts:
  file.directory:
    - name: {{ dir_scripts }}
    - user: root
    - group: root
    - mode: 755
    - makedirs: True
    - require:
      - file: directory_to_/backup

all_backup-scripts:
  file.managed:
    - name: {{ dir_scripts }}/all_backup_md5.sh
    - source: salt://init/scripts/all_backup_md5.sh
    - user: root
    - group: root
    - mode: 755
    - backup: minion
    - require:
      - file: directory_to_/server/scripts
