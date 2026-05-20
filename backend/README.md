# Blocalm Backend

FastAPI backend scaffold for account, trusted-contact, shared availability, schedule request, shared event, and synchronized notification features.

## Local Development

From the repository root:

```bash
docker compose up --build
```

Expected local services:

| Service | URL |
| --- | --- |
| FastAPI | http://localhost:8000 |
| API docs | http://localhost:8000/docs |
| Health check | http://localhost:8000/api/v1/health |
| PostgreSQL | localhost:5432 |

The Flutter app should use this API base URL during local development:

```text
http://localhost:8000/api/v1
```

On a physical phone, replace `localhost` with the computer's LAN IP address.

