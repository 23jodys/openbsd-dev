influx_repo:
  pkgrepo.managed:
    - humanname: Influx
    - baseurl: https://repos.influxdata.com/rhel/\$releasever/\$basearch/stable
    - enabled: True
    - gpgkey: https://repos.influxdata.com/influxdb.key
    - gpgcheck: True

influxdb2:
  pkg.latest: 
    refresh: True
  service.running: []
