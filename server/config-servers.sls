include:
  - .install

{% for name in salt['mine.get']('*', 'grains.items' ) -%}
server_{{ name }}:
  file:
    - accumulated
    - name: servers
    - filename: /etc/nagios3/servers.cfg
    - text: {{ name }}
    - require_in:
      - file: servers
{% endfor %}

servers:
  file.managed:
    - name: /etc/nagios3/servers.cfg
    - source: salt://nagios/server/files/servers.jinja
    - template: jinja
    - listen_in:
      - service: nagios3
