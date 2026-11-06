FROM debian:bookworm-slim

# Temel araçları ve Node.js 20 LTS ortamını kurun
RUN apt-get update && apt-get install -y \
    curl \
    git \
    ca-certificates \
    gnupg \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt-get/lists/*

# OpenCode'u npm / official kurulum yöntemiyle global olarak kurun
RUN npm install -g opencode-ai@latest

# Güvenlik gereği root olmayan bir kullanıcı oluşturun
RUN addgroup --gid ${GROUP_ID} user 

RUN adduser --uid ${USER_ID} --gid ${GROUP_ID} --home /home/user --shell /bin/sh user 

RUN chown -R ${USER_ID}:${GROUP_ID} /home/user

USER user
WORKDIR /workspace

# OpenCode Ajan Servisini 8080 portunda dinleyecek şekilde başlatın
EXPOSE 8080

CMD ["opencode", "serve", "--hostname", "0.0.0.0", "--port", "8080"]