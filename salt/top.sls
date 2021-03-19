base:
  'dev':
    - user
    - vim 
    - dev
    - openbsd
  'plex*':
    - salt/vim 
    - salt/user
    - salt/plex
  'torrent':
    - salt/vim
    - salt/user
    - salt/protonvpn
