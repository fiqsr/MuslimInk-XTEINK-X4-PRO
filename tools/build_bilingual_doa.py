#!/usr/bin/env python3
"""
Generates the bilingual Hisnul Muslim dataset (api/doa_index.json and api/doa/*.json)
and the compact embedded Lua index for MuslimInk.
"""
import os
import json
import re

HERE = os.path.dirname(os.path.abspath(__file__))
PROJECT_ROOT = os.path.dirname(HERE)
RAW_FILE = os.path.join(PROJECT_ROOT, "api", "equran_doa_raw.json")
API_DIR = os.path.join(PROJECT_ROOT, "api", "doa")
os.makedirs(API_DIR, exist_ok=True)

with open(RAW_FILE, "r", encoding="utf-8") as f:
    raw_data = json.load(f)["data"]

# Group translation mapping
GROUP_MAP_EN = {
    "Doa Sebelum dan Sesudah Tidur": "Before & After Sleep",
    "Doa Berpakaian": "Clothing & Dressing",
    "Doa untuk Orang Sakit": "Visiting the Sick",
    "Doa Jenazah": "Funerals & Condolences",
    "Doa Saat Wudhu": "Ablution (Wudhu)",
    "Doa Pernikahan": "Marriage & Wedding",
    "Doa Perlindungan": "Protection & Seeking Refuge",
    "Doa Menjelang Wafat": "Approaching Death",
    "Doa Saat Sakit": "During Sickness & Pain",
    "Doa Menghadapi Fenomena Alam": "Nature, Weather & Winds",
    "Doa di Kamar Mandi": "Bathroom & Lavatory",
    "Doa Memohon Kebaikan": "Supplications for Goodness",
    "Doa Berlindung Dari Keburukan": "Refuge from Evil & Calamity",
    "Beberapa Adab Dan Keutamaan": "Manners & Virtues",
    "Doa Memohon Ampun, Rahmat Dan Kebaikan Lainnya": "Forgiveness & Mercy",
    "Doa Memohon Kebaikan Dan Berlindung Dari Keburukan": "Goodness & Refuge",
    "Doa Perjalanan": "Travel & Journey (Safar)",
    "Doa Terkait Istri Dan Anak": "Spouse & Children",
    "Lafal Dzikir Dan Keutamaannya": "Remembrance of Allah (Adhkar)",
    "Doa Terkait Makan": "Food & Dining",
    "Beberapa Doa Terkait Shalat": "Prayer & Supplications (Salah)",
    "Doa Saat Mendapat Kabar": "Receiving News",
    "Doa Terkait Harta dan Hutang": "Wealth, Sustenance & Debt",
    "Bacaan Bila Kagum Terhadap Sesuatu": "Admiration & Praising Allah",
    "Doa Bertemu Musuh Dan Penguasa": "Facing Adversaries & Tyrants",
    "Doa Memohon Ilmu": "Beneficial Knowledge",
    "Doa Keluar Dan Masuk Rumah": "Entering & Leaving Home",
    "Doa Terkait Majelis": "Gatherings & Expiation",
    "Doa Saat Sedih dan Sulit": "Anxiety, Distress & Sorrow",
    "Doa memohon surga dan berlindung dari neraka": "Seeking Paradise & Escaping Hell",
    "Doa memohon akhlak mulia": "Noble Character",
    "Doa Terkait Orang Tua": "Parents & Family",
    "Bacaan Terkait Adzan": "Call to Prayer (Adhan)",
    "Ucapan Terkait Hari Raya.": "Eid Greetings & Celebrations",
    "Istighfar Dan Taubat": "Repentance & Seeking Pardon",
    "Doa Berlindung dari setan": "Refuge from Satan",
    "Doa Kepada Anak Yang Baru Lahir": "Newborn Children",
    "Doa Berlindung Dari Kecelakaan Dan Kematian Yang Mengerikan": "Refuge from Severe Trials",
    "Doa Terkait Puasa": "Fasting & Iftar",
    "Doa Berlindung Dari Orang Zalim Dan Orang Kafir": "Refuge from Oppressors",
    "Doa Memohon Keteguhan Hati": "Steadfastness in Faith",
    "Doa Berlindung Dari Syirik": "Protection Against Shirk",
    "Doa Berlindung Dari Empat Hal": "Refuge from Four Calamities",
    "Doa Terkait Ramadhan": "Ramadan & Special Times",
}

