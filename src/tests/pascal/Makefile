FPC = fpc
GPP = gpp
PS_SRC = ./vendor/pascalscript/Source
SRC = ./src
TESTS = ./tests
BUILD = ./build
SCRIPTS = ../../../Scripts
SHARED = $(SCRIPTS)/shared

FPCFLAGS = -Fu$(PS_SRC) -Fu$(SRC) -Fu$(TESTS) -FE. -dNOGUI

.PHONY: all prebuild build test clean help

all: test

prebuild:
	@mkdir -p $(BUILD)
	cd $(SCRIPTS) && $(GPP) -I. -o "$(CURDIR)/$(BUILD)/earlyT1Singleton.pas" earlyT1Singleton/script.pas
	$(GPP) -DNOGUI -o "$(CURDIR)/$(BUILD)/strUtils.pas" $(SHARED)/utils/strUtils.pas
	$(GPP) -DNOGUI -o "$(CURDIR)/$(BUILD)/formatting.pas" $(SHARED)/utils/formatting.pas
	$(GPP) -DNOGUI -o "$(CURDIR)/$(BUILD)/articles.pas" $(SHARED)/utils/articles.pas
	$(GPP) -DNOGUI -o "$(CURDIR)/$(BUILD)/formUtils.pas" $(SHARED)/utils/formUtils.pas
	$(GPP) -DNOGUI -o "$(CURDIR)/$(BUILD)/gestationalAge.pas" $(SHARED)/obstetric/gestationalAge.pas
	$(GPP) -DNOGUI -o "$(CURDIR)/$(BUILD)/clinicalHistory.pas" $(SHARED)/obstetric/clinicalHistory.pas
	$(GPP) -DNOGUI -o "$(CURDIR)/$(BUILD)/eddHandling.pas" $(SHARED)/obstetric/eddHandling.pas
	$(GPP) -DNOGUI -o "$(CURDIR)/$(BUILD)/fibroids.pas" $(SHARED)/gynae/fibroids.pas
	$(GPP) -DNOGUI -o "$(CURDIR)/$(BUILD)/fibroidUI.pas" $(SHARED)/gynae/fibroidUI.pas

build: prebuild
	$(FPC) $(FPCFLAGS) -oTestRunner TestRunner.pas

test: build
	./TestRunner --all --format=plain

test-suite: build
	./TestRunner --suite=$(SUITE)

clean:
	rm -f TestRunner *.o *.ppu src/*.o src/*.ppu tests/*.o tests/*.ppu
	rm -rf $(BUILD)

help:
	@echo "PascalScript Test Harness"
	@echo "========================"
	@echo ""
	@echo "  make test         - Build and run all tests"
	@echo "  make build        - Compile test runner"
	@echo "  make prebuild     - GPP-build exam scripts"
	@echo "  make clean        - Remove build artifacts"
	@echo "  make test-suite SUITE=TestStrUtils  - Run specific suite"
