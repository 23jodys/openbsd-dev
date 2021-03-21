/etc/doas.conf:
  file.managed:
    - source: salt://openbsd/doas.conf

/etc/rc.d/sshfs:
  file.managed:
    - source: salt://openbsd/sshfs.rc

sshfs:
  service.running:
    - require: 
      - file: /etc/rc.d/sshfs
