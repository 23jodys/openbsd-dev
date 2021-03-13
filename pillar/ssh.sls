{% set ssh_key = salt['cmd.shell']('curl --request GET http://169.254.169.254/v1/public-keys')  %}
ssh_key: {{ ssh_key }}
