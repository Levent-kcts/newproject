# app/models/note.py
# Note tablosu SQLAlchemy modeli

from sqlalchemy import Column, Integer, String, Text
from app.database import Base

class Note(Base):
    __tablename__ = "notes"

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String, index=True)
    content = Column(Text)
    user_id = Column(Integer)
