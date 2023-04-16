import os
from typing import List
import glob

from qutebrowser.config.configfiles import ConfigAPI
from qutebrowser.config.config import ConfigContainer

config: ConfigAPI = config
c: ConfigContainer = c

home: str = os.getenv('HOME')

config.load_autoconfig()


def dict_attrs(obj, path=''):
    if isinstance(obj, dict):
        for k, v in obj.items():
            yield from dict_attrs(v, '{}.{}'.format(path, k) if path else k)
    else:
        yield path, obj


c.tabs.padding = {
    "top": 15,
    "bottom": 15,
    "left": 10,
    "right": 10,
}

c.content.javascript.enabled = True

c.statusbar.padding = {
    "top": 10,
    "bottom": 10,
    "left": 10,
    "right": 10,
}

c.content.user_stylesheets = glob.glob("css/*.css")
c.fonts.web.family.fixed = "Cascadia Code PL"
c.aliases['src'] = 'config-source'
c.aliases.update({
    'save-to-zotero':
    "jseval javascript:function save2zotero(){"
    "var d=document; var s=d.createElement('scr'+'ipt');"
    "s.setAttribute('src', 'https://www.zotero.org/bookmarklet/loader.js');"
    "(d.body?d.body:d.documentElement).appendChild(s);};save2zotero();void(0);"
})

config.source('qutewal.py')
config.source('interceptor.py')