nagios3-cgi:
  debconf.set:
    - data:
        'nagios3/adminpassword': {'type': 'password', 'value': ''}
        'nagios3/adminpassword-repeat': {'type': 'password', 'value': ''}
        'nagios3/nagios1-in-apacheconf': {'type': 'boolean', 'value': False}
        'nagios3/adminpassword-mismatch': {'type': 'note', 'value': ''}
        'nagios3/httpd': {'type': 'multiselect', 'value': 'apache2'}
