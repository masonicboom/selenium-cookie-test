#!/bin/bash


ruby server.rb &
SERVER_PID=$!

rspec tester.rb

kill -9 $SERVER_PID