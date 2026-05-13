# app/api/endpoints/word_router.py
# Word işlemleri için router

from fastapi import APIRouter

router = APIRouter(prefix="/words", tags=["words"])

@router.get("/")
def list_words():
    return {"message": "Kelime listesi"}
