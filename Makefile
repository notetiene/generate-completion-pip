# -*- mode: makefile -*-
# vim:ft=make:

OUTPUT_DIR = .
BASH_DEBUG_PREFACE ?= "In pip bash completion setup"
BASH_OUTPUT_FILENAME ?= pip-completion-setup.bash
ZSH_DEBUG_PREFACE ?= "In pip zsh completion setup"
ZSH_OUTPUT_FILENAME ?= pip-completion-setup.zsh

.PHONY : all
all : bash-completion zsh-completion

.PHONY : bash-completion
bash-completion :
	@echo Generating pip bash completion setup script
	@/bin/echo -e "# -*- mode: sh; sh-shell: bash -*-\\n\
# vim:ft=sh:\\n\
\\n\
# /bin/echo -e '$(BASH_DEBUG_PREFACE)'" > $(OUTPUT_DIR)/$(BASH_OUTPUT_FILENAME) &&\
	pip completion --bash >> $(OUTPUT_DIR)/$(BASH_OUTPUT_FILENAME)

.PHONY : zsh-completion
zsh-completion :
	@echo Generating pip ZSH completion setup script
	@/bin/echo -e "# -*- mode: sh; sh-shell: zsh -*-\\n\
# vim:ft=sh:\\n\
\\n\
# /bin/echo -e '$(ZSH_DEBUG_PREFACE)'" > $(OUTPUT_DIR)/$(ZSH_OUTPUT_FILENAME) &&\
	pip completion --zsh >> $(OUTPUT_DIR)/$(ZSH_OUTPUT_FILENAME)

.PHONY : clean
clean :
	rm -f $(OUTPUT_DIR)/$(BASH_OUTPUT_FILENAME)
	rm -f $(OUTPUT_DIR)/$(ZSH_OUTPUT_FILENAME)
