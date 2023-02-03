build:
	touch dotfiles/zshrc
	touch dotfiles/init.vim
	touch dotfiles/setup.sh
	chmod +x dotfiles/setup.sh
	docker compose build --progress plain devenv
run:
	docker compose run --service-ports --rm devenv

