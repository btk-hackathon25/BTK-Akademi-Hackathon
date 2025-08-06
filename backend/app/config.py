import os
from typing import List
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()


class Settings:
    # Database
    database_url: str = os.getenv("DATABASE_URL", "postgresql://username:password@localhost:5432/btk_hackathon_db")
    
    # Security
    secret_key: str = os.getenv("SECRET_KEY", "your-secret-key-here")
    algorithm: str = os.getenv("ALGORITHM", "HS256")
    access_token_expire_minutes: int = int(os.getenv("ACCESS_TOKEN_EXPIRE_MINUTES", "30"))
    
    # API
    api_v1_str: str = os.getenv("API_V1_STR", "/api/v1")
    project_name: str = os.getenv("PROJECT_NAME", "BTK Akademi Hackathon API")
    
    # CORS
    backend_cors_origins: List[str] = os.getenv("BACKEND_CORS_ORIGINS", "http://localhost:3000,http://localhost:8080").split(",")


settings = Settings() 