/etc/yum.repos.d/gitlab_runner.repo:
  file.managed:
    - source: https://packages.gitlab.com/install/repositories/runner/gitlab-runner/config_file.repo?os=almalinux&dist=8&source=script
    - skip_verify: True

gitlab-runner:
  pkg.installed:
    - refresh: True
    - pkgs:
      - gitlab-runner
