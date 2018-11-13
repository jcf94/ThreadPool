# ***********************************************
# MYID : Chen Fan
# LANG : Makefile
# PROG : 
# ***********************************************

CC = g++
CFLAGS +=

LD = g++
LDFLAGS +=

NAME = $(wildcard *.cpp)
SRCS = $(wildcard *.cpp)
OBJS = $(patsubst %.cpp, %.o, $(SRCS))
TARGET = $(patsubst %.cpp, %, $(NAME))

CLEAN-O = rm -f $(OBJS)

release: CFLAGS += -O3
release: LDFLAGS += -O3
release: all

debug: CFLAGS += -g3
debug: LDFLAGS += -g3
debug: all

all: main
	$(CLEAN-O)
	@echo "=------------------------------="
	@echo "|     Target Make Success      |"
	@echo "=------------------------------="

$(TARGET): $(OBJS)
	$(LD) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CC) -o $@ -c $< $(CFLAGS)

.PHONY: clean
clean:
	rm -rf $(TARGET)
	$(CLEAN-O)
	@echo "=-----------------------------="
	@echo "|     Target Clean Success    |"
	@echo "=-----------------------------="

show:
	@echo NAME: $(NAME)
	@echo SRCS: $(SRCS)
	@echo OBJS: $(OBJS)
	@echo TARGET: $(TARGET)