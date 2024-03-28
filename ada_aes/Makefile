# Makefile to build Ada project using GPRBuild

GPR_PROJECT_PATH := $(PWD)
PROJECT_FILE := ada_aes.gpr
# Default target
all:
	GPR_PROJECT_PATH=$(GPR_PROJECT_PATH) gprbuild -P $(PROJECT_FILE)

# Clean target
clean:
	@echo "Cleaning up..."
	@GPR_PROJECT_PATH=$(GPR_PROJECT_PATH) gprclean -P $(PROJECT_FILE)
