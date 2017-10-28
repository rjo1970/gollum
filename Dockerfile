from ruby:latest

ENV RACK_ENV production

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y maven graphviz openjdk-7-jdk git-core  
RUN git clone https://github.com/plantuml/plantuml-server.git
RUN cd plantuml-server && mvn package && mvn jetty:help 

RUN apt-get install -y libicu-dev

RUN git init gollum

WORKDIR /gollum

RUN gem install puma redcarpet github-markup gollum
COPY start.sh /start.sh

CMD "bash" "/start.sh" 

EXPOSE 4567
EXPOSE 8080

