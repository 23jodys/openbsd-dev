include: 
  - user

vim:
  pkg.installed: 
    - pkgs:
      - vim--no_x11-perl-python3-ruby
      - fzf
      - the_silver_searcher
      - git

https://github.com/23jodys/vim-dot-files.git:
  git.latest:
    - target: /home/jodys/.vim
    - require:
      - user: jodys
    - user: jodys
    - force_reset: True  
    - submodules: True
