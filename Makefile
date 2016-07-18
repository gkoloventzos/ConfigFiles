UNAME=$(shell uname)
PWD=$(shell pwd)

all:
	@echo "Pick on of the following choices:"
	@echo "---------------------------------"
	@echo "- Install: make install"
	@echo "- Update: make update"

install:
	@make update
ifeq ($(UNAME),Linux)
	@echo $(PWD)
	@ln -sf $(PWD)/git/.gitconfig ~/.gitconfig
	@ln -sf $(PWD)/git/.gitignore_global ~/.gitignore_global
	@ln -sf $(PWD)/git/.git_svn_bash_prompt ~/.git_svn_bash_prompt
	@ln -sf $(PWD)/bash/.bashrc ~/.bashrc
	@ln -sf $(PWD)/vim/.vimrc ~/.vimrc
	@ln -sf $(PWD)/tmux/.tmux.conf ~/.tmux.conf
	@git config --global core.excludesfile ~/.gitignore_global
	@echo  "You are good to go!"
else
	@echo "This doesn't seem like a Linux system :-("
	@echo "I won't touch anything."
endif

update:
	@git pull
