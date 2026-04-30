# sample dockerfile for testing docker builds
# Multi-stage builds
# base → foundational layer shared by both test and final
# test → adds extra tools (like apache2-utils) for testing
# final → production image (default if no target is specified)

FROM nginx:1.20-alpine as base

RUN apk add --no-cache curl

WORKDIR /test

COPY . .

#########################
FROM base as test

#layer test tools and assets on top as optional test stage
RUN apk add --no-cache apache2-utils


#########################
FROM base as final

# this layer gets built by default unless you set target to test
