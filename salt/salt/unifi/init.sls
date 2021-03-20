dependencies:
  pkg.installed:
    - pkgs:
      - ca-certificates
      - apt-transport-https
      - openjdk-8-jre-headless

unifi_repo:
  pkgrepo.managed:
    - name: deb https://www.ui.com/downloads/unifi/debian stable ubiquiti
    - key_url: https://dl.ui.com/unifi/unifi-repo.gpg 

unifi:
  pkg.installed: 
    - require:
      - pkgrepo: unifi_repo
      - pkg: dependencies
  service.running: 
    - enable: true
