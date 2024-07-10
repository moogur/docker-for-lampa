# Set versions
ARG NGINX_VERSION=1.27.0

# First stage to build
FROM nginx:${NGINX_VERSION}-alpine-slim as build

WORKDIR /app

COPY docker-entrypoint.sh docker-entrypoint.sh

RUN apk add --no-cache git && \
    git clone https://github.com/yumata/lampa.git && \
    cd lampa && \
    rm -fr .git && \
    rm -f .dockerignore Dockerfile README.md SECURITY.md

# Second stage to run
FROM nginx:${NGINX_VERSION}-alpine-slim

COPY --from=build /app/lampa /usr/share/nginx/html
COPY --from=build /app/docker-entrypoint.sh /docker-entrypoint.sh
