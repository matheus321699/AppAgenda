from fastapi import APIRouter, Depends, HTTPException, status, Response
from sqlalchemy.orm import Session

from app.models.company import Company
from app.schemas.company_schemas import CompanyRequest, CompanyResponse
from app.database.database import engine, Base, get_db
from app.repositories.company_repository import CompanyRepository

Base.metadata.create_all(bind=engine)

router = APIRouter()

products = []

@router.post("/company", response_model=CompanyResponse, status_code=status.HTTP_201_CREATED)
def create_product(request: CompanyRequest, db: Session = Depends(get_db)):

    try:
        company = CompanyRepository.save(db, Company(**request.model_dump()))
    except:
        return company