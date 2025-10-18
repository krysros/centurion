import cherrypy
from sqlalchemy import select

from centurion.forms import InputDict, PriceForm, SelectForm
from centurion.lookup import get_template
from centurion.models import Price
from centurion.views import BaseView


class PriceView(BaseView):
    def __init__(self, session):
        super().__init__(session)

    @cherrypy.expose
    def add(self, **kwargs):
        form = PriceForm(InputDict(kwargs))
        if cherrypy.request.method == "POST" and form.validate():
            item = Price(**kwargs)
            form.populate_obj(item)
            with self.session() as session:
                session.add(item)
                session.commit()
            raise cherrypy.HTTPRedirect("/price/browse")
        template = get_template("new_price.mako")
        return template.render(form=form)

    @cherrypy.expose
    def delete(self, id):
        with self.session() as session:
            price = session.get(Price, int(id))
            if not price:
                return self.default()
            session.delete(price)
            session.commit()
            raise cherrypy.HTTPRedirect("/")

    @cherrypy.expose
    def display(self, id):
        with self.session() as session:
            price = session.get(Price, int(id))
            if not price:
                return self.default()
            template = get_template("display.mako")
            return template.render(price=price, categories=self.categories)

    @cherrypy.expose
    def browse(self, sort="timestamp"):
        with self.session() as session:
            prices = session.execute(
                select(Price).order_by(getattr(Price, sort).desc())
            ).scalars()
            template = get_template("prices.mako")
            return template.render(prices=prices, categories=self.categories)

    @cherrypy.expose
    def search(self, q=None):
        with self.session() as session:
            prices = session.execute(
                select(Price)
                .filter(Price.name.ilike("%" + q + "%"))
                .order_by(Price.name)
            ).scalars()
            template = get_template("prices.mako")
            return template.render(prices=prices, categories=self.categories)

    @cherrypy.expose
    def select(self, **kwargs):
        form = SelectForm(InputDict(kwargs))
        if cherrypy.request.method == "POST":
            # Use the visible text inputs submitted by the client.
            data = {
                "name": form.name.data,
                "category": form.category.data,
                "unit": form.unit.data,
                "currency": form.currency.data,
                "company": form.company.data,
                "project": form.project.data,
                "city": form.city.data,
            }
            criterion = [getattr(Price, k) == v for k, v in data.items() if v]
            with self.session() as session:
                prices = session.execute(select(Price).filter(*criterion)).scalars()
                template = get_template("prices.mako")
                return template.render(prices=prices, categories=self.categories)
        template = get_template("select.mako")
        return template.render(form=form)
