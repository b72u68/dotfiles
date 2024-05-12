DOTFILES=$(shell pwd)

all:
	ln -nsf ${DOTFILES}/.tmux.conf ${HOME}/.tmux.conf
	ln -nsf ${DOTFILES}/.zshrc ${HOME}/.zshrc
	ln -nsf ${DOTFILES}/nvim ${HOME}/.config/nvim
