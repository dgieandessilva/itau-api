#!/bin/bash

rm -rf dockerize

java -jar app.jar --spring.config.location=./application.properties