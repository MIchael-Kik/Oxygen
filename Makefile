CC = g++
CXXFLAGS = -Wall -o3 -I./include -I/usr/include -I/usr/X11R6/include
LDFLAGS = -lX11 

INSTALLDIR = /usr/local/bin
APPNAME = oxygen

BIN = ../$(APPNAME)

OBJDIR = ../obj/$(APPNAME)
SRCDIR = src

SRC = $(wildcard $(SRCDIR)/*.cpp)
OBJ = $(SRC:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)
DEP = $(OBJ:$(OBJDIR)/%.o=%.d)

all: $(BIN)

$(BIN): $(OBJ)
	$(CC) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

%.d: $(SRCDIR)/%.cpp
	@$(CPP) $(CFLAGS) $< -MM -MT $(@:%.d=$(OBJDIR)/%.o) >$@

-include $(DEP)

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	$(CC) $(CXXFLAGS) -o $@ -c $<

uninstall:
	rm -f $(INSTALLDIR)/$(APPNAME)

install: all
	cp -f $(BIN) $(INSTALLDIR)/$(APPNAME)
	chmod 755 $(INSTALLDIR)/$(APPNAME)

clean:
	rm -f $(OBJ) $(DEP) $(BIN)
cleand:
	rm -f $(DEP)
