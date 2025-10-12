import datetime
from decimal import Decimal
from typing import Optional

from sqlalchemy import Integer, Numeric
from sqlalchemy.orm import declarative_base, Mapped, mapped_column

Base = declarative_base()


class Price(Base):
    __tablename__ = "price"

    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    name: Mapped[str]
    category: Mapped[str]
    unit: Mapped[str]
    cost: Mapped[Decimal] = mapped_column(Numeric(precision=10, scale=2), nullable=False)
    currency: Mapped[str]
    company: Mapped[str]
    project: Mapped[str]
    city: Mapped[str]
    description: Mapped[Optional[str]]
    timestamp: Mapped[datetime.datetime] = mapped_column(default=datetime.datetime.now)

    def __repr__(self) -> str:  # helpful for debugging
        return f"<Price(id={self.id!r}, name={self.name!r}, cost={self.cost!r})>"
