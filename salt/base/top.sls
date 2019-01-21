base:
  '*':
    - init.basis.env_init

prod:
  'salt[1|2]*':
    - modules.nginx.service
    - webnode.code
