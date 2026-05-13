# app/api/endpoints/quiz_router.py
# Quiz işlemleri için router

from fastapi import APIRouter

router = APIRouter(prefix="/quizzes", tags=["quizzes"])

@router.get("/")
def list_quizzes():
    return {"message": "Quiz listesi"}
