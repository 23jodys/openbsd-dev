nfs-utils:
  pkg.installed: []

/helluin/video:
  mount.mounted:
    - device: westfold.helluin.org:/volume1/video
    - mkmnt: true
    - fstype: nfs

/helluin/music:
  mount.mounted:
    - device: westfold.helluin.org:/volume1/music
    - mkmnt: true
    - fstype: nfs