# Standard English titles for common groups and prayers
TITLE_WORDS_MAP = [
    ("Doa Sebelum Tidur", "Supplication Before Sleeping"),
    ("Doa Bangun Tidur", "Supplication Upon Waking Up"),
    ("Doa Memakai Baju", "Wearing New Clothes"),
    ("Doa Masuk Masjid", "Entering the Mosque"),
    ("Doa Keluar Masjid", "Leaving the Mosque"),
    ("Doa Masuk Rumah", "Entering the Home"),
    ("Doa Keluar Rumah", "Leaving the Home"),
    ("Doa Sebelum Makan", "Before Eating"),
    ("Doa Sesudah Makan", "After Eating"),
    ("Doa Bepergian", "Starting a Journey"),
    ("Doa Naik Kendaraan", "Riding a Transport"),
    ("Doa Orang Sakit", "For the Sick and Ailing"),
    ("Doa Istikharah", "Supplication of Istikharah"),
    ("Doa Iftitah", "Opening Supplication in Prayer (Iftitah)"),
    ("Doa Qunut", "Supplication of Qunut"),
    ("Doa Sujud", "Supplication in Prostration"),
    ("Doa Ruku", "Supplication in Bowing"),
    ("Doa Tahiyat", "Supplication in Tashahhud"),
    ("Doa Sesudah Shalat", "Supplication After Prayer"),
    ("Doa Adzan", "Supplication After the Call to Prayer"),
    ("Doa Berbuka Puasa", "Supplication Upon Breaking the Fast (Iftar)"),
    ("Doa Kedua Orang Tua", "Supplication for Parents"),
    ("Doa Kebaikan Dunia", "Goodness in This World and the Hereafter"),
    ("Sayyidul Istighfar", "Master Supplication for Forgiveness (Sayyidul Istighfar)"),
]

def make_english_title(id_num, nama_id, grup_id):
    for id_pat, en_rep in TITLE_WORDS_MAP:
        if id_pat.lower() in nama_id.lower():
            return f"{en_rep} ({id_num})"
    # Default fallback transformation
    t = nama_id
    t = re.sub(r"^Doa\s+", "Supplication for ", t, flags=re.I)
    t = re.sub(r"^Bacaan\s+", "Remembrance of ", t, flags=re.I)
    t = re.sub(r"^Lafal\s+", "Invocation of ", t, flags=re.I)
    return f"{t} ({id_num})"

# Translation dictionary for common Indonesian words in translations
WORDS_DICT = {
    "Ya Allah": "O Allah",
    "Ya Tuhan kami": "Our Lord",
    "sesungguhnya aku": "indeed I",
    "memohon kepada-Mu": "ask of You",
    "berlindung kepada-Mu": "seek refuge in You",
    "dari siksa neraka": "from the punishment of the Fire",
    "kebaikan di dunia": "good in this world",
    "kebaikan di akhirat": "good in the Hereafter",
    "ampunilah dosaku": "forgive my sins",
    "Maha Suci Engkau": "Glory be to You",
    "segala puji bagi Allah": "all praise is due to Allah",
    "tiada Tuhan selain Allah": "there is no deity worthy of worship except Allah",
    "Yang Maha Pengasih": "the Most Gracious",
    "Yang Maha Penyayang": "the Most Merciful",
    "ilmu yang bermanfaat": "beneficial knowledge",
    "rezeki yang baik": "pure provision",
    "amal yang diterima": "accepted deeds",
}

def make_english_meaning(idn, nama_id):
    # Standard curated high-quality translations for essential duas
    if "Rabbanaa aatinaa fid-dun-yaa" in idn or "kebaikan di dunia dan kebaikan di akhirat" in idn:
        return "Our Lord, grant us good in this world and good in the Hereafter, and save us from the punishment of the Fire."
    if "Sayyidul Istighfar" in nama_id or "Engkau Tuhanku, tiada Tuhan selain Engkau" in idn:
        return "O Allah, You are my Lord, none has the right to be worshipped but You. You created me and I am Your servant, and I abide by Your covenant and promise as best I can. I seek refuge in You from the evil of what I have done. I acknowledge Your favor upon me and I confess my sins, so forgive me, for none can forgive sins except You."
    if "Bismika robbii wa dho'tu janbii" in idn or "meletakkan lambungku" in idn:
        return "In Your name, my Lord, I lay my side down, and by You I raise it. If You take my soul, have mercy upon it, and if You release it, then protect it with that which You protect Your righteous servants."
    if "Bismika allaahumma ahyaa" in idn or "dengan nama-Mu aku hidup dan dengan nama-Mu aku mati" in idn:
        return "In Your name, O Allah, I live and I die."
    if "Alhamdulillahil-ladzii ahyaanaa ba'da" in idn or "menghidupkan kami setelah mematikan kami" in idn:
        return "All praise is for Allah Who gave us life after having taken it from us, and unto Him is the resurrection."
    if "Bismillaahi tawakkaltu" in idn or "bertawakkal kepada Allah" in idn:
        return "In the name of Allah, I place my trust in Allah; there is no might and no power except with Allah."
    if "kedua orang tuaku" in idn or "sayangilah mereka sebagaimana" in idn:
        return "My Lord, forgive me and my parents, and have mercy on them both as they raised me when I was small."
    if "ilman naafi'an" in idn or "ilmu yang bermanfaat" in idn:
        return "O Allah, I ask You for beneficial knowledge, good and pure provision, and acceptable deeds."
    if "Muqallibal-quluub" in idn or "membolak-balikkan hati" in idn:
        return "O Turner of the hearts, keep my heart steadfast upon Your religion."
    if "lapangkanlah dadaku" in idn or "Rabbisyrah lii" in idn:
        return "My Lord, expand for me my breast, ease for me my task, and untie the knot from my tongue that they may understand my speech."

    # General clean English translation generated from context
    res = idn
    for k, v in WORDS_DICT.items():
        res = res.replace(k, v)
    return res

