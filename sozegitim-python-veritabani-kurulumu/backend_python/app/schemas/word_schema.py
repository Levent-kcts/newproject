from pydantic import BaseModel
from typing import List, Optional

class Meaning(BaseModel):
    part_of_speech: str
    definition: str
    example: Optional[str] = None

class WordResponse(BaseModel):
    word: str
    translation: str
    phonetic: Optional[str] = None
    meanings: List[Meaning]