ntp-config:
  cron.present:
    - name: /usr/sbin/ntpdate pool.ntp.org >/dev/null 2>&1
    - user: root
    - minute: '*/5'
    
