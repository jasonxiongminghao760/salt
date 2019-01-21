include:
  - init.basis.repo

pkg-install:
  pkg.installed:
    - names:
      - tree
      - wget
      - telnet
      - iftop
      - iotop
      - dstat
      - lrzsz
      - unzip
      - ntpdate
      - gcc
      - pcre
      - pcre-devel
      - openssl
      - openssl-devel
    - require:
      - file: repo-config
