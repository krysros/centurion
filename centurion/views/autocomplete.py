import cherrypy
from sqlalchemy import select

from centurion.models import Price


class AutocompleteView(object):
    def __init__(self, session):
        self.session = session

    @cherrypy.expose
    def index(self, attr=None, q=None, **kwargs):
        """
        Return HTML <option> fragments for the given `attr` (model column).

        Expected params:
        - attr: the model attribute to search (e.g. 'name', 'company')
        - q: optional query string
        """
        if attr is None:
            attr = kwargs.get("name") or "name"

        if q is None:
            q = cherrypy.request.params.get("q", "")

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
                parts.append(f'<option value="{text}" data-id="{row.id}"></option>')
            cherrypy.response.headers["Content-Type"] = "text/html; charset=utf-8"
            return "\n".join(parts)
