# Makefile for a LaTeX project 
#
# Usage:
#   make           # build main.pdf
#   make watch     # rebuild when .tex files change (requires inotify-tools)
#   make clean     # remove build artifacts
#   make distclean # remove artifacts + PDF

TEX      := pdflatex
TEXFLAGS := -interaction=nonstopmode -halt-on-error -file-line-error

MAIN     := main
SRC_DIRS := . 2026

# Find all .tex files in SRC_DIRS (recursive)
TEX_SOURCES := $(shell find $(SRC_DIRS) -type f -name '*.tex')

.PHONY: all clean distclean watch

all: $(MAIN).pdf

# Build PDF (run twice for refs)
$(MAIN).pdf: $(MAIN).tex $(TEX_SOURCES)
	$(TEX) $(TEXFLAGS) $(MAIN).tex
	$(TEX) $(TEXFLAGS) $(MAIN).tex

clean:
	rm -f *.aux *.log *.out *.toc *.lof *.lot *.fls *.fdb_latexmk *.synctex.gz
	rm -f **/*.aux **/*.log **/*.out **/*.toc **/*.synctex.gz 2>/dev/null || true

distclean: clean
	rm -f $(MAIN).pdf

# Requires: sudo apt install inotify-tools
watch:
	@command -v inotifywait >/dev/null 2>&1 || { \
		echo "inotifywait not found. Install with: sudo apt install inotify-tools"; \
		exit 1; \
	}
	@echo "Watching for changes in .tex files... (Ctrl+C to stop)"
	@while inotifywait -e close_write,move,create,delete -r $(SRC_DIRS); do \
		$(MAKE) --no-print-directory; \
	done

