from fastapi import APIRouter
from datetime import datetime

router = APIRouter()


@router.get("/health")
async def health_check():
    """
    iOS uygulaması için health check endpoint'i
    """
    return {
        "status": "healthy",
        "timestamp": datetime.utcnow().isoformat(),
        "version": "1.0.0",
        "platform": "iOS"
    }


@router.get("/api-status")
async def api_status():
    """
    API durumu ve versiyon bilgileri
    """
    return {
        "api_version": "v1",
        "database_status": "connected",
        "authentication": "jwt",
        "cors_enabled": True,
        "endpoints": {
            "auth": ["/api/v1/auth/token", "/api/v1/auth/register", "/api/v1/auth/me"],
            "users": ["/api/v1/users/", "/api/v1/users/{user_id}"],
            "projects": ["/api/v1/projects/", "/api/v1/projects/my-projects"]
        }
    } 