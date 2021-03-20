dependencies:
  pkg.installed:
    - pkgs:
      - openvpn
      - dialog
      - python3-pip
      - python3-setuptools

protonvpn-cli:
  pip.installed: 
    - require:
      - pkg: dependencies

/root/.pvpn-cli/pvpn-cli.cfg:
  file.managed:
    - makedirs: true
    - source: salt://protonvpn/pvpn.cfg
    - template: jinja

/root/.pvpn-cli/pvpnpass:
  file.managed:
    - makedirs: true
    - source: salt://protonvpn/pvpnpass
    - template: jinja
    - mode: 0400

pvpn_service:
  file.managed:
    - name: /etc/systemd/system/protonvpn.service
    - source: salt://protonvpn/protonvpn.service
  module.run:
    - name: service.systemctl_reload
    - onchanges:
      - file: pvpn_service

protonvpn:
  service.running:
    - name: protonvpn
    - watch:
      - module: pvpn_service

#'truncate -s -1 /root/.pvpn-cli/pvpnpass':
#  cmd.run:
#    - watch:
#      - file: /root/.pvpn-cli/pvpnpass

