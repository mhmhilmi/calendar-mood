from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.api.routes_health import router as health_router
from app.core.config import get_settings


settings = get_settings()

app = FastAPI(
    title="Blocalm API",
    version="0.1.0",
    description="Backend API for Blocalm shared scheduling features.",
    openapi_url="/api/v1/openapi.json",
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.cors_allowed_origins_list,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(health_router, prefix="/api/v1", tags=["health"])


@app.get("/")
def read_root() -> dict[str, str]:
    return {
        "name": "Blocalm API",
        "docs": "/docs",
        "health": "/api/v1/health",
    }

