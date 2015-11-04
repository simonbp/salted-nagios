include:
  - .install

/etc/nagios3:
  file:
    - directory
    - user: root
    - group: root
    - mode: 0755

/etc/nagios3/conf.d:
  file:
    - recurse
    - source: salt://nagios/server/files/conf.d
    - user: root
    - group: root
    - file_mode: 644
    - dir_mode: 755
    - clean: True
    - template: jinja
    - listen_in:
      - service: nagios3

/etc/nagios3/nagios.cfg:
  file:
    - managed
    - source: salt://nagios/server/files/nagios.cfg
    - template: jinja
    - listen_in:
      - service: nagios3
    - user: root
    - group: root
    - mode: 0644

/etc/nagios3/stylesheets:
  file:
    - recurse
    - source: salt://nagios/server/files/stylesheets
    - use:
      - file: /etc/nagios3/conf.d

/etc/nagios3/cgi.cfg:
  file:
    - managed
    - source: salt://nagios/server/files/cgi.cfg
    - use:
      - file: /etc/nagios3/nagios.cfg

/etc/nagios3/commands.cfg:
  file:
    - managed
    - source: salt://nagios/server/files/commands.cfg
    - use:
      - file: /etc/nagios3/nagios.cfg

/etc/nagios3/resource.cfg:
  file:
    - managed
    - source: salt://nagios/server/files/resource.cfg
    - use:
      - file: /etc/nagios3/nagios.cfg

/var/log/nagios3/nagios.log:
  file.managed:
    - user: nagios
    - group: adm
    - mode: 644

/var/lib/nagios3/rw:
  file.directory:
    - user: nagios
    - group: www-data
    - mode: 0750

/usr/local/bin/pagerduty_nagios.pl:
  file.managed:
    - source: salt://nagios/server/files/pagerduty_nagios.pl
    - user: root
    - group: root
    - mode: 0755
