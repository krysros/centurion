import cherrypy
from centurion.lookup import get_template


class Root(object):
    @cherrypy.expose
    def index(self):
        template = get_template('home.mako')
        return template.render()

    @cherrypy.expose
    def default(self, *args, **kwargs):
        template = get_template('notfound.mako')
        return template.render()
