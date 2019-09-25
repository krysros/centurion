import cherrypy
from centurion.lookup import get_template
from centurion.models import Price
from centurion.views import BaseView


class ProjectView(BaseView):
    def __init__(self, session):
        super().__init__(session)

    @cherrypy.expose
    def index(self, name=None):
        if not name:
            return self.default()
        query = self.session.query(Price)
        prices = query.filter(Price.project == name).order_by(Price.timestamp.desc())
        template = get_template('prices.mako')
        return template.render(prices=prices,
                               categories=self.categories, alphabet=self.alphabet)
