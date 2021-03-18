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
