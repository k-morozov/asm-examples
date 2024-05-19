AS = as
LD = ld
ASFLAGS = --64 
BINDIR = bin

TARGETS = stoi itos stack

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

stack: $(BINDIR)/stack
	./$(BINDIR)/stack

clean:
	rm -f $(BINDIR)/*.o $(BINDIR)/stoi $(BINDIR)/itos $(BINDIR)/stack