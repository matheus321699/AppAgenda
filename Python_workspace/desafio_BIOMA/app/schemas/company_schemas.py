from pydantic import BaseModel

class CompanyBase(BaseModel):
    id: int
    name: str
    cnpj: str
    description: str

class CompanyRequest(CompanyBase):
    ...

class CompanyResponse(CompanyBase):
    id: int

    class Config:
        orm_mode = True