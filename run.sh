#!/bin/bash


export SERVER_URL="http://localhost:4567" # This is the Sinatra default.
export COOKIE_NAME="tasty"
export COOKIE_VALUE="mmm"


ruby server.rb &
SERVER_PID=$!

rspec tester.rb

kill -9 $SERVER_PID