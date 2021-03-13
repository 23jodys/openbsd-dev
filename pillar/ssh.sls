ssh_key: {% salt['cmd.run']('curl --request GET GET http://169.254.169.254/v1/public-keys') %}
