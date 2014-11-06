# Copyright (c) 2014. All rights reserved.

OPT=-ggdb
CXX=g++
CXXFLAGS=-std=c++11 -I. -I./src/ $(OPT)
LDFLAGS= -lboost_system 
SOURCES=./async_tcp_echo_server.cpp
OBJECTS=$(SOURCES:.cpp=.o)

default: all

all: async_tcp_echo_server 

async_tcp_echo_server: async_tcp_echo_server.o
	$(CXX) $+ -o $@ $(LDFLAGS)

.cpp.o:
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f ./async_tcp_echo_server
	rm -f $(OBJECTS)
