.phony: clean

OUTPUTDIR = build

GHC ?= ghc

PROBLEMS = $(wildcard P*.hs)
OBJECTS  = $(PROBLEMS:%.hs=$(OUTPUTDIR)/%)

all: $(OBJECTS)

$(OUTPUTDIR):
	mkdir $(OUTPUTDIR)

$(OUTPUTDIR)/P%: P%.hs | $(OUTPUTDIR)
	$(GHC) --make -O3 $< -outputdir $(OUTPUTDIR) -o $@
	rm $(OUTPUTDIR)/Main.o $(OUTPUTDIR)/Main.hi

clean:
	-rm -r $(OUTPUTDIR)
