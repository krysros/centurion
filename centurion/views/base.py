import cherrypy

from centurion.forms import TYPES
from centurion.lookup import get_template


class BaseView(object):
    def __init__(self, session):
        self.session = session
        self.types = dict(TYPES)

    @cherrypy.expose
    def default(self, *args, **kwargs):
        template = get_template("notfound.mako")
        return template.render()
