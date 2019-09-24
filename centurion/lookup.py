import os
import tempfile
from mako.lookup import TemplateLookup

tempdir = tempfile.gettempdir()
module_directory = os.path.join(tempdir, 'mako_modules')

template_lookup = TemplateLookup(directories=['centurion/templates'],
                                 module_directory=module_directory,
                                 input_encoding='utf-8',
                                 output_encoding='utf-8',
                                 collection_size=100)


def get_template(templatename):
    return template_lookup.get_template(templatename)
