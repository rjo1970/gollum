from ruby:latest

RUN apt-get update && apt-get upgrade -y && apt-get install -y libicu-dev

RUN git clone https://github.com/gollum/gollum.git

WORKDIR /gollum

RUN bundle install

RUN gem install puma github-markup

RUN rake

CMD "/gollum/bin/gollum"

EXPOSE 4567
