import cherrypy
from centurion.models import Price


class Select2View(object):
    def __init__(self, session):
        self.session = session

    @cherrypy.expose
    @cherrypy.tools.json_out()
    def index(self, name, q=''):
        query = self.session.query(Price).\
            filter(getattr(Price, name).ilike(f'%{q}%')).\
            group_by(getattr(Price, name))
        results = [{'id': row.id, 'text': getattr(row, name)} for row in query]
        return {'results': results}
