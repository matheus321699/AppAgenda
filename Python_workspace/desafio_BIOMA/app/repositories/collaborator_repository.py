from app.models.collaborator import Collaborator
from sqlalchemy.orm import Session

class CollaboratorRepository:
    @staticmethod
    def find_all(db: Session) -> list[Collaborator]:
        return db.query(Collaborator).all()

    @staticmethod
    def save(db: Session, collaborator: Collaborator) -> Collaborator:
        if collaborator.id:
            db.merge(collaborator)
        else:
            db.add(collaborator)
        db.commit()
        return collaborator

    @staticmethod
    def find_by_id(db: Session, id: int) -> Collaborator:
        return db.query(Collaborator).filter(Collaborator.id == id).first()

    @staticmethod
    def exists_by_id(db: Session, id: int) -> bool:
        return db.query(Collaborator).filter(Collaborator.id == id).first() is not None

    @staticmethod
    def delete_by_id(db: Session, id: int) -> None:
        collaborator = db.query(Collaborator).filter(Collaborator.id == id).first()
        if collaborator is not None:
            db.delete(collaborator)
            db.commit()