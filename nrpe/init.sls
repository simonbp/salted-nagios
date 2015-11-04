nrpe:
  pkg:
    - installed
    - name: nagios-nrpe-server
  service:
    - running
    - name: nagios-nrpe-server
    - enable: True

nrpe-plugins:
  pkg:
    - installed
    - pkgs:
      - nagios-plugins
      - nagios-plugins-basic
      - nagios-plugins-standard
      - nagios-plugins-contrib
      - nagios-plugins-extra

libnet-tftp-perl:
  pkg:
    - installed

/usr/local/lib/nagios/plugins:
  file:
    - recurse
    - source: salt://nagios/nrpe/files/plugins
    - user: root
    - group: root
    - dir_mode: 0775
    - file_mode: 0775

/etc/nagios/nrpe.cfg:
  file:
    - managed
    - source: salt://nagios/nrpe/files/nrpe.cfg
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - watch_in:
      - service: nrpe

/etc/nagios/nrpe_local.cfg:
  file:
    - absent
    - watch_in:
      - service: nrpe

/etc/nagios/nrpe.d:
  file:
    - absent
    - watch_in:
      - service: nrpe
