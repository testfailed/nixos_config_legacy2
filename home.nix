{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ssm";
  home.homeDirectory = "/Users/ssm";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # services.gpg-agent = {
  #   enable = true;
  #   defaultCacheTtl = 1800;
  #   enableSshSupport = true;
  # };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # Adds the 'hello' command to your environment. It prints a friendly
    # "Hello, world!" when run.
    pkgs.hello

    # It is sometimes useful to fine-tune packages, for example, by applying
    # overrides. You can do that directly here, just don't forget the
    # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    (pkgs.nerdfonts.override { fonts = [
        "FantasqueSansMono"
        "Hack"
        "JetBrainsMono"
        "Meslo"
    ]; })

    # You can also create simple shell scripts directly inside your
    # configuration. For example, this adds a command 'my-hello' to your
    # environment:
    (pkgs.writeShellScriptBin "my-hello" ''
      echo "Hello, ${config.home.username}!"
    '')

    pkgs.asciinema
    pkgs.bat
    pkgs.fd
    pkgs.fortune
    pkgs.fzf
    pkgs.gh
    pkgs.htop
    pkgs.jq
    pkgs.ripgrep
    pkgs.ripgrep-all
    pkgs.tree
    pkgs.watch

    pkgs.gopls
    # pkgs.zigpkgs.master

    # CUSTOM:
    # pkgs.python3
    # pkgs.python312 # NOTE: conflicts with python311
    # pkgs.terraform
    # pkgs.terraform-ls
    pkgs.ansible
    pkgs.awscli2
    pkgs.buf
    pkgs.chezmoi
    pkgs.google-cloud-sdk
    pkgs.kubectl
    pkgs.python311   # NOTE: also try python-rewrite
    pkgs.redis
    pkgs.unzip
    pkgs.watchman

    pkgs.cachix

    # Remove below deps from previous installation.

    # Node is required for Copilot.vim
    pkgs.nodejs
    # pkgs.pnpm # TODO: pnpm is not available in nixpkgs

  # ] ++ (lib.optionals isDarwin [
  #   # This is automatically setup on Linux
  #   pkgs.cachix
  #   pkgs.tailscale
  # ]) ++ (lib.optionals (isLinux && !isWSL) [
  #   pkgs.chromium
  #   pkgs.firefox
  #   pkgs.rofi
  #   pkgs.valgrind
  #   pkgs.zathura
  #   pkgs.xfce.xfce4-terminal
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ssm/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
