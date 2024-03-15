# Makefile to build Ada project using GPRBuild

GPR_PROJECT_PATH := $(PWD):$(PWD)/config/dependencies/utilada_2.6.0:$(PWD)/config/dependencies/utilada_2.6.0/.alire
PROJECT_FILE := ada_aes.gpr
# Default target
all:
	@echo "Building Ada project..."
	@GPR_PROJECT_PATH=$(GPR_PROJECT_PATH) gprbuild

# Clean target
clean:
	@echo "Cleaning up..."
	@GPR_PROJECT_PATH=$(GPR_PROJECT_PATH) gprclean -P $(PROJECT_FILE)
