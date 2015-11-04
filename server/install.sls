include:
  - .debconf

nagios:
  pkg:
    - installed
    - name: nagios3
  service:
    - running
    - name: nagios3
    - enable: true
  group:
    - present
    - system: true
  user:
    - present
    - shell: /bin/false
    - home: /var/lib/nagios
    - groups:
      - nagios

nagios-nrpe-plugin:
  pkg:
    - installed
