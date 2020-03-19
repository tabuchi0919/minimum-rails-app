FROM ruby:2.7.0-alpine
ENV LANG C.UTF-8

RUN apk add --update --no-cache \
    build-base \
    gmp-dev \
    libxslt-dev \
    libxml2-dev \
    mariadb-dev \
    tzdata \
    git

WORKDIR /myapp

COPY Gemfile Gemfile.lock /myapp/
RUN bundle install -j4

COPY . /myapp

EXPOSE 3000
