import cherrypy
from centurion.lookup import get_template
from centurion.forms import CATEGORIES


class BaseView(object):
    def __init__(self, session):
        self.session = session
        self.categories = dict(CATEGORIES)

    @cherrypy.expose
    def default(self, *args, **kwargs):
        template = get_template('notfound.mako')
        return template.render()
