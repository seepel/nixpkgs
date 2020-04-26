{ config, pkgs, ... }:

{
# Let Home Manager install and manage itself.
programs.home-manager.enable = true;

# This value determines the Home Manager release that your
# configuration is compatible with. This helps avoid breakage
# when a new Home Manager release introduces backwards
# incompatible changes.
#
# You can update Home Manager without changing this value. See
# the Home Manager release notes for a list of state version
# changes in each release.
home.stateVersion = "19.09";

home.sessionVariables = {
  EDITOR = "vi";
  VISIUAL = "vi";
  AWS_REGION = "us-west-2";
  AWS_PROFILE = "dev";
};

programs.bash = { 
  enable = true;
  historyControl = [ "erasedups" ];
  shellAliases = { };
  initExtra = ". /nix/store/aizhr07dljmlbf17wfrj40x3s0b5iv3d-nix-2.3.4/etc/profile.d/nix.sh"; 
};

#programs.chromium = {
#  enable = true;
#  extensions = [];
#};

#programs.firefox.enable = true;
#programs.firefox.extensions = [];

programs.fzf.enable = true;
programs.fzf.enableBashIntegration = true;

programs.git = {
  enable = true;
  signing = { 
    key = "BE6437FDD862B7D4";
    signByDefault = true;
  };
  userEmail = "sean@airkit.com";
  userName = "Sean Lynch";
};

programs.gpg = { 
  enable = true;
};

programs.kitty = { 
  enable = true;
  font = { 
    package = pkgs.fira-code;
    name = "Fira Code";
  };
  settings = {
    foreground = "#111111";
    background = "#efefef";
    cursor = "#111111";
    cursor_text_color = "#efefef";
    symbol_map = "U+E0A0-U+E0A3,U+E0C0-U+E0C7 PowerlineSymbols";
    strip_trailing_spaces = "always";
    tab_bar_style = "fade";
    shell = "/Users/sean/.nix-profile/bin/bash --login";
    close_on_child_death = "yes";
    macos_option_as_alt = "yes";
    macos_quit_when_last_window_closed = "yes";
    scrollback_lines = 10000;
    enable_audio_bell = false;
    update_check_interval = 0;
  };
};

programs.neovim = {
  enable = true;
  extraConfig = ''
      set tabstop=2
      set nocompatible
      syntax on
      filetype plugin indent on
      set shiftwidth=2
      set expandtab
      set autoindent
      set wildmode=list:longest
  '';
  plugins = [ 
    pkgs.vimPlugins.fugitive
    pkgs.vimPlugins.vim-addon-nix
  ];
  withNodeJs = true;
  withPython3 = true;
};

programs.readline = { 
  enable = true;
  extraConfig = "set editing-mode vi";
};

programs.vim = {
  enable = true;
  extraConfig = (builtins.readFile ./init.vim);
      
  plugins = [ 
    pkgs.vimPlugins.coc-nvim
    pkgs.vimPlugins.coc-css
    pkgs.vimPlugins.coc-eslint
    pkgs.vimPlugins.coc-fzf
    pkgs.vimPlugins.coc-git
    pkgs.vimPlugins.coc-html
    pkgs.vimPlugins.coc-java
    pkgs.vimPlugins.coc-prettier
    pkgs.vimPlugins.coc-python
    pkgs.vimPlugins.coc-tsserver
    pkgs.vimPlugins.fugitive
    pkgs.vimPlugins.gitgutter
    pkgs.vimPlugins.nerdtree
    pkgs.vimPlugins.nerdtree-git-plugin
    pkgs.vimPlugins.surround
    pkgs.vimPlugins.undotree
    pkgs.vimPlugins.vim-addon-nix
    pkgs.vimPlugins.vim-airline
    pkgs.vimPlugins.vim-airline-themes
    pkgs.vimPlugins.vim-colorschemes
    pkgs.vimPlugins.vim-repeat
    pkgs.vimPlugins.vim-sexp
    pkgs.vimPlugins.vim-sexp-mappings-for-regular-people
    pkgs.vimPlugins.vim-sleuth
    pkgs.vimPlugins.vim-tsx
    pkgs.vimPlugins.yats-vim
  ];
};

programs.vscode = { 
  enable = true;
  extensions = [ ]; 
};
}

