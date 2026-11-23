#   make          build every main.typ whose output is out of date
#   make index    generate browsable index.html files under out/ (Python)
#   make site     all + index
#   make clean    remove out/

.DEFAULT_GOAL := all
.PHONY: all index site clean

PRUNE    := \( -path ./out -o -name .git -name index.py \) -prune -o
SOURCES  := $(shell find . $(PRUNE) -name main.typ -print | sed 's|^\./||' | sort)
ALLFILES := $(shell find . $(PRUNE) -type f -print | sed 's|^\./||' | sort)
NOTEDIRS := $(foreach s,$(SOURCES),$(if $(filter main.typ,$(s)),.,$(patsubst %/main.typ,%,$(s))))
ROOTNAME := $(notdir $(CURDIR))

is_root = $(filter .,$(1))
subs    = $(if $(call is_root,$(1)),$(filter-out .,$(NOTEDIRS)),$(filter $(1)/%,$(NOTEDIRS)))
src     = $(if $(call is_root,$(1)),,$(1)/)main.typ
files   = $(filter-out $(addsuffix /%,$(call subs,$(1))),$(if $(call is_root,$(1)),$(ALLFILES),$(filter $(1)/%,$(ALLFILES))))
out     = $(if $(call subs,$(1)),out/$(if $(call is_root,$(1)),,$(1)/)main.pdf,$(if $(call is_root,$(1)),out/$(ROOTNAME).pdf,out/$(1).pdf))

OUTPUTS :=

define note_rule
$(call out,$(1)): $(call files,$(1))
	@mkdir -p $$(@D)
	@echo "typst c $(call src,$(1)) $$@"
	@typst c $(call src,$(1)) $$@
OUTPUTS += $(call out,$(1))
endef

$(foreach d,$(NOTEDIRS),$(eval $(call note_rule,$(d))))

all: $(OUTPUTS)

index:
	@python3 index.py

# Build PDFs and generate the browsable index
site: all index

# Remove all build outputs
clean:
	@rm -rf out
