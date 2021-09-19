import os
from typing import List
import prctl
import subprocess
import signal
import yaml

from pathlib import Path
from qutebrowser.config.configfiles import ConfigAPI
from qutebrowser.config.config import ConfigContainer

config: ConfigAPI = config
c: ConfigContainer = c

home: str = os.getenv('HOME')
colors_relative = '.cache/wal/colors.json'
daemon_relative = '.config/qutebrowser/qutewald.py'
colors_absolute = os.path.join(home, colors_relative)
daemon_absolute = os.path.join(home, daemon_relative)

config.load_autoconfig()
# config.source('qutewal.py')

with (Path.home() / '.cache/wal/qutebrowser.yml').open() as f:
    yaml_data = yaml.safe_load(f)


def dict_attrs(obj, path=''):
    if isinstance(obj, dict):
        for k, v in obj.items():
            yield from dict_attrs(v, '{}.{}'.format(path, k) if path else k)
    else:
        yield path, obj


for k, v in dict_attrs(yaml_data):
    config.set(k, v)

c.tabs.padding = {
    "top": 15,
    "bottom": 15,
    "left": 10,
    "right": 10,
}

c.statusbar.padding = {
    "top": 6,
    "bottom": 6,
    "left": 6,
    "right": 6,
}

css = ['base']
c.content.user_stylesheets = list(map(lambda x: f"css/{x}.css", css))

c.aliases['src'] = 'config-source'


# start iqutefy to refresh colors on the fly
qutewald = subprocess.Popen(
    [daemon_absolute, colors_absolute],
    preexec_fn=lambda: prctl.set_pdeathsig(signal.SIGTERM))
