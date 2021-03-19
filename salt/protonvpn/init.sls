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
