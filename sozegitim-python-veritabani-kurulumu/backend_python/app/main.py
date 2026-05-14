# app/main.py
# Uygulamanın başlangıç noktası

from fastapi import FastAPI
from app.database import engine, Base
from app.models import user, note
from app.api.endpoints.user_router import router as user_router
from app.api.endpoints.word_router import router as word_router
from app.api.endpoints.note_router import router as note_router
from app.api.endpoints.quiz_router import router as quiz_router

# Veritabanında tabloları otomatik oluşturur
Base.metadata.create_all(bind=engine)

app = FastAPI(title="SözEğitim API", version="1.0.0")

# Router'ları kayıt et
app.include_router(user_router, prefix="/api/users", tags=["users"])
app.include_router(word_router, prefix="/api/words", tags=["Words"])
app.include_router(note_router, prefix="/api/notes", tags=["Notes"])
app.include_router(quiz_router, prefix="/api/quiz", tags=["Gamification"])

@app.get("/")
def root():
    return {"message": "SözEğitim Backend Sistemi ve Veritabanı Başarıyla Çalışıyor!"}
