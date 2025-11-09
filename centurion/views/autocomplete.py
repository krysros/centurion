import cherrypy
from sqlalchemy import select
from html import escape

from centurion.models import Price


class AutocompleteView(object):
    def __init__(self, session):
        self.session = session

    # Whitelist of fields that are safe to search/return in autocomplete.
    ALLOWED_FIELDS = {"name", "typ", "unit", "currency", "source", "project", "city"}
    MAX_RESULTS = 20

    @cherrypy.expose
    def index(self, attr=None, q=None, **kwargs):
        """Return <option> fragments for the requested attribute.

        Security: only attributes in ALLOWED_FIELDS are permitted. Results
        are limited and values are HTML-escaped before insertion into the
        fragment list.
        """
        if attr is None or attr not in self.ALLOWED_FIELDS:
            return ""

        # If q wasn't provided explicitly, fall back to a parameter named
        # after the attribute (e.g. ?source=ABC). Keep kwargs compatibility
        # for existing callers.
        if q is None:
            q = kwargs.get(attr) or cherrypy.request.params.get(attr)

        if not q:
            return ""

        column = getattr(Price, attr)
        with self.session() as session:
            # Select only the attribute column, distinct, ordered and limited
            # for predictable results and better performance.
            stmt = (
                select(column)
                .filter(column.ilike(f"%{q}%"))
                .distinct()
                .order_by(column)
                .limit(self.MAX_RESULTS)
            )
            results = session.execute(stmt).scalars()
            parts = []
            for val in results:
                if val is None:
                    continue
                text = str(val)
                safe = escape(text)
                parts.append(f'<option value="{safe}"></option>')
            cherrypy.response.headers["Content-Type"] = "text/html; charset=utf-8"
            return "\n".join(parts)
