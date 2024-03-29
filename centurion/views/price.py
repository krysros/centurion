import cherrypy
from sqlalchemy import select
from centurion.lookup import get_template
from centurion.models import Price
from centurion.forms import InputDict, PriceForm, SelectForm
from centurion.views import BaseView


class PriceView(BaseView):
    def __init__(self, session):
        super().__init__(session)

    @cherrypy.expose
    def add(self, **kwargs):
        form = PriceForm(InputDict(kwargs))
        if cherrypy.request.method == 'POST' and form.validate():
            item = Price(**kwargs)
            form.populate_obj(item)
            with self.session(future=True) as session:
                session.add(item)
                session.commit()
            raise cherrypy.HTTPRedirect('/price/browse')
        template = get_template('new_price.mako')
        return template.render(form=form)

    @cherrypy.expose
    def delete(self, id):
        with self.session(future=True) as session:
            price = session.execute(
                select(Price).filter_by(id=id)
            ).scalar_one_or_none()
            if not price:
                return self.default()
            session.delete(price)
            session.commit()
            raise cherrypy.HTTPRedirect('/')

    @cherrypy.expose
    def display(self, id):
        with self.session(future=True) as session:
            price = session.execute(
                select(Price).filter_by(id=id)
            ).scalar_one_or_none()
            if not price:
                return self.default()
            template = get_template('display.mako')
            return template.render(price=price, categories=self.categories)

    @cherrypy.expose
    def browse(self, sort='timestamp'):
        with self.session(future=True) as session:
            prices = session.execute(
                select(Price).order_by(getattr(Price, sort).desc())
            ).scalars()
            template = get_template('prices.mako')
            return template.render(prices=prices, categories=self.categories)

    @cherrypy.expose
    def search(self, q=None):
        with self.session(future=True) as session:
            prices = session.execute(
                select(Price).filter(Price.name.ilike('%' + q + '%')).order_by(Price.name)
            ).scalars()
            template = get_template('prices.mako')
            return template.render(prices=prices, categories=self.categories)

    @cherrypy.expose
    def select(self, **kwargs):
        form = SelectForm(InputDict(kwargs))
        if cherrypy.request.method == 'POST':
            data = {
                'name': form.hidden_name.data,
                'category': form.hidden_category.data,
                'unit': form.hidden_unit.data,
                'currency': form.hidden_currency.data,
                'company': form.hidden_company.data,
                'project': form.hidden_project.data,
                'city': form.hidden_city.data,
            }
            criterion = [getattr(Price, k) == v for k, v in data.items() if v]
            with self.session(future=True) as session:
                prices = session.execute(
                    select(Price).filter(*criterion)
                ).scalars()
                template = get_template('prices.mako')
                return template.render(prices=prices, categories=self.categories)
        template = get_template('select.mako')
        return template.render(form=form)
