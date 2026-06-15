# Name to use for the root main.typ's output (since "." has no useful basename)
ROOT_NAME := $(notdir $(CURDIR))

# Find all main.typ files (excluding anything already under out/)
SOURCES := $(shell find . -path ./out -prune -o -name main.typ -print)

# For a given main.typ path, compute its output PDF name
# (parent dir name, or ROOT_NAME for top-level)
out_name = $(if $(filter ./main.typ,$(1)),$(ROOT_NAME),$(notdir $(patsubst %/,%,$(dir $(1)))))

# Map each src/.../main.typ -> out/.../<name>.pdf
out_path = $(patsubst ./%,out/%,$(dir $(1)))$(call out_name,$(1)).pdf

# All files (siblings/children) under a main.typ's directory, excluding out/
deps = $(shell find $(dir $(1)) -path $(dir $(1))out -prune -o -type f -print)

OUTPUTS := $(foreach s,$(SOURCES),$(call out_path,$(s)))

.PHONY: all clean init

all: $(OUTPUTS)

define LANGUAGES_TOML
[language-server.tinymist.config]
typstExtraArgs = ["main.typ"]
endef
export LANGUAGES_TOML

init:
	@test -n "$(name)" || { echo "usage: make init name=<note-name>"; exit 1; }
	@test ! -e "$(name)" || { echo "error: '$(name)' already exists"; exit 1; }
	@mkdir -p "$(name)/.helix"
	@touch "$(name)/main.typ"
	@echo "$$LANGUAGES_TOML" > "$(name)/.helix/languages.toml"
	@echo "created note '$(name)'"

define MAKE_RULE
$(call out_path,$(1)): $(call deps,$(1))
	@mkdir -p $$(dir $$@)
	typst c $(1) $$@
endef
$(foreach s,$(SOURCES),$(eval $(call MAKE_RULE,$(s))))

clean:
	rm -rf out
