/helluin/books:
  mount.mounted:
    - device: 10.0.19.18:/volume1/books
    - mkmnt: true
    - fstype: nfs

/etc/linuxserver.io/calibre-compose.yml:
  file.managed:
    - source: 'salt://calibre/calibre-compose.yml'

calibre_compose_unit:
  file.managed:
    - source: salt://calibre/calibre-compose.service
    - name: /etc/systemd/system/calibre-compose.service
  module.run:
    - name: service.systemctl_reload
    - onchanges:
      - file: calibre_compose_unit
  
