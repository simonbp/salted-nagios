include:
  - .install

{% for name in salt['pillar.get']('nagios:server:hostgroups') %}
hostgroup_{{ name }}:
  file.accumulated:
    - name: hostgroups
    - filename: /etc/nagios3/hostgroups.cfg
    - text: {{ name }}
    - require_in:
      - file: hostgroups
{% endfor %}

hostgroups:
  file.managed:
    - name: /etc/nagios3/hostgroups.cfg
    - source: salt://nagios/server/files/hostgroups.jinja
    - template: jinja
    - listen_in:
      - service: nagios3
