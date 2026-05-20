from functools import lru_cache

from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    environment: str = "development"
    database_url: str = (
        "postgresql+psycopg://blocalm:blocalm_dev_password@localhost:5432/blocalm"
    )
    auth_secret: str = "change-me-in-real-development"
    access_token_ttl_minutes: int = 60
    cors_allowed_origins: str = (
        "http://localhost:3000,http://localhost:5173,http://localhost:8000"
    )

    model_config = SettingsConfigDict(
        env_file=".env",
        env_file_encoding="utf-8",
        extra="ignore",
    )

    @property
    def cors_allowed_origins_list(self) -> list[str]:
        return [
            origin.strip()
            for origin in self.cors_allowed_origins.split(",")
            if origin.strip()
        ]


@lru_cache
def get_settings() -> Settings:
    return Settings()

