include:
  - webnode.vhost

bbs-code-dir:
  file.directory:
   - name: /code/bbs
   - user: www
   - group: www
   - mode: 755
   - makedirs: True
   - require:
     - file: vhost-config

bbs-code:
  file.managed:
    - name: /code/bbs/index.php
    - source: salt://webnode/files/index.php
    - user: www
    - group: www
    - require:
      - file: bbs-code-dir



