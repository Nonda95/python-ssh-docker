FROM python:3.12

# Install SSH server and common dev tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-server \
    build-essential \
    git \
    curl \
    vim \
    bart \
    && mkdir -p /run/sshd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a dev user with passwordless sudo
RUN useradd -m -s /bin/bash dev && \
    echo "dev:devpass" | chpasswd && \
    mkdir -p /home/dev/.ssh

# Allow password auth for SSH
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config && \
    echo "AllowUsers dev" >> /etc/ssh/sshd_config

# Pre-create common project directories
RUN mkdir -p /home/dev/project /home/dev/.cache/pip
RUN chown -R dev:dev /home/dev

# Expose SSH port
EXPOSE 22

# Start SSH daemon
CMD ["/usr/sbin/sshd", "-D", "-e"]
