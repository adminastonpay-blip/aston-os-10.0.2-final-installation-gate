# ASTON OS 8.2 — Cloudflare Enterprise Edge Intelligence

ASTON OS is a Cloudflare-first AI orchestration runtime for Shopify/web experiences, multimedia generation, live media control, automation and auditable application services.

## Important: no fake provisioning

This repository contains configuration templates and code. It does not contain Cloudflare account IDs, API tokens, AI Gateway credentials, Turnstile secrets or production resource IDs.

Do not commit secrets.

## Core capabilities

- Cloudflare Workers runtime
- Workers AI model routing
- AI Gateway metadata/routing boundary
- bounded AI fallback cascades
- streaming-ready chat responses
- TTS/voice endpoints
- image generation endpoint
- vision/moderation
- video generation through Workflows
- streaming R2 writes
- Durable Object rate limiting
- Durable Object sessions
- D1 audit/data layer
- Queues for background events
- Cloudflare Stream API adapter for live video
- Turnstile verification hook
- WAF/edge-security deployment guide
- GitHub CI, CodeQL and dependency review
- Wrangler dry-run before deployment

## Vectorize deliberately disabled

The vector index integration has been removed from the core deployment. There is no Vectorize binding or index prerequisite. This is deliberate: a repository must not fail deployment because it references an index that has not been provisioned in the target Cloudflare account.

Vectorize/AI Search can be added later as an explicitly provisioned feature.

## Cloudflare resources

Required for the core AI runtime:

- Worker
- Workers AI binding
- D1 database
- R2 bucket
- Durable Object migrations
- Queue(s)
- Workflow

Optional/feature-gated:

- KV
- Cloudflare Stream
- Turnstile
- WAF/rate-limiting rules
- Hyperdrive
- Vectorize
- AI Search
- Browser Rendering
- Workers for Platforms
- Dynamic Workers
- Sandboxes

## GitHub safety pipeline

Run locally:

```bash
npm ci
npm run check
npm test
npm run dry-run
```

The CI pipeline runs syntax checks, tests and `wrangler deploy --dry-run`. A real production deployment must be an explicit CI environment operation with narrowly scoped Cloudflare credentials.

## Environments

- `staging`: preview/test Worker.
- `production`: production Worker.

Resource IDs and secrets belong in Cloudflare/GitHub environment secrets, not in `wrangler.toml` or source code.

## Architecture

See:

- `docs/ARCHITECTURE.md`
- `docs/CLOUDFLARE-CAPABILITY-MATRIX.md`
- `docs/EDGE-SECURITY.md`
- `docs/OPERATIONS.md`


## GitHub installation hardening (8.2.1)
The CI workflow is intentionally lock-aware: it uses `npm ci` when `package-lock.json` exists and falls back to `npm install` with an explicit warning when the lockfile is absent. This prevents the repository from failing immediately at the dependency-install stage. For deterministic production CI, generate and commit `package-lock.json`, then CI will use `npm ci`.
