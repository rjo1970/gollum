from ruby:latest

ENV RACK_ENV production

RUN apt-get update && apt-get upgrade -y && apt-get install -y libicu-dev

RUN git init gollum

WORKDIR /gollum

RUN gem install puma redcarpet github-markup gollum

CMD "gollum" "--css"

EXPOSE 4567
