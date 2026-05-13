# app/schemas/note_schema.py
# Note verisi için Pydantic şeması

from pydantic import BaseModel

class NoteSchema(BaseModel):
    id: int
    title: str
    content: str
    user_id: int

    class Config:
        orm_mode = True
