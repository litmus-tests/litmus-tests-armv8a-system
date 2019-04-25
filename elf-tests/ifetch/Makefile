OUTPUTDIR = build

# This is using cross compilation.
# On Ubuntu you can get aarch64-linux-gnu-gcc like this: 'apt install gcc-aarch64-linux-gnu'.
CC = aarch64-linux-gnu-gcc
OBJDUMP = aarch64-linux-gnu-objdump
READELF = aarch64-linux-gnu-readelf

### for normal compilation
# CFLAGS=-I. -Wall -Wno-unused-but-set-variable -std=c11 -pthread -save-temps -O2

### for rmem:
CFLAGS = -g -static -std=c11 -nostdlib
# this is needed only for tests that call start_thread
CFLAGS += -D__THREAD_START_H=\"thread_start_aarch64.h\"
# show all warnings
CFLAGS += -Wall
# do not show this warning
CFLAGS += -Wno-unused-but-set-variable
# generate .s and .i files
CFLAGS += -save-temps=obj
# prevent gratuitous use of floating-point load/store instructions
# CFLAGS += -msoft-float
# do not try to insert calls to memcpy() or other library helpers
# (-O0 also probably prevents this)
CFLAGS += -ffreestanding
### linker options:
# _start is the symbol linksem uses to find the entry point
CFLAGS += -Wl,--defsym,_start=main
### assembler options:
# keep local symbols, e.g. the PowerPC .L.main
CFLAGS += -Wa,-L

all:
.PHONY: all

define build-and-dump
	$(CC) $(CFLAGS) -o $2 $1
	$(OBJDUMP) -D $2 > $2-objdump-D.txt
	$(READELF) -a $2 > $2-readelf-a.txt
endef

clean:
	rm -rf $(OUTPUTDIR)

$(OUTPUTDIR)/dcic_test: CFLAGS += -O0
$(OUTPUTDIR)/dcic_test: dcic_test.c thread_start_aarch64.h
	mkdir -p $(dir $@)
	$(call build-and-dump,$<,$@)
all: $(OUTPUTDIR)/dcic_test

$(OUTPUTDIR)/sm: CFLAGS += -O0
$(OUTPUTDIR)/sm: sm.c thread_start_aarch64.h
	mkdir -p $(dir $@)
	$(call build-and-dump,$<,$@)
all: $(OUTPUTDIR)/sm

$(OUTPUTDIR)/sm+cachesync: CFLAGS += -O0
$(OUTPUTDIR)/sm+cachesync: sm+cachesync.c thread_start_aarch64.h
	mkdir -p $(dir $@)
	$(call build-and-dump,$<,$@)
all: $(OUTPUTDIR)/sm+cachesync

$(OUTPUTDIR)/sm+cachesync+isb: CFLAGS += -O0
$(OUTPUTDIR)/sm+cachesync+isb: sm+cachesync+isb.c thread_start_aarch64.h
	mkdir -p $(dir $@)
	$(call build-and-dump,$<,$@)
all: $(OUTPUTDIR)/sm+cachesync+isb

$(OUTPUTDIR)/sm+isb: CFLAGS += -O0
$(OUTPUTDIR)/sm+isb: sm+isb.c thread_start_aarch64.h
	mkdir -p $(dir $@)
	$(call build-and-dump,$<,$@)
all: $(OUTPUTDIR)/sm+isb
