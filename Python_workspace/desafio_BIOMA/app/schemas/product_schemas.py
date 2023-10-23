from pydantic import BaseModel

class ProductBase(BaseModel):
    id: int
    name: str
    description: str
    amount: float

class ProductRequest(ProductBase):
    ...

class ProductResponse(ProductBase):
    id: int

    class Config:
        orm_mode = True