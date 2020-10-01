FROM mysql:latest

COPY ./auth-db.sql /docker-entrypoint-initdb.d

EXPOSE 3307:3306