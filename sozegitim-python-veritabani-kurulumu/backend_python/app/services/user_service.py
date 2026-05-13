# app/services/user_service.py
# User iş mantığı burada olacak

from sqlalchemy.orm import Session
from app.repository.user_repository import UserRepository
from app.schemas.user_schema import UserCreate
from passlib.context import CryptContext

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")
user_repo = UserRepository()

class UserService:
    def get_password_hash(self, password: str) -> str:
        return pwd_context.hash(password)

    def register_user(self, db: Session, user: UserCreate):
        if user_repo.get_user_by_email(db, user.email):
            raise ValueError("Email already registered")

        if user_repo.get_user_by_username(db, user.username):
            raise ValueError("Username already taken")

        hashed_pw = self.get_password_hash(user.password)
        return user_repo.create_user(db, user, hashed_pw)
