history-config:
  file.append:
    - name: /etc/profile
    - text:
      - export HISTTIMEFORMAT="%F %T `whoami`"

history-enable:
  cmd.run:
    - name: source /etc/profile

