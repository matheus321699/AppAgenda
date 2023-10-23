from app.models.product import Product
from sqlalchemy.orm import Session

class ProductRepository:
    @staticmethod
    def find_all(db: Session) -> list[Product]:
        return db.query(Product).all()

    @staticmethod
    def save(db: Session, product: Product) -> Product:
        if product.id:
            db.merge(product)
        else:
            db.add(product)
        db.commit()
        return product

    @staticmethod
    def find_by_id(db: Session, id: int) -> Product:
        return db.query(Product).filter(Product.id == id).first()

    @staticmethod
    def exists_by_id(db: Session, id: int) -> bool:
        return db.query(Product).filter(Product.id == id).first() is not None

    @staticmethod
    def delete_by_id(db: Session, id: int) -> None:
        company = db.query(Product).filter(Product.id == id).first()
        if company is not None:
            db.delete(company)
            db.commit()

    def find_by_products_for_company(db: Session, id: int) -> None:
        return db.query(Product).filter(Product.id == id).all()
                
    def buy_product(db: Session, id: int, quantity: int) -> None:
        product = find_by_id(db, id)

        if(product.amount == None or product.amount == 0):
            return 
        else:
            product.amount -= quantity
            db.add(product)
            db.commit()          
            return product 