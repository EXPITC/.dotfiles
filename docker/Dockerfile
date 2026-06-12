FROM ubuntu:24.04
ARG DEBIAN_FRONTEND=noninteractive
ARG TARGETARCH

# ---------- Locale & base tools ----------
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl wget git unzip zip tar ca-certificates gnupg \
    tmux fish \
    ripgrep fd-find fzf \
    python3 python3-pip \
    build-essential pkg-config \
    locales \
    && locale-gen en_US.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

ENV LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 TERM=xterm-256color COLORTERM=truecolor

# ---------- Neovim (latest stable, multi-arch) ----------
RUN ARCH=$([ "$TARGETARCH" = "arm64" ] && echo "arm64" || echo "x86_64") \
    && curl -LO "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-${ARCH}.tar.gz" \
    && tar xzf "nvim-linux-${ARCH}.tar.gz" -C /opt \
    && ln -sf "/opt/nvim-linux-${ARCH}/bin/nvim" /usr/local/bin/nvim \
    && rm "nvim-linux-${ARCH}.tar.gz"

# ---------- Node.js 22 LTS + pnpm ----------
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y nodejs \
    && corepack enable && corepack prepare pnpm@latest --activate \
    && rm -rf /var/lib/apt/lists/*

# ---------- Go ----------
ARG GO_VERSION=1.23.4
RUN ARCH=$([ "$TARGETARCH" = "arm64" ] && echo "arm64" || echo "amd64") \
    && curl -LO "https://go.dev/dl/go${GO_VERSION}.linux-${ARCH}.tar.gz" \
    && tar -C /usr/local -xzf "go${GO_VERSION}.linux-${ARCH}.tar.gz" \
    && rm "go${GO_VERSION}.linux-${ARCH}.tar.gz"
ENV PATH=/usr/local/go/bin:/root/go/bin:$PATH GOPATH=/root/go

# ---------- eza (exa successor, ls replacement) ----------
RUN ARCH=$([ "$TARGETARCH" = "arm64" ] && echo "aarch64" || echo "x86_64") \
    && curl -Lo /tmp/eza.tar.gz \
       "https://github.com/eza-community/eza/releases/latest/download/eza_${ARCH}-unknown-linux-musl.tar.gz" \
    && tar xzf /tmp/eza.tar.gz -C /usr/local/bin eza \
    && ln -s /usr/local/bin/eza /usr/local/bin/exa \
    && rm /tmp/eza.tar.gz

# ---------- gh CLI ----------
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
      | gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
      > /etc/apt/sources.list.d/github-cli.list \
    && apt-get update && apt-get install -y gh \
    && rm -rf /var/lib/apt/lists/*

# ---------- gcloud CLI ----------
RUN curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg \
      | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" \
      > /etc/apt/sources.list.d/google-cloud-sdk.list \
    && apt-get update && apt-get install -y google-cloud-cli \
    && rm -rf /var/lib/apt/lists/*

# ---------- PHP + Composer ----------
RUN apt-get update && apt-get install -y --no-install-recommends \
    php php-cli php-mbstring php-xml php-curl php-zip \
    && rm -rf /var/lib/apt/lists/* \
    && curl -sS https://getcomposer.org/installer \
       | php -- --install-dir=/usr/local/bin --filename=composer

# ---------- npm globals (LSPs Mason also installs, but pre-seeded here) ----------
RUN npm install -g \
    typescript \
    typescript-language-server \
    @tailwindcss/language-server \
    @prisma/language-server \
    prettier \
    eslint_d \
    prettierd

# ---------- TPM (tmux plugin manager) ----------
RUN git clone --depth 1 https://github.com/tmux-plugins/tpm /root/.tmux/plugins/tpm

# ---------- Fisher ----------
RUN fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish \
             | source && fisher install jorgebucaran/fisher"

# ---------- Default shell ----------
RUN chsh -s "$(which fish)"

WORKDIR /workspace
CMD ["fish"]
