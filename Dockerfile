FROM ruby:2.5.1

#install 3rd party dependencies
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
        && apt-get install -y nodejs

#working directory
RUN mkdir /app
WORKDIR /app

#Script run when container first starts
COPY docker-entrypoint.sh docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT [ "/app/docker-entrypoint.sh" ]