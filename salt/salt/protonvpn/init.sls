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

