{ pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    package = pkgs.neovim-unwrapped;
    configure = {
      customRC = ''
        set autoindent
        set smartindent
      '';
    };
  };
        
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        lsp.enable = true;
        languages = {
	  enableTreesitter = false;

          clang.enable = true;
	  nix.enable = true;
          python.enable = true;
          html.enable = true;
	  ts.enable = true;
          lua.enable = true;
	};
	statusline.lualine.enable = true;
	telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
      };
    };
  };

}
