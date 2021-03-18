include: 
  - salt/user

vim:
  pkg.installed: 
    - pkgs:
{% if grains['os'] == 'RedHat' %}
      - vim-enhanced
{% elif grains['os'] == 'OpenBSD' %}
      - vim--no_x11-perl-python3-ruby
      - fzf
      - the_silver_searcher
      - git
{% else %}
      - vim
{% endif %}

'yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm':
  cmd.run: []

{% if grains['os'] == 'RedHat' %}
python3-GitPython:
  pkg.installed: []
{% endif %}

https://github.com/23jodys/vim-dot-files.git:
  git.latest:
    - target: /home/jodys/.vim
    - require:
      - user: jodys
    - user: jodys
    - force_reset: True  
    - submodules: True

/home/jodys/.vim/swap:
  file.directory:
    - user: jodys
       
/home/jodys/.vimrc:
  file.symlink:
    - target: /home/jodys/.vim/.vimrc
