FROM ruby
MAINTAINER Tomato Ketchup <r@554.jp>

RUN apt-get -y update && apt-get -y install libicu-dev cmake && rm -rf /var/lib/apt/lists/*

WORKDIR /gollum

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock

RUN bundle install

ADD config.rb /gollum/config.rb
RUN mkdir -p wiki

CMD ["gollum", "--port", "80", "--config", "config.rb", "/gollum/wiki"]
EXPOSE 80
