from app.database.database import Base
from sqlalchemy import Column, Integer, String

class Product():
    __table__ = 'products'
    id: int = Column(Integer, primary_key=True, index=True)
    name: str = Column(String(100), nullable=False)
    description: str = Column(String(100), nullable=False)
    amount: int = Column(Integer, nullable=False)
