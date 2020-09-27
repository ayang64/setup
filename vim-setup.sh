#!/usr/bin/env bash

# vim-gitgutter
gitgutter(){
# case $1 in [ [(] pattern [ | pattern ] ... ) list ;; ] ... esac
	case $1 in
		init)
			mkdir -p ~/.vim/pack/airblade/start
			pushd ~/.vim/pack/airblade/start
			git clone https://github.com/airblade/vim-gitgutter.git
			vim -u NONE -c "helptags vim-gitgutter/doc" -c q
			;;
		update)
			cd ~/.vim/pack/airblade/vim-gutter
			git pull
			;;
	esac

}

# fugitiv
fugitiv(){
	case $1 in
		init)
			mkdir -p ~/.vim/pack/tpope/start
			cd ~/.vim/pack/tpope/start
			git clone https://tpope.io/vim/fugitive.git
			vim -u NONE -c "helptags fugitive/doc" -c q
			;;
		update)
			cd ~/.vim/pack/tpope/start/fugitive
			git pull
			;;
	esac
}

# govim
govim(){
	case $1 in
		init)
			git clone https://github.com/govim/govim.git ~/.vim/pack/plugins/start/govim
			;;
		update)
			cd ~/.vim/pack/plugins/start/govim
			git pull
			;;
	esac
	cd ~/.vim/pack/plugins/start/govim
	go build
}

case $1 in
	init|update)
		gitgutter $1
		fugitiv $1
		govim $1
		;;
	*)
		echo "what?"
esac
