# BTK Akademi Hackathon Backend

Bu proje BTK Akademi Hackathon için geliştirilmiş FastAPI tabanlı backend uygulamasıdır.

## Özellikler

- **FastAPI**: Modern ve hızlı web framework
- **PostgreSQL**: Güçlü ve güvenilir veritabanı
- **SQLAlchemy**: ORM için
- **Alembic**: Veritabanı migration'ları için
- **JWT Authentication**: Güvenli kimlik doğrulama
- **Pydantic**: Veri doğrulama ve serialization
- **CORS**: Cross-origin resource sharing desteği

## Kurulum

### Gereksinimler

- Python 3.8+
- PostgreSQL
- pip

### Adımlar

1. **Repository'yi klonlayın:**
```bash
git clone <repository-url>
cd backend
```

2. **Virtual environment oluşturun:**
```bash
python -m venv venv
# Windows
venv\Scripts\activate
# Linux/Mac
source venv/bin/activate
```

3. **Bağımlılıkları yükleyin:**
```bash
pip install -r requirements.txt
```

4. **Environment dosyasını oluşturun:**
```bash
cp env.example .env
```

5. **Environment değişkenlerini düzenleyin:**
`.env` dosyasını açın ve gerekli değerleri güncelleyin:
- `DATABASE_URL`: PostgreSQL bağlantı URL'i
- `SECRET_KEY`: JWT için güvenli bir secret key
- `BACKEND_CORS_ORIGINS`: CORS için izin verilen origin'ler

6. **PostgreSQL veritabanını oluşturun:**
```sql
CREATE DATABASE btk_hackathon_db;
```

7. **Veritabanı tablolarını oluşturun:**
```bash
python main.py
```

## Çalıştırma

### Development Server

```bash
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

### Production Server

```bash
uvicorn main:app --host 0.0.0.0 --port 8000
```

## API Dokümantasyonu

Uygulama çalıştıktan sonra aşağıdaki URL'lerden API dokümantasyonuna erişebilirsiniz:

- **Swagger UI**: http://localhost:8000/docs
- **ReDoc**: http://localhost:8000/redoc

## API Endpoints

### Authentication
- `POST /api/v1/auth/token` - Kullanıcı girişi
- `POST /api/v1/auth/register` - Kullanıcı kaydı
- `GET /api/v1/auth/me` - Mevcut kullanıcı bilgileri

### Users
- `GET /api/v1/users/` - Tüm kullanıcıları listele
- `GET /api/v1/users/{user_id}` - Kullanıcı detayları
- `PUT /api/v1/users/{user_id}` - Kullanıcı güncelle
- `DELETE /api/v1/users/{user_id}` - Kullanıcı sil

### Projects
- `GET /api/v1/projects/` - Tüm projeleri listele
- `GET /api/v1/projects/my-projects` - Kullanıcının projeleri
- `GET /api/v1/projects/{project_id}` - Proje detayları
- `POST /api/v1/projects/` - Yeni proje oluştur
- `PUT /api/v1/projects/{project_id}` - Proje güncelle
- `DELETE /api/v1/projects/{project_id}` - Proje sil

## Veritabanı Migration'ları

Alembic kullanarak veritabanı migration'larını yönetebilirsiniz:

```bash
# Migration oluştur
alembic revision --autogenerate -m "Description"

# Migration uygula
alembic upgrade head

# Migration durumunu kontrol et
alembic current
```

## Proje Yapısı

```
backend/
├── app/
│   ├── __init__.py
│   ├── config.py          # Uygulama konfigürasyonu
│   ├── database.py        # Veritabanı bağlantısı
│   ├── models.py          # SQLAlchemy modelleri
│   ├── schemas.py         # Pydantic şemaları
│   ├── crud.py           # CRUD işlemleri
│   ├── auth.py           # JWT authentication
│   └── api/
│       ├── __init__.py
│       ├── api.py        # Ana API router
│       └── endpoints/
│           ├── __init__.py
│           ├── auth.py   # Authentication endpoints
│           ├── users.py  # User endpoints
│           └── projects.py # Project endpoints
├── main.py               # Ana uygulama
├── requirements.txt      # Python bağımlılıkları
├── alembic.ini          # Alembic konfigürasyonu
├── env.example          # Environment örneği
└── README.md           # Bu dosya
```

## Katkıda Bulunma

1. Fork yapın
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Commit yapın (`git commit -m 'Add some amazing feature'`)
4. Push yapın (`git push origin feature/amazing-feature`)
5. Pull Request oluşturun

## Lisans

Bu proje MIT lisansı altında lisanslanmıştır. 