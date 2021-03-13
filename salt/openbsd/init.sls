/etc/doas.conf:
  file.managed:
    - contents: 
      - permit nopass setenv { -ENV PS1= SSH_AUTH_SOCK } :wheel
