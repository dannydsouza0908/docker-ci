# sample dockerfile for testing docker builds
FROM nginx:1.20-alpine as base

RUN apk add --no-cache curl

WORKDIR /test

COPY . .

#########################
