# app/main.py
# Uygulamanın başlangıç noktası

from fastapi import FastAPI
from app.database import engine, Base
from app.models import user

# Veritabanında tabloları otomatik oluşturur
Base.metadata.create_all(bind=engine)

app = FastAPI(title="SözEğitim API", version="1.0.0")

@app.get("/")
def root():
    return {"message": "SözEğitim Backend Sistemi ve Veritabanı Başarıyla Çalışıyor!"}
