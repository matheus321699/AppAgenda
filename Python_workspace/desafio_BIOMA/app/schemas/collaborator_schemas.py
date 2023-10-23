from pydantic import BaseModel

class CollaboratorBase(BaseModel):
    id: int
    name: str
    email: str

class CollaboratorRequest(CollaboratorBase):
    ...

class CollaboratorResponse(CollaboratorBase):
    id: int

    class Config:
        orm_mode = True