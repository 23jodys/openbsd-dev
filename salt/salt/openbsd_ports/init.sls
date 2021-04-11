/usr/ports/:
  mount.mounted:
    - fstype: nfs
    - device: westfold.helluin.org:/volume1/openbsd_ports
    - mkmnt: true
    - opts: ac
    

https://github.com/openbsd/ports.git:
  git.latest:
    - target: /usr/ports
    - require:
      - mount: /usr/ports/
    - user: jodys
