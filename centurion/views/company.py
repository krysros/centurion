import cherrypy
from sqlalchemy import select

from centurion.lookup import get_template
from centurion.models import Price
from centurion.views import BaseView


class CompanyView(BaseView):
    def __init__(self, session):
        super().__init__(session)

    @cherrypy.expose
    def index(self, name=None):
        if not name:
            return self.default()
        with self.session() as session:
            prices = session.execute(
                select(Price)
                .filter(Price.company == name)
                .order_by(Price.timestamp.desc())
            ).scalars()
            template = get_template("prices.mako")
            return template.render(prices=prices, categories=self.categories)
