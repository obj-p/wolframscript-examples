SCRIPTS_DIR := scripts
SCRIPTS := $(sort $(wildcard $(SCRIPTS_DIR)/*.wl))

# Run a specific script: make run SCRIPT=scripts/01-basics.wl
run:
	@if [ -z "$(SCRIPT)" ]; then \
		echo "Usage: make run SCRIPT=scripts/01-basics.wl"; \
		exit 1; \
	fi
	wolframscript -file $(SCRIPT)

# Run all scripts in order
all: $(SCRIPTS)
	@echo "All scripts finished."

$(SCRIPTS):
	@echo "\n=== Running $@ ==="
	wolframscript -file $@

# List available scripts
list:
	@echo "Available scripts:"
	@for f in $(SCRIPTS); do echo "  $$f"; done

# Clean generated output
clean:
	rm -rf output/

.PHONY: run all list clean $(SCRIPTS)