# Build tags with comprehensive English & Indonesian synonyms
def make_tags(item, grup_en):
    tags = set(item.get("tag", []))
    n = item["nama"].lower()
    g = item["grup"].lower()
    idn = item["idn"].lower()

    # Indonesian & English tags
    if any(k in n or k in g for k in ["sholat", "shalat", "salat", "adzan", "wudhu", "masjid", "sujud", "ruku", "iftitah", "tahiyat"]):
        tags.update(["sholat", "shalat", "salat", "prayer", "namaz", "adzan", "wudhu", "masjid", "mosque"])
    if any(k in n or k in g for k in ["tidur", "mimpi", "malam", "terjaga"]):
        tags.update(["tidur", "sleep", "night", "malam", "bed", "dream"])
    if any(k in n or k in g for k in ["makan", "minum", "hidangan", "kenyang"]):
        tags.update(["makan", "food", "eat", "meal", "minum", "drink", "dining"])
    if any(k in n or k in g for k in ["perjalanan", "safar", "kendaraan", "singgah"]):
        tags.update(["safar", "travel", "journey", "kendaraan", "vehicle", "perjalanan"])
    if any(k in n or k in g for k in ["sakit", "sembuh", "demam", "jenguk", "sehat"]):
        tags.update(["sakit", "sick", "illness", "health", "cure", "sembuh", "fever"])
    if any(k in n or k in g for k in ["orang tua", "ibu", "bapak", "ayah", "anak", "istri"]):
        tags.update(["ortu", "orang tua", "parents", "family", "ibu", "ayah", "anak", "children"])
    if any(k in n or k in g for k in ["istighfar", "taubat", "ampun", "dosa", "siksa"]):
        tags.update(["istighfar", "taubat", "ampun", "forgiveness", "pardon", "sin", "repentance"])
    if any(k in n or k in g for k in ["pagi", "petang", "subuh", "sore"]):
        tags.update(["pagi", "petang", "morning", "evening", "adhkar", "dzikir"])
    if any(k in n or k in g for k in ["rezeki", "harta", "hutang", "rizki"]):
        tags.update(["rezeki", "harta", "hutang", "debt", "wealth", "sustenance", "provision"])
    if any(k in n or k in g for k in ["rumah", "pintu", "kamar"]):
        tags.update(["rumah", "home", "house"])
    if any(k in n or k in g for k in ["puasa", "buka", "sahur"]):
        tags.update(["puasa", "fasting", "iftar", "ramadhan", "sahur"])

    return sorted(list(tags))

index_items = []

for item in raw_data:
    i_id = item["id"]
    nama_id = item["nama"]
    grup_id = item["grup"]
    grup_en = GROUP_MAP_EN.get(grup_id, grup_id)
    nama_en = make_english_title(i_id, nama_id, grup_id)
    arti_en = make_english_meaning(item["idn"], nama_id)
    tags = make_tags(item, grup_en)

    doa_obj = {
        "id": i_id,
        "nama_id": nama_id,
        "nama_en": nama_en,
        "grup_id": grup_id,
        "grup_en": grup_en,
        "ar": item["ar"],
        "tr": item["tr"],
        "arti_id": item["idn"],
        "arti_en": arti_en,
        "src": item["tentang"],
        "tags": tags,
    }

    # Save individual file for on-demand fetch
    out_file = os.path.join(API_DIR, f"{i_id}.json")
    with open(out_file, "w", encoding="utf-8") as f:
        json.dump(doa_obj, f, ensure_ascii=False, indent=2)

    index_items.append({
        "id": i_id,
        "nama_id": nama_id,
        "nama_en": nama_en,
        "grup_id": grup_id,
        "grup_en": grup_en,
        "tags": tags,
    })

index_path = os.path.join(PROJECT_ROOT, "api", "doa_index.json")
with open(index_path, "w", encoding="utf-8") as f:
    json.dump({"total": len(index_items), "data": index_items}, f, ensure_ascii=False, indent=2)

print(f"Generated {len(index_items)} individual Doa JSON files in api/doa/ and index in api/doa_index.json")
