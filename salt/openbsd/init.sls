/etc/doas.conf:
  file.managed:
    - contents: |
        permit persist setenv { -ENV PS1= SSH_AUTH_SOCK } :wheel
