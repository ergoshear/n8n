# n8n

The Fedora image runs n8n on port 5678 and stores its user data under `/data`.

## Olla Provider

Instance AI uses Olla's OpenAI-compatible API with these image defaults, also
set explicitly in the GitOps deployment:

| Environment Variable | Value |
| --- | --- |
| `N8N_INSTANCE_AI_MODEL_URL` | `https://olla.ergoshear.dev/olla/openai/v1` |
| `N8N_INSTANCE_AI_MODEL_API_KEY` | `olla` (placeholder) |
| `N8N_INSTANCE_AI_MODEL` | `llama3` |
| `N8N_INSTANCE_AI_THINKING_ENABLED` | `false` |

The sandbox service and SearXNG settings remain configured in GitOps.
Rebuild and publish the image, then sync and restart the n8n deployment.
Instance AI availability still depends on your n8n version and feature access.
Agent tools require a model/backend that supports tool calls.

Workflow nodes use their own credentials, not the Instance AI defaults. For
OpenAI or OpenAI Chat Model nodes, configure an OpenAI credential with Base URL
`https://olla.ergoshear.dev/olla/openai/v1` and API key `olla`, then select
`llama3` as the model. Use chat completions rather than the Responses API.
Existing workflows and credentials are not automatically rewritten.