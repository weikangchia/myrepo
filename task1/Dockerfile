FROM node:17.1.0-alpine3.14

ARG APP_DIR=/app

WORKDIR ${APP_DIR}

COPY . /app

RUN npm i

ENV APP_DIR=/app
ENV PORT=3000

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD curl http://localhost:${PORT}/healthz || exit 1

EXPOSE ${PORT}

ENTRYPOINT ["node", "main.js"]