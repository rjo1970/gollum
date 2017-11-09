from ruby:latest

ENV RACK_ENV production

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y maven graphviz openjdk-7-jdk git-core haproxy \
    libicu-dev
RUN git clone https://github.com/plantuml/plantuml-server.git
RUN cd plantuml-server && mvn package && mvn jetty:help

RUN git init gollum

WORKDIR /gollum

COPY Home.md /gollum/Home.md

RUN git add Home.md && git -c user.email="anonymous@email.com" -c user.name="Anonymous" commit -am "Created Home (markdown)"

RUN gem install puma gollum

COPY config.rb /config.rb

COPY start.sh /start.sh

RUN echo "ENABLED=1" >> /etc/default/haproxy
COPY haproxy.cfg /etc/haproxy/haproxy.cfg

CMD "bash" "/start.sh"

EXPOSE 4567
