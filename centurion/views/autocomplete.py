import cherrypy
from sqlalchemy import select

from centurion.models import Price


class AutocompleteView(object):
    def __init__(self, session):
        self.session = session

    @cherrypy.expose
    def index(self, attr=None, q=None, **kwargs):
        if attr is None:
            return ""

        if q is None:
            q = kwargs.get(attr)

        with self.session() as session:
            stmt = (
                select(Price)
                .filter(getattr(Price, attr).ilike(f"%{q}%"))
                .group_by(getattr(Price, attr))
            )
            query = session.execute(stmt).scalars()
            parts = []
            for row in query:
                text = getattr(row, attr)
                parts.append(f'<option value="{text}"></option>')
            cherrypy.response.headers["Content-Type"] = "text/html; charset=utf-8"
            return "\n".join(parts)
