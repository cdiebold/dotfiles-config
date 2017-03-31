;;; Set up package
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; disable the startup message
(setq inhibit-startup-message t)
;;; Bootstrap use-package
;; Install use-package if it's not already installed.
;; use-package is used to configure the rest of the packages.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(use-package try 
  :ensure t)
(use-package which-key
  :ensure t
  :config
  (which-key-mode))
;; From use-package README
(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)
;; (setq use-package-verbose t)
(server-start)

(require 'org)
;;; Load the config
(org-babel-load-file (concat user-emacs-directory "config.org"))

(setq gc-cons-threshold 800000)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4854b49f6164135c3bfc11a9f0e0b7449cbab0aab3ef3e72fe6cb434b7356503" default)))
 '(package-selected-packages
   (quote
    (go-mode sass-mode hl-todo golden-ratio powerline helm-projectile projectile git-gutter-fringe use-package tern-auto-complete switch-window solarized-theme pandoc pallet org neotree mentor melpa-upstream-visit magit js2-mode javadoc-lookup jar-manifest-mode indent-guide helm-spotify-plus helm-spotify groovy-mode grails fontawesome flymake-yaml flymake-sass flymake-rust flymake-less flymake-json flymake-jslint flymake-jshint flymake-google-cpplint flymake-go flymake-elixir flymake-css flymake-cppcheck flycheck-swift3 flycheck-swift flycheck-rust flycheck-mix flycheck-elm flycheck-elixir flycheck-demjsonlint flycheck-cstyle flycheck-css-colorguard flycheck-credo evil-nerd-commenter erlang elm-yasnippets elm-mode elixir-yasnippets dockerfile-mode docker-api docker devdocs cucumber-goto-step ctags-update css-comb clang-format circe cheatsheet bundler autopair anything-project anything-git-files ant angular-snippets angular-mode alchemist))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
