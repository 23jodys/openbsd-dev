plex_repo:
  pkgrepo.managed:
     - humanname: Plex
     - baseurl: https://downloads.plex.tv/repo/rpm/$basearch/
     - enabled: True
     - gpgkey: https://downloads.plex.tv/plex-keys/PlexSign.key
     - gpgcheck: True

plexmediaserver:
  pkg.latest: []
  service.running: []

plex_service:
  firewalld.service:
     - ports:
       - 32400/tcp
       - 1900/udp
       - 3005/tcp
       - 5353/udp
       - 8324/tcp
       - 32410/udp
       - 32412/udp
       - 32413/udp
       - 32414/udp
       - 32469/tcp

plex_firewall:
  firewalld.present:
    - name: public
    - services: 
      - plex_service
