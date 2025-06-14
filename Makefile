# Compiler and flags
CC = g++
CFLAGS = -g -Wall

# Source files
SRC = proxy_server_w_cache.c proxy_parse.c
OBJ = proxy.o proxy_parse.o
HDR = proxy_parse.h

# Default target
all: proxy

# Build final binary
proxy: $(OBJ)
	$(CC) $(CFLAGS) -o proxy $(OBJ) -lpthread

# Compile source files into object files
proxy.o: proxy_server_w_cache.c $(HDR)
	$(CC) $(CFLAGS) -c proxy_server_w_cache.c -o proxy.o

proxy_parse.o: proxy_parse.c $(HDR)
	$(CC) $(CFLAGS) -c proxy_parse.c -o proxy_parse.o

# Clean target
clean:
	rm -f proxy *.o

# Tarball for submission
tar:
	tar -cvzf ass1.tgz proxy_server_w_cache.c README.md Makefile proxy_parse.c proxy_parse.h .gitignore
