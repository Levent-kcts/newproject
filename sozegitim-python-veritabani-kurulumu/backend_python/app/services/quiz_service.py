# app/services/quiz_service.py
# Quiz iş mantığı burada olacak

from typing import List

from app.repository.quiz_repository import QuizRepository

class QuizService:
    def __init__(self, repository: QuizRepository):
        self.repository = repository

    def get_quizzes(self) -> List[dict]:
        return self.repository.list_quizzes()
