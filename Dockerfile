FROM ruby:3.4.2

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*


ARG BUNDLER_VERSION=2.3.5
ENV BUNDLER_VERSION=${BUNDLER_VERSION}
RUN gem install bundler -v ${BUNDLER_VERSION}
RUN git config --global --add safe.directory /usr/src/app

EXPOSE 4000

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT [ "docker-entrypoint.sh" ]
