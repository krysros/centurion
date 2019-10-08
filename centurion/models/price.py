import datetime

from sqlalchemy import (
    Column,
    Integer,
    Unicode,
    Numeric,
    DateTime,
    Text,
    )

from .meta import Base


class Price(Base):
    __tablename__ = 'price'
    id = Column(Integer, primary_key=True)
    name = Column(Unicode(200))
    category = Column(Unicode(20))
    unit = Column(Unicode(10))
    cost = Column(Numeric(precision=10, scale=2))
    currency = Column(Unicode(3))
    company = Column(Unicode(100))
    project = Column(Unicode(100))
    city = Column(Unicode(100))
    description = Column(Text())
    timestamp = Column(DateTime, default=datetime.datetime.now)

    def __init__(self, name, category, unit, cost, currency,
                 company, project, city, description):
        self.name = name
        self.category = category
        self.unit = unit
        self.cost = cost
        self.currency = currency
        self.company = company
        self.project = project
        self.city = city
        self.description = description
