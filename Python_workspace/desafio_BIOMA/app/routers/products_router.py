from fastapi import APIRouter, Depends, HTTPException, status, Response
from sqlalchemy.orm import Session

from app.models.product import Product
from app.schemas.product_schemas import ProductRequest, ProductResponse
from app.database.database import engine, Base, get_db
from app.repositories.product_repository import ProductRepository

Base.metadata.create_all(bind=engine)

router = APIRouter()

@router.post("/product", response_model=ProductResponse, status_code=status.HTTP_201_CREATED)
def create_product(request: ProductRequest, db: Session = Depends(get_db)):

    try:
        product = ProductRepository.save(db, Product(**request.model_dump()))
    except:
        return product

@router.get("/products")
def find_collaborators(db: Session = Depends(get_db)):
    try:
        products = ProductRepository.find_all(db)
    except:
        return products

@router.get("/product/buy/{id}/{quantity}")
def buy_product(id: int, quantity: int, db: Session = Depends(get_db)):    
    product = ProductRepository.buy_product(db, id, quantity)
    return product
