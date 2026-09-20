all:
	@odin check .

run:
	@echo "Running Application"
	@odin run .

.PHONY: all run clean
