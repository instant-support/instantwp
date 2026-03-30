<a href="https://instantsuppoorrt.com"><img src="https://instantsuppoorrt.com/hubfs/raw_assets/public/instant/images/logo.svg" align="right" alt="instant Support" /></a>

# instantwp

Modern, open-source WhatsApp Business Platform. Single binary app.

![Dashboard](docs/public/images/dashboard-light.png#gh-light-mode-only)
![Dashboard](docs/public/images/dashboard-dark.png#gh-dark-mode-only)

## Features

- **Multi-tenant Architecture**
  Support multiple organizations with isolated data and configurations.

- **Granular Roles & Permissions**
  Customizable roles with fine-grained permissions. Create custom roles, assign specific permissions per resource (users, contacts, templates, etc.), and control access at the action level (read, create, update, delete). Super admins can manage multiple organizations.

- **WhatsApp Cloud API Integration**
  Connect with Meta's WhatsApp Business API for messaging.

- **Real-time Chat**
  Live messaging with WebSocket support for instant communication.

- **Template Management**
  Create and manage message templates approved by Meta.

- **Bulk Campaigns**
  Send campaigns to multiple contacts with retry support for failed messages.

- **Chatbot Automation**
  Keyword-based auto-replies, conversation flows with branching logic, and AI-powered responses (OpenAI, Anthropic, Google).

- **Canned Responses**
  Pre-defined quick replies with slash commands (`/shortcut`) and dynamic placeholders.

- **Voice Calling & IVR**
  Incoming and outgoing WhatsApp calls with IVR menus, DTMF routing, call transfers to agent teams, hold music, and call recording. See [calling docs](https://instant-support.github.io/instantwp/features/calling/).

- **Analytics Dashboard**
  Track messages, engagement, and campaign performance.

<details>
<summary>View more screenshots</summary>

![Dashboard](docs/public/images/dashboard-light.png#gh-light-mode-only)
![Dashboard](docs/public/images/dashboard-dark.png#gh-dark-mode-only)


</details>

## Installation

### Docker

The latest image is available on Docker Hub at [`instant-support/instantwp:latest`](https://hub.docker.com/r/instant-support/instantwp)

```bash
# Download compose file, sample config, and env file
curl -LO https://raw.githubusercontent.com/instant-support/instantwp/main/docker/docker-compose.yml
curl -LO https://raw.githubusercontent.com/instant-support/instantwp/main/config.example.toml
curl -L https://raw.githubusercontent.com/instant-support/instantwp/main/docker/.env.example -o .env

# Copy and edit config
cp config.example.toml config.toml
# Edit .env to set PostgreSQL credentials and timezone

# Run services
docker compose up -d
```

Go to `http://localhost:8080` and login with `admin@instantsupport.co.in` / `admin`

__________________

### Binary

Download the [latest release](https://github.com/instant-support/instantwp/releases) and extract the binary.

```bash
# Copy and edit config
cp config.example.toml config.toml

# Run with migrations
./instantwp server -migrate
```

Go to `http://localhost:8080` and login with `admin@instantsupport.co.in` / `admin`

__________________

### Build from Source

```bash
git clone https://github.com/instant-support/instantwp.git
cd instantwp

# Production build (single binary with embedded frontend)
make build-prod
./instantwp server -migrate
```

See [configuration docs](https://instant-support.github.io/instantwp/getting-started/configuration/) for detailed setup options.

## CLI Usage

```bash
./instantwp server              # API + 1 worker (default)
./instantwp server -workers=0   # API only
./instantwp worker -workers=4   # Workers only (for scaling)
./instantwp version             # Show version
```

## Developers

The backend is written in Go ([Fastglue](https://github.com/zerodha/fastglue)) and the frontend is Vue.js 3 with shadcn-vue.
- If you are interested in contributing, please read [CONTRIBUTING.md](./CONTRIBUTING.md) first.

```bash
# Development setup
make run-migrate    # Backend (port 8080)
cd frontend && npm run dev   # Frontend (port 3000)
```

## License

See [LICENSE](LICENSE) for details.
