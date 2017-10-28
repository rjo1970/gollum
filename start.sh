#!/bin/bash

(cd /plantuml-server; mvn jetty:run &)
(cd /gollum; gollum --css)

