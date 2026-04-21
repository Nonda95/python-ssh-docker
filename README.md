# Python SSH Docker

Docker image for Python 3.12 development with SSH access (e.g., for PyCharm remote interpreters).

## Usage

```bash
docker run -p 127.0.0.1:2222:22 ghcr.io/<your-username>/python-ssh-docker:latest
```

Connect via SSH:
- **Host:** `localhost`
- **Port:** `2222`
- **User:** `dev`
- **Password:** `devpass`

## What's included

- Python 3.12
- SSH server
- git, curl, vim, build-essential

## CI/CD

Pushes to `main` automatically build and publish the image to GitHub Container Registry.
