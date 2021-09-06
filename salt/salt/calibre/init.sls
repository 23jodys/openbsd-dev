/helluin/books:
  mount.mounted:
    - device: 10.0.19.18:/volume1/books
    - mkmnt: true
    - fstype: nfs

nginx-full:
  pkg.installed: []

/etc/nginx/sites-enabled/default:
  file.absent: []

/etc/nginx/sites-enabled/calibre:
  file.managed:
    - source: salt://calibre/calibre-nginx.conf

nginx:
  service.running: 
    - enable: true
    - reload: true
    - watch:
      - file: /etc/nginx/sites-enabled/calibre

/etc/linuxserver.io/calibre-compose/:
  file.directory: 
    - makedirs: true

/etc/linuxserver.io/calibre-compose/docker-compose.yml:
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
