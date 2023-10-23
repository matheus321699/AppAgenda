from fastapi import APIRouter, Depends, HTTPException, status, Response
from sqlalchemy.orm import Session

from app.models.collaborator import Collaborator
from app.schemas.collaborator_schemas import CollaboratorRequest, CollaboratorResponse
from app.database.database import engine, Base, get_db
from app.repositories.company_repository import CompanyRepository

Base.metadata.create_all(bind=engine)

router = APIRouter()

@router.post("/collaborator", response_model=CollaboratorResponse, status_code=status.HTTP_201_CREATED)
def create_product(request: CollaboratorRequest, db: Session = Depends(get_db)):
    try:
        collaborator = CompanyRepository.save(db, Collaborator(**request.model_dump()))
    except:
        return collaborator

@router.get("/collaborators")
def find_collaborators(db: Session = Depends(get_db)):
    try:
        collaborators = CompanyRepository.find_all(db)
    except:
        return collaborators