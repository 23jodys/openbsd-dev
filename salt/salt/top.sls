base:
  'dev':
    - user
    - vim 
    - dev
    - openbsd
  'plex*':
    - vim 
    - user
    - plex
    - media_storage_vlan
  'torrent*':
    - vim
    - user
    - protonvpn
    - deluge
    - media_storage_vlan
    - picard
  'unifi*':
    - unifi
  'mirkwood*':
    - user
    - vim
    - dev
    - openbsd
    - openbsd_ports
  'docker*':
    - vim
    - user
    - media_storage_vlan
    - docker
    - calibre
