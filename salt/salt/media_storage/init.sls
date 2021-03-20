{% if grains['os'] == 'RedHat' %}
nfs-utils:
  pkg.installed: []
{% elif grains['os'] == 'Ubuntu' %}
nfs-common:
  pkg.installed: []
{% endif %}

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

