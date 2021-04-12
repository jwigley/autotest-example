FROM alpine:latest

# Copy in app
COPY app/ /app

# Set workdir to app dir
WORKDIR /app

# Symlink app so we can run it anywhere
RUN ln -s /app/example-app /usr/local/bin/example-app
