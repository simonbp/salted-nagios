# salted-nagios
This Salt State allows Salt to tell Nagios what to monitor based on [Salt Grains](https://docs.saltstack.com/en/latest/topics/targeting/grains.html) and [Mine](https://docs.saltstack.com/en/latest/topics/mine/) data.

## Configuration

### State

Put the folders `nrpe` and `nagios` with your other Salt states. Salt states are usually in `/srv/salt/`.

### Pillar
Create [pillar](https://docs.saltstack.com/en/latest/topics/pillar/) files for nagios and nrpe using the PILLAR.EXAMPLE files in the states as a template. Pillar files are usually in `/srv/pillar`. Don't forget to add the pillar files to your pillar top file (`/srv/pillar/top.sls`) so they get applied on the right hosts.

These pillar files contain the configuration settings for nagios and nrpe. Any configuration changes you need to make to Nagios or NRPE should be made in these files.

### Mine
Add the following [mine functions](https://docs.saltstack.com/en/latest/topics/mine/#mine-functions) on your Salt Minions:

```
    mine_functions:
      grains.items: []
      pkg.list_pkgs: []

```

These functions allow Nagios to view information about other minions so that it can make decisions about what to monitor on each host.
