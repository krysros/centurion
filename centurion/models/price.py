import datetime
from decimal import Decimal
from typing import Optional

from sqlalchemy import Integer, Numeric
from sqlalchemy.orm import Mapped, declarative_base, mapped_column

Base = declarative_base()


class Price(Base):
    __tablename__ = "price"

    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    name: Mapped[str]
    typ: Mapped[str]
    unit: Mapped[str]
    cost: Mapped[Decimal] = mapped_column(
        Numeric(precision=10, scale=2), nullable=False
    )
    currency: Mapped[str]
    source: Mapped[str]
    project: Mapped[str]
    city: Mapped[str]
    description: Mapped[Optional[str]]
    timestamp: Mapped[datetime.datetime] = mapped_column(default=datetime.datetime.now)
