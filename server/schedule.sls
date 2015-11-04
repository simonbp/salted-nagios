refresh-servers:
  schedule.present:
    - function: state.sls
    - job_args:
      - nagios.server.config-servers
    - seconds: 600

refresh-hostgroups:
  schedule.present:
    - function: state.sls
    - job_args:
      - nagios.server.config-hostgroups
    - seconds: 600
