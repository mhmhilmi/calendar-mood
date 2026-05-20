from fastapi import APIRouter

from app.core.config import get_settings
from app.db.session import check_database

router = APIRouter()


@router.get("/health")
def health_check() -> dict[str, str | bool]:
    settings = get_settings()
    database_ok = check_database()

    return {
        "service": "blocalm-api",
        "environment": settings.environment,
        "ok": database_ok,
        "database": "ok" if database_ok else "unavailable",
    }

