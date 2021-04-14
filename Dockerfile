FROM alpine:latest as release
# Copy in app
COPY app/ /app
# Set workdir to app dir
WORKDIR /app
# Symlink app so we can run it anywhere
RUN ln -s /app/example-app /usr/local/bin/example-app

FROM alpine:latest as test
COPY --from=release / /
COPY test/ /test
WORKDIR /test
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["./tests.sh"]

FROM release
