import cherrypy
from centurion.lookup import get_template
from centurion.models import Price
from centurion.forms import CATEGORIES


class CityView(object):
    def __init__(self, session):
        self.session = session
        self.categories = dict(CATEGORIES)

    @cherrypy.expose
    def default(self, *args, **kwargs):
        template = get_template('notfound.mako')
        return template.render()

    @cherrypy.expose
    def index(self, name=None):
        if not name:
            return self.default()
        query = self.session.query(Price)
        prices = query.filter(Price.city == name).order_by(Price.timestamp.desc())
        template = get_template('results.mako')
        return template.render(smalltext='Miasto', header=name,
                               prices=prices, categories=self.categories)
