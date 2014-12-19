# Copyright (c) 2014. All rights reserved.

OPT=-ggdb
CXX=g++
CXXFLAGS=-std=c++11 -I. -I./src/ $(OPT)
LDFLAGS= -lboost_system -lboost_thread
SOURCES=./async_client.cpp
OBJECTS=$(SOURCES:.cpp=.o)

default: all

all: async_client async_server 

async_client: async_client.o
	$(CXX) $+ -o $@ $(LDFLAGS)

async_server: async_server.o
	$(CXX) $+ -o $@ $(LDFLAGS)

.cpp.o:
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f ./async_client
	rm -f ./async_server
	rm -f $(OBJECTS)
