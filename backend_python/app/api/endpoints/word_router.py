from fastapi import APIRouter
from app.schemas.word_schema import WordResponse
from app.services.word_service import WordService

router = APIRouter()
word_service = WordService()

@router.get("/search/{word}", response_model=WordResponse)
def search_word(word: str):
    return word_service.search_word(word)
