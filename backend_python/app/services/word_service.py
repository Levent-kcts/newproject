import requests
from fastapi import HTTPException
from app.schemas.word_schema import WordResponse, Meaning
from deep_translator import GoogleTranslator

class WordService:
    def __init__(self):
        # Sınıf çağrıldığında çevirmeni (İngilizce'den Türkçe'ye) hazırda bekletiyoruz
        self.translator = GoogleTranslator(source='en', target='tr')

    def search_word(self, word: str) -> WordResponse:
        url = f"https://api.dictionaryapi.dev/api/v2/entries/en/{word}"
        response = requests.get(url)
        
        if response.status_code != 200:
            raise HTTPException(status_code=404, detail="Kelime bulunamadı")
            
        data = response.json()[0]
        meanings_list = []
        
        for meaning in data.get("meanings", []):
            part_of_speech = meaning.get("partOfSpeech", "")
            
            # Kelime türlerini arayüz için Türkçeleştiriyoruz
            pos_tr = {
                "noun": "isim",
                "verb": "fiil",
                "adjective": "sıfat",
                "adverb": "zarf",
                "pronoun": "zamir",
                "preposition": "edat",
                "conjunction": "bağlaç",
                "interjection": "ünlem"
            }.get(part_of_speech, part_of_speech)

            definitions = meaning.get("definitions", [])
            
            if definitions:
                first_def = definitions[0]
                eng_definition = first_def.get("definition", "")
                eng_example = first_def.get("example")

                # SADECE anlamı (definition) anlık olarak Türkçeye çeviriyoruz
                tr_definition = self.translator.translate(eng_definition) if eng_definition else ""
                
                meanings_list.append(
                    Meaning(
                        part_of_speech=pos_tr,
                        definition=tr_definition,
                        example=eng_example # İngilizce örneği doğrudan veriyoruz
                    )
                )
                
        original_word = data.get("word", word)
        translated_word = self.translator.translate(original_word)
                
        return WordResponse(
            word=original_word,
            translation=translated_word, # Çevrilen kelimeyi şemaya gönderiyoruz
            phonetic=data.get("phonetic"),
            meanings=meanings_list
        )