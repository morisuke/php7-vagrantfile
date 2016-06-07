#!/bin/bash

: "Vim" && {

	: "install" && {
		yum install -y vim
	}

	: "color schema" && {
		mkdir ~/.vim
		cd ~/.vim
		mkdir colors
		git clone https://github.com/tomasr/molokai
		mv molokai/colors/molokai.vim ~/.vim/colors/
	}

	: ".vimrc" && {
		cat <<-EOS > ~/.vimrc
		set incsearch
		set hlsearch
		set nowrap
		set showmatch
		set incsearch
		set hlsearch
		set nowrap
		set showmatch
		set whichwrap=h,l
		set nowrapscan
		set ignorecase
		set smartcase
		set hidden
		set history=2000
		set autoindent
		set helplang=en
		set tabstop=4
		set shiftwidth=4
		set ambiwidth=double
		set viminfo='20,\"3000
		set backspace=indent,eol,start

		if has('vim_starting')
		    set runtimepath+=~/.vim/bundle/neobundle.vim
		    call neobundle#begin(expand('~/.vim/bundle/'))
		    NeoBundleFetch 'Shougo/neobundle.vim'
		    NeoBundle 'joonty/vdebug'
		    NeoBundle "pangloss/vim-javascript"
		    NeoBundle 'vim-scripts/yanktmp.vim'
		    call neobundle#end()
		endif

		map sy :call YanktmpYank()<CR>
		map sp :call YanktmpPaste_p()<CR>

		colorscheme molokai
		syntax on
		let g:molokai_original = 1
		let g:rehash256 = 1
		set background=dark

		autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html
		EOS
	}

	: "NeoBundle" && {
		mkdir -p ~/.vim/bundle
		git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
		vim +":NeoBundleInstall" +:q
	}
}
