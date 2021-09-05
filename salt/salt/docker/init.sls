docker_repo:
  pkg.installed:
    - refresh: true
    - pkgs:
      - apt-transport-https
      - ca-certificates
      - curl
      - gnupg
      - lsb-release
  pkgrepo.managed:
    - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable
    - key_url: https://download.docker.com/linux/ubuntu/gpg 


