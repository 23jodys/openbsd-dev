dependencies:
  pkg.installed:
    - pkgs:
      - ca-certificates
      - apt-transport-https

unifi_repo:
  pkgrepo.managed:
    - name: deb https://www.ui.com/downloads/unifi/debian stable ubiquiti
    - key_url: https://dl.ui.com/unifi/unifi-repo.gpg 

unifi:
  pkg.installed: []
  service.running: 
    - enable: true
