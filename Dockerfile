FROM ruby
MAINTAINER Tomato Ketchup <r@554.jp>

RUN apt-get -y update && apt-get -y install libicu-dev cmake && rm -rf /var/lib/apt/lists/*
RUN gem install github-linguist
RUN gem install gollum
RUN gem install org-ruby

WORKDIR /wiki
CMD ["gollum", "--port", "80"]
EXPOSE 80
