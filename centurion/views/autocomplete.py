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
        - q: optional query string; if not provided, we also look for the
             request param with the same name as the input (htmx may send
             it as a param).
        """
        # Determine attribute and query string from parameters
        if attr is None:
            # try legacy 'name' param
            attr = kwargs.get("name") or "name"

        if q is None:
            # htmx sends input values as params under the input name; try to
            # fall back to request params.
            q = (
                cherrypy.request.params.get("q")
                or cherrypy.request.params.get(attr)
                or ""
            )

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
