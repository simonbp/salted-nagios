include:
  - .install

{% set absent_files = [
  '/etc/apache2/conf-enabled/nagios3.conf',
  '/etc/nagios3/apache2.conf',
  '/etc/nagios3/conf.d/contacts_nagios2.cfg',
  '/etc/nagios3/conf.d/extinfo_nagios2.cfg',
  '/etc/nagios3/conf.d/generic-host_nagios2.cfg',
  '/etc/nagios3/conf.d/generic-service_nagios2.cfg',
  '/etc/nagios3/conf.d/hostgroups_nagios2.cfg',
  '/etc/nagios3/conf.d/localhost_nagios2.cfg',
  '/etc/nagios3/conf.d/services_nagios2.cfg',
  '/etc/nagios3/conf.d/timeperiods_nagios2.cfg',
  ]
%}

{% for name in absent_files %}
{{ name }}:
  file:
    - absent
    - listen_in:
      - service: nagios3
{% endfor %}
