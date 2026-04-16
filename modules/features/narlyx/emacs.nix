{ pkgs, ... }: {
  home-manager.users.narlyx = {

    services.emacs.enable = true;
    programs.emacs = {

      enable = true;
      package = pkgs.emacs;

      extraPackages = epkgs: with epkgs; [

        # Backend
        evil
        good-scroll
        nerd-icons
        doom-modeline
        doom-themes

        # Modes
        nix-mode

      ];

      extraConfig = ''

        ;; ### SETTINGS ###

        (setq inhibit-startup-screen t)
        (setq inhibit-startup-message t)
        (setq inhibit-startup-echo-area-message t)
        (setq inhibit-startup-buffer-menu t)
        (setq make-backup-files nil)
        (setq auto-save-list-file-prefix "~/.emacs.d/autosave/")
        (setq ring-bell-function 'ignore)
        (menu-bar-mode -1)
        (tool-bar-mode -1)
        (scroll-bar-mode -1)
        (global-display-line-numbers-mode t)
        (setq display-line-numbers 'relative)
        (setq-default indent-tabs-mode nil)
        (setq-default tab-width 2)
        (setq-default standard-indent 2)
        (load-theme 'doom-one t)

        ;; ### PLUGINS ###

        ;; Evil
        (setq evil-want-C-i-jump nil)
        (require 'evil)
        (evil-mode 1)

        ;; Doom modeline
        (require 'doom-modeline)
        (doom-modeline-mode 1)
        (setq doom-modeline-height 35)
        (setq doom-modeline-buffer-file-name-stule 'auto)

        ;; Nerd icons
        (require 'nerd-icons)

        ;; Good scrolling
        (require 'good-scroll)
        (good-scroll-mode 1)

        ;; ### MODES ###

        ;; Org mode
        (require 'org)

        ;; Nix mode
        (require 'nix-mode)
        (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
        (add-hook 'nix-mode-hook
          (lambda ()
            (setq-local indent-tabs-mode nil)
            (setq-local tab-width 2)
              (setq-local standard-indent 2)))

      '';

    };

  };
}
