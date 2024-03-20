FROM ruby:3.2.2-alpine3.18
ADD . /app
WORKDIR /app
RUN apk update && apk --no-cache add --virtual .eventmachine-builddeps g++ make sqlite sqlite-dev sqlite-libs \
  && gem install sqlite3 -v 1.6.9 --platform=ruby \
  && bundle install --without development -j4 \
  && apk del .eventmachine-builddeps
EXPOSE 3000
ENV RACK_ENV=production
CMD bundle exec rackup --host 0.0.0.0 -p 3000