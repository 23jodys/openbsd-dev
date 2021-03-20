deluge_pkgs:
  pkg.installed:
    - pkgs:
      - deluged
      - deluge-web

deluged_service:
  file.managed:
    - name: /etc/systemd/system/deluged.service
    - source: salt://deluge/deluged.service
  module.run:
    - name: service.systemctl_reload
    - onchanges:
      - file: deluged_service

deluged:
  service.running:
    - name: deluged 
    - enable: true
    - watch:
      - module: deluged_service

deluge-web_service:
  file.managed:
    - name: /etc/systemd/system/deluge-web.service
    - source: salt://deluge/deluge-web.service
  module.run:
    - name: service.systemctl_reload
    - onchanges:
      - file: deluge-web_service

deluge-web:
  service.running:
    - name: deluge-web 
    - enable: true
    - watch:
      - module: deluge-web_service
