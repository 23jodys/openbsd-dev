echo "Starting first boot"
pkg_add salt py3-git2 curl
cat << EOF > /etc/salt/minion
file_client: local
master_type: disable
fileserver_backend:
  - git
gitfs_remotes:
  - git://github.com/23jodys/openbsd-dev/:
    - root: salt
    - base: main
ext_pillar:
  - git:
    - main git://github.com/23jodys/openbsd-dev.git:
      - env: base
      - root: pillar
EOF

salt-call -l info state.apply 
