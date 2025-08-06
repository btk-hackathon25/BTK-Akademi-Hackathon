from pydantic import BaseModel, EmailStr
from typing import Optional, List
from datetime import datetime


# User schemas
class UserBase(BaseModel):
    email: EmailStr
    username: str
    full_name: Optional[str] = None


class UserCreate(UserBase):
    password: str


class UserUpdate(BaseModel):
    email: Optional[EmailStr] = None
    username: Optional[str] = None
    full_name: Optional[str] = None
    password: Optional[str] = None


class User(UserBase):
    id: int
    is_active: bool
    is_superuser: bool
    created_at: datetime
    updated_at: Optional[datetime] = None
    
    class Config:
        from_attributes = True


# Project schemas
class ProjectBase(BaseModel):
    title: str
    description: Optional[str] = None
    is_public: bool = True


class ProjectCreate(ProjectBase):
    pass


class ProjectUpdate(BaseModel):
    title: Optional[str] = None
    description: Optional[str] = None
    is_public: Optional[bool] = None


class Project(ProjectBase):
    id: int
    user_id: int
    created_at: datetime
    updated_at: Optional[datetime] = None
    
    class Config:
        from_attributes = True


# Token schemas
class Token(BaseModel):
    access_token: str
    token_type: str


class TokenData(BaseModel):
    username: Optional[str] = None


# iOS Response schemas
class HealthResponse(BaseModel):
    status: str
    timestamp: str
    version: str
    platform: str


class APIStatusResponse(BaseModel):
    api_version: str
    database_status: str
    authentication: str
    cors_enabled: bool
    endpoints: dict


class ErrorResponse(BaseModel):
    detail: str
    error_code: Optional[str] = None
    timestamp: str


class SuccessResponse(BaseModel):
    message: str
    data: Optional[dict] = None
    timestamp: str 