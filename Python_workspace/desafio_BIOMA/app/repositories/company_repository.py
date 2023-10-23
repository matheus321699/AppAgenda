from app.models.company import Company
from sqlalchemy.orm import Session

class CompanyRepository:
    @staticmethod
    def find_all(db: Session) -> list[Company]:
        return db.query(Company).all()

    @staticmethod
    def save(db: Session, company: Company) -> Company:
        if company.id:
            db.merge(company)
        else:
            db.add(company)
        db.commit()
        return company

    @staticmethod
    def find_by_id(db: Session, id: int) -> Company:
        return db.query(Company).filter(Company.id == id).first()

    @staticmethod
    def exists_by_id(db: Session, id: int) -> bool:
        return db.query(Company).filter(Company.id == id).first() is not None
    
    def find_by_products_for_company(db: Session, id: int) -> None:
        return db.query(Company).filter(Company.id == id).all()

    @staticmethod
    def delete_by_id(db: Session, id: int) -> None:
        company = db.query(Company).filter(Company.id == id).first()
        if company is not None:
            db.delete(company)
            db.commit()