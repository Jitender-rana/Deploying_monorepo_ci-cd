FROM oven/bun:1

WORKDIR usr/src/app
COPY ./packages  ./packages
COPY ./turbo.json    ./turbo.json
COPY ./bun.lock    ./bun.lock
COPY ./package.json ./package.json
COPY ./apps/web ./apps/web

RUN bun install
RUN bun run db:generate
EXPOSE 3000

CMD ["bun","run","start:ws"]