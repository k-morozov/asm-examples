AS = as
LD = ld
ASFLAGS = --64
BINDIR = bin

TARGETS = stoi itos example

.PHONY: all clean $(TARGETS)

all: $(TARGETS)

$(BINDIR)/%: $(BINDIR)/%.o
	$(LD) $< -o $@

$(BINDIR)/%.o: %.S
	$(AS) $(ASFLAGS) $< -o $@

stoi: $(BINDIR)/stoi
	./$(BINDIR)/stoi

itos: $(BINDIR)/itos
	./$(BINDIR)/itos

example: $(BINDIR)/example
	./$(BINDIR)/example

clean:
	rm -f $(BINDIR)/*.o $(BINDIR)/stoi $(BINDIR)/itos $(BINDIR)/example