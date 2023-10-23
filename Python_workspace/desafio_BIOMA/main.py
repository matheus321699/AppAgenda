from fastapi import FastAPI
from app.routers.collaborators_router import router as collaborators_router
from app.routers.companies_router import router as companies_router
from app.routers.products_router import router as products_router
from app.routers.users_authentication_router import router as users_authentication_router


app = FastAPI()

app.include_router(collaborators_router)
app.include_router(companies_router)
app.include_router(products_router)
app.include_router(users_authentication_router)