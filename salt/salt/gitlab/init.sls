gitlab_deps:
  pkg.installed:
    - pkgs:
      - curl
      - policycoreutils 
      - openssh-server 
      - perl 
      - yum-utils

/etc/yum.repos.d/gitlab_gitlab-ee.repo:
  file.managed:
    - source: https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/config_file.repo?os=almalinux&dist=8&source=script
    - skip_verify: True

gitlab_url:
  environ.setenv:
    - name: EXTERNAL_URL
    - value: http://gitlab.helluin.org
    - update_minion: True

gitlab:
  pkg.installed:
    - refresh: True
    - pkgs:
      - gitlab-ee
