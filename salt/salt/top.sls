base:
  'dev':
    - user
    - vim 
    - dev
    - openbsd
    - updates
  'plex*':
    - vim 
    - user
    - plex
    - media_storage_vlan
    - updates
  'public-plex*':
    - vim 
    - user
    - plex
    - media_public_storage_vlan
    - updates
  'torrent*':
    - vim
    - user
    - protonvpn
    - deluge
    - media_storage_vlan
    - picard
    - updates
  'unifi*':
    - unifi
    - updates
  'mirkwood*':
    - user
    - vim
    - dev
    - openbsd
    - openbsd_ports
  'docker*':
    - updates
    - vim
    - user
    - media_storage_vlan
    - docker
    - calibre
  'gondor*':
    - updates
    - gitlab
  'grafana.helluin.org':
    - updates
    - user
    - vim
  'gitlab-runner1*':
    - updates
    - gitlab-runner
