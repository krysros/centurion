import os
import configparser
import cherrypy
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from centurion.views import Root
from centurion.views import PriceView, CompanyView, ProjectView, CityView, Select2View

db_config = configparser.ConfigParser()
db_config.read('alembic.ini')
connection_string = db_config['alembic']['sqlalchemy.url']
engine = create_engine(connection_string)
Session = sessionmaker(bind=engine, autocommit=True)

if __name__ == '__main__':
    session = Session()

    root = Root()
    root.price = PriceView(session)
    root.company = CompanyView(session)
    root.project = ProjectView(session)
    root.city = CityView(session)
    root.select2 = Select2View(session)

    config = {
        'global': {
            'server.socket_host': '127.0.0.1',
            'server.socket_port': 8080,
            'server.thread_pool': 8,
            'engine.autoreload.on': True,
        },
        '/': {
            'tools.staticdir.root': os.path.abspath(os.getcwd()),
        },
        '/static': {
            'tools.staticdir.on': True,
            'tools.staticdir.dir': 'centurion/public',
        }
    }

    cherrypy.quickstart(root, config=config)
