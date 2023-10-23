from app.database.database import Base
from sqlalchemy import Column, Integer, String

class Collaborator():
    __tablename__ = 'collaborators'
    
    id: int = Column(Integer, primary_key=True, index=True)
    name: str = Column(String(100), nullable=False)
    email: str = Column(String(100), nullable=False)

