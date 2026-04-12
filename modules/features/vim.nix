{ pkgs, ... }: {

  programs.vim.enable = true;

  environment.systemPackages = [
    (pkgs.vim-full.customize {
      name = "vim";
      vimrcConfig.customRC = ''
        " Indentation
        set autoindent
        set tabstop=2
        set shiftwidth=2
        set expandtab
        
        " Line number
        set number
        set relativenumber

        " Clipboard
        if has ('clipboard')
          set clipboard=unnamedplus
        endif

        " Syntax highlighting
        syntax on
        filetype on
      '';
    })
  ];

}
