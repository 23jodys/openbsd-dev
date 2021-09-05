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


/helluin/books:
  mount.mounted:
    - device: 10.0.19.18:/volume1/books
    - mkmnt: true
    - fstype: nfs


