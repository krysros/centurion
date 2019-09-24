import string
import cherrypy
from centurion.lookup import get_template
from centurion.models import Price
from centurion.forms import InputDict, PriceForm, SelectForm, CATEGORIES


class PriceView(object):
    def __init__(self, session):
        self.session = session
        self.categories = dict(CATEGORIES)
        self.alphabet = list(string.ascii_lowercase)

    @cherrypy.expose
    def default(self, *args, **kwargs):
        template = get_template('notfound.mako')
        return template.render()

    @cherrypy.expose
    def add(self, **kwargs):
        form = PriceForm(InputDict(kwargs))
        if cherrypy.request.method == 'POST' and form.validate():
            item = Price(**kwargs)
            form.populate_obj(item)
            self.session.add(item)
            raise cherrypy.HTTPRedirect('/price/browse')
        template = get_template('new_price.mako')
        return template.render(form=form)

    @cherrypy.expose
    def delete(self, id):
        query = self.session.query(Price)
        price = query.filter_by(id=id).one_or_none()
        if not price:
            return self.default()
        self.session.delete(price)
        raise cherrypy.HTTPRedirect('/price/browse')

    @cherrypy.expose
    def display(self, id):
        query = self.session.query(Price)
        price = query.filter_by(id=id).one_or_none()
        if not price:
            return self.default()
        template = get_template('display.mako')
        return template.render(price=price, categories=self.categories)

    @cherrypy.expose
    def browse(self, active='a'):
        query = self.session.query(Price)
        prices = query.filter(Price.name.ilike(active.lower() + '%')).\
            order_by(Price.name)
        template = get_template('prices.mako')
        return template.render(prices=prices, active=active,
                               categories=self.categories, alphabet=self.alphabet)

    @cherrypy.expose
    def search(self, q=None):
        query = self.session.query(Price)
        prices = query.filter(Price.name.ilike('%' + q + '%')).\
            order_by(Price.name)
        template = get_template('prices.mako')
        return template.render(prices=prices,
                               categories=self.categories, alphabet=self.alphabet)

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
            query = self.session.query(Price)
            prices = query.filter(*criterion)
            template = get_template('results.mako')
            return template.render(smalltext='', header='Wyniki',
                                   prices=prices, categories=self.categories)
        template = get_template('select.mako')
        return template.render(form=form)