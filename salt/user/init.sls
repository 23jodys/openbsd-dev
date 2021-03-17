jodys:
  user.present:
    - home: /home/jodys
    - groups:
      - wheel
    - uid: 1026

{% if grains['os'] == 'OpenBSD' %}
/home/jodys/.kshrc:
  file.managed:
    - user: jodys
    - contents: 
      - . /etc/ksh.kshrc
      - HISTFILE="$HOME/.ksh_history"
      - HISTSIZE=5000
      - PS1='<[\j] \u@\h:\W \!>$ '
      - export VISUAL="vim"
      - export EDITOR="$VISUAL"
      - export FCEDIT="$VISUAL"
      - set -o vi
      - export FZF_DEFAULT_COMMAND="command find -L . -mindepth 1 \( -path '*/\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \) -prune -o -type f -print -o -type l -print 2> /dev/null | cut -b3-"
      - export LC_CTYPE=en_US.UTF-8
      - alias mktags="rm tags; find . \( -name '*.h' -o -name '*.c' \) | xargs ctags -a"
      - export PATH=/usr/local/bin:~/bin:$PATH

/home/jodys/.profile:
  file.managed:
    - user: jodys
    - contents: 
      - PATH=$HOME/bin:/home/jodys/.local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games
      - TERM=xterm-256color
      - ENV=$HOME/.kshrc
      - export PATH HOME TERM ENV

/home/jodys/.ssh/authorized_keys:
  file.managed:
    - mode: 0400
    - user: jodys
    - contents:
      - {{ pillar['ssh_key'] }}
{% endif %}

/home/jodys/.gitconfig:
  file.managed:
    - user: jodys
    - contents:
      - [user]
      -   name = Jody Stephens
      -   email = jodys@helluin.org
