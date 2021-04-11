/usr/ports/:
  mount.mounted:
    - fstype: nfs
    - device: westfold.helluin.org:/volume1/openbsd_ports
    - mkmnt: true
    - defaults: null
    
