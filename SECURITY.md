# Security policy

- No secrets, Cloudflare tokens, payment data or API keys belong in Git.
- Production Cloudflare OAuth tokens must be server-side and encrypted at rest.
- Public AI endpoints are protected by origin policy, Worker rate limiting and are designed for WAF + Turnstile at the Cloudflare zone edge.
- Privileged endpoints require Bearer authentication.
- Client-supplied model IDs are ignored; only the server allow-list is used.
- Video is capped at 25 MB and stored through an R2 stream where possible.
- AI Gateway should be configured with spend limits, rate limits, logging policy and guardrails.
