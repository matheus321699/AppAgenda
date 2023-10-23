from app.database.database import Base
from sqlalchemy import Column, Integer, String, ForeignKey

class Company():
    __table__ = 'companies'
    Id_collaborator = Column(Integer, ForeignKey("id_collaborator"))
    id: int = Column(Integer, primary_key=True, index=True)
    name: str = Column(String(100), nullable=False)
    cnpj: str = Column(String(17), nullable=False)
    description: str = Column(String(100), nullable=False)