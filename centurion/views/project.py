import string
import cherrypy
from centurion.lookup import get_template
from centurion.models import Price
from centurion.forms import CATEGORIES


class ProjectView(object):
    def __init__(self, session):
        self.session = session
        self.categories = dict(CATEGORIES)
        self.alphabet = list(string.ascii_lowercase)

    @cherrypy.expose
    def default(self, *args, **kwargs):
        template = get_template('notfound.mako')
        return template.render()

    @cherrypy.expose
    def index(self, name=None):
        if not name:
            return self.default()
        query = self.session.query(Price)
        prices = query.filter(Price.project == name).order_by(Price.timestamp.desc())
        template = get_template('prices.mako')
        return template.render(prices=prices,
                               categories=self.categories, alphabet=self.alphabet)
