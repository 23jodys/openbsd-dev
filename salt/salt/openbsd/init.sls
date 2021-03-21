/etc/doas.conf:
  file.managed:
    - source: salt://openbsd/doas.conf

/etc/rc.d/sshfs:
  file.managed:
    - contents:
      - #!/bin/ksh
      - daemon="/usr/local/bin/sshfs"
      - . /etc/rc.d/rc.subr
      - pexp="${daemon} ${daemon_flags}"
      - rc_start() {
      - 	echo "Starting ${daemon} ${daemon_flags}" | logger
      - 	${daemon} ${daemon_flags} 
      - }
      - rc_stop() {
      - 	echo "Unmounting ${daemon} ${daemon_flags}" | logger
      - 	umount /home/jodys/Drive
      - }
      - rc_cmd $1

sshfs:
  service.running:
    - require: 
      - file: /etc/rc.d/sshfs
