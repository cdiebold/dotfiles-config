(setq user-full-name "Chris Diebold"
      user-mail-address "cdiebold2012@gmail.com")

;  (unless (package-installed-p 'use-package)
 ;   (package-install 'use-package))
  ;(setq use-package-verbose t)
 ; (setq use-package-always-ensure t)
 ; (require 'use-package)
 ; (use-package auto-compile
  ;  :config (auto-compile-on-load-mode))
 ; (setq load-prefer-newer t)

(global-auto-revert-mode 1) 
(add-hook 'dired-mode-hook 'auto-revert-mode)

(defalias 'yes-or-no-p 'y-or-n-p)
;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)
(global-linum-mode t) ; line numbers
;; Auto refresh buffers
(global-auto-revert-mode 1)
;; Move files to trash when deleting
(setq delete-by-moving-to-trash t);; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Lines should be 80 characters wide, not 72
(setq fill-column 80)

;; Save a list of recent files visited. (open recent file with C-x f)
(recentf-mode 1)
(setq recentf-max-saved-items 100) ;; just 20 is too recent

;; Save minibuffer history
(savehist-mode 1)
(setq history-length 1000)

;; Undo/redo window configuration with C-c <left>/<right>
(winner-mode 1)

;; Never insert tabs
(set-default 'indent-tabs-mode nil)

;; Show me empty lines after buffer end
(set-default 'indicate-empty-lines t)

;; Easily navigate sillycased words
(global-subword-mode 1)
;; Sentences do not need double spaces to end. Period.
(set-default 'sentence-end-double-space nil)

;; 80 chars is a good width.
(set-default 'fill-column 80)

;; Add parts of each file's directory to the buffer name if not unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; A saner ediff
(setq ediff-diff-options "-w")
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; No electric indent
(setq electric-indent-mode nil)

;; Nic says eval-expression-print-level needs to be set to nil (turned off) so
;; that you can always see what's happening.
(setq eval-expression-print-level nil)
;; Offer to create parent directories if they do not exist
;; http://iqbalansari.github.io/blog/2014/12/07/automatically-create-parent-directories-on-visiting-a-new-file-in-emacs/
(defun my-create-non-existent-directory ()
  (let ((parent-directory (file-name-directory buffer-file-name)))
    (when (and (not (file-exists-p parent-directory))
               (y-or-n-p (format "Directory `%s' does not exist! Create it?" parent-directory)))
      (make-directory parent-directory t))))

(add-to-list 'find-file-not-found-functions 'my-create-non-existent-directory)

(tool-bar-mode 0)
(menu-bar-mode 0)
(when window-system
  (scroll-bar-mode -1))

(global-prettify-symbols-mode t)

(setq ccd/default-font "Inconsolata")
(setq ccd/default-font-size 14)
(setq ccd/font-change-increment 1.3)

(defun ccd/set-font-size()
"Set the font to `ccd/default-font' at `ccd/current-font-size'."
(set-frame-font
(concat ccd/default-font "-" (number-to-string ccd/current-font-size))))

(defun ccd/reset-font-size()
"Change font size back to `ccd/default-font-size'."
(interactive)
(setq ccd/current-font-size ccd/default-font-size)
(ccd/set-font-size))

(defun ccd/increase-font-size()
"Increase current font size by a factor of `ccd/font-change-increment'."
(setq ccd/current-font-size
      (ceiling (* ccd/current-font-size ccd/font-change-increment)))
(ccd/set-font-size))

(defun ccd/decrease-font-size()
"Decrease current font size by a factor of `ccd/font-change-increment'."
(interactive)
(setq ccd/current-font-size
      (max 1
           (floor(/ ccd/current-font-size ccd/font-change-increment))))
(ccd/set-font-size))

(define-key global-map (kbd "C-)") 'ccd/reset-font-size)
(define-key global-map (kbd "C-+") 'ccd/increase-font-size)
(define-key global-map (kbd "C-=") 'ccd/increase-font-size)
(define-key global-map (kbd "C-_") 'ccd/decrease-font-size)
(define-key global-map (kbd "C--") 'ccd/decrease-font-size)

(ccd/reset-font-size)

;; Highlight current line
(when window-system
  (global-hl-line-mode))

;; Don't defer screen updates when performing operations
(setq redisplay-dont-pause t)

(use-package diminish
   :ensure t)

 (defmacro diminish-minor-mode (filename mode &optional abbrev)
 `(eval-after-load (symbol-name ,filename)
    '(diminish ,mode ,abbrev)))
(defmacro diminish-major-mode (mode-hook abbrev)
 `(add-hook ,mode-hook
            (lambda () (setq mode-name ,abbrev))))

 (diminish-minor-mode 'abbrev 'abbrev-mode)
 (diminish-minor-mode 'simple 'auto-fill-function)
 (diminish-minor-mode 'company 'company-mode)
 (diminish-minor-mode 'eldoc 'eldoc-mode)
 (diminish-minor-mode 'flycheck 'flycheck-mode)
 (diminish-minor-mode 'flyspell 'flyspell-mode)
 (diminish-minor-mode 'global-whitespace 'global-whitespace-mode)
 (diminish-minor-mode 'projectile 'projectile-mode)
 (diminish-minor-mode 'yasnippet 'yas-minor-mode)

 (diminish-major-mode 'go 'go-mode)
 (diminish-major-mode 'python-mode-hook "Py")
 (diminish-major-mode 'elixir 'elixir-mode)

(setq locale-coding-system 'utf-8) 
(set-terminal-coding-system 'utf-8) 
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8) 
(prefer-coding-system 'utf-8)

(defvar emacs-autosave-directory
  (concat user-emacs-directory "autosaves/")
  "This variable dictates where to put auto saves. It is set to a
  directory called autosaves located wherever your .emacs.d/ is
  located.")

;; Sets all files to be backed up and auto saved in a single directory.
(setq backup-directory-alist
      `((".*" . ,emacs-autosave-directory))
      auto-save-file-name-transforms
      `((".*" ,emacs-autosave-directory t)))

;; Set custom theme path
(setq custom-theme-directory (concat user-emacs-directory "themes"))

(dolist
    (path (directory-files custom-theme-directory t "\\w+"))
  (when (file-directory-p path)
    (add-to-list 'custom-theme-load-path path)))

(load-theme 'cyberpunk t)

(dolist (mode
         '(abbrev-mode                  ; E.g. sopl -> System.out.println
           column-number-mode           ; Show column number in mode line
           delete-selection-mode        ; Replace selected text
           dirtrack-mode                ; directory tracking in *shell*
;           drag-stuff-global-mode       ; Drag stuff around
           global-company-mode          ; Auto-completion everywhere
           global-git-gutter-mode       ; Show changes latest commit
;           global-prettify-symbols-mode ; Greek letters should look greek
           golden-ratio-mode            ; Automatic resizing of windows
           projectile-global-mode       ; Manage and navigate projects
           recentf-mode                 ; Recently opened files
           show-paren-mode))            ; Highlight matching parentheses
  (funcall mode 1))

(use-package color-theme
  :ensure t)

(use-package git-gutter-fringe  ; git gutter in line num col
:ensure t)

(use-package helm   ; incremental completion and selection like crlp in vim
:ensure t)

(use-package magit ; git genie 
:ensure t)

(use-package flycheck ; syntax checker like syntasitc in vim
:ensure t
:init
(global-flycheck-mode)
)

(use-package yasnippet ; snipper manager
:ensure t
:init
  (yas-global-mode 1)
)

(use-package projectile ; project manager
:ensure t)

(use-package auto-complete ; text auto-completion
:ensure t
:init 
(progn
(ac-config-default)
(global-auto-complete-mode t)
))

(use-package company
:ensure t)

(use-package helm-projectile
  :ensure t)

(use-package js2-mode)
(use-package tern)

(use-package neotree)
(use-package all-the-icons)
(global-set-key [f12] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(use-package evil-nerd-commenter)

(use-package indent-guide)

(setq-default tab-width 2)

(setq compilation-scroll-output t)

(use-package rainbow-mode
  :ensure t)

(add-hook 'css-mode-hook
          (lambda()
            (rainbow-mode)
            (setq css-indent-offset 2)))
(add-hook 'scss-mode-hook 'rainbow-mode)

(setq js-indent-level 2)
(add-hook 'coffee-mode-hook
          (lambda()
            (yas-minor-mode 1)
            (setq coffee-tab-width 2)))

(global-set-key (kbd "C-x g") 'magit-status)

(setq magit-push-always-verify nil)

(setq python-indent 2)

(add-hook 'web-mode-hook
          (lambda()
            (rainbow-mode)
            (setq web-mode-markup-indent-offset 2)))

(setq org-directory "~/org-docs")

(defun org-file-path (filename)
"Return the absolute address of an org file, given its relative name"
(concat (file-name-as-directory org-directory) filename))

(setq org-agenda-files (list org-index-file))

(defun ccd/split-window-below-and-switch()
"Splits the window horizontally, then switch to the new pane."
(interactive)
(split-window-below)
(balance-windows)
(other-window 1))

(defun ccd/split-window-right-and-switch()
"Splits the window vertically, then switch to the new pane."
(interactive)
(split-window-right)
(balance-windows)
(other-window 1))

(global-set-key (kbd "C-x 2") 'ccd/split-window-below-and-switch)
(global-set-key (kbd "C-x 3") 'ccd/split-window-right-and-switch)

(use-package sass-mode)

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0))))) 
    ))

(use-package counsel
  :ensure t)
(use-package swiper
  :ensure t
  :init 
  (progn
   (ivy-mode 1)
   (setq ivy-use-virtual-buffers t)
   (setq enable-recursive-minibuffers t)
   (global-set-key "\C-s" 'swiper)
   (global-set-key (kbd "C-c C-r") 'ivy-resume)
   (global-set-key (kbd "<f6>") 'ivy-resume)
   (global-set-key (kbd "M-x") 'counsel-M-x)
   (global-set-key (kbd "C-x C-f") 'counsel-find-file)
   (global-set-key (kbd "<f1> f") 'counsel-describe-function)
   (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
   (global-set-key (kbd "<f1> l") 'counsel-find-library)
   (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
   (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
   (global-set-key (kbd "C-c g") 'counsel-git)
   (global-set-key (kbd "C-c j") 'counsel-git-grep)
   (global-set-key (kbd "C-c k") 'counsel-ag)
   (global-set-key (kbd "C-x l") 'counsel-locate)
   (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
   (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
  ))

(use-package ox-reveal
:ensure ox-reveal)
(setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
(setq org-reveal-mathjax t)
(use-package htmlize)

(use-package go-mode) ; go programming major mode
  (use-package
  
  (use package exec-path-from-shell
     :ensure t)
 ;;Load Go-specific language syntax
(defun go-mode-setup ()
  (go-eldoc-setup))
(add-hook 'go-mode-hook 'go-mode-setup)
;;Format before saving
(defun go-mode-setup ()
  (go-eldoc-setup)
  (add-hook 'before-save-hook 'gofmt-before-save))
(add-hook 'go-mode-hook 'go-mode-setup)
;;Goimports
(defun go-mode-setup ()
  (go-eldoc-setup)
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save))
(add-hook 'go-mode-hook 'go-mode-setup)

;;Godef, shows function definition when calling godef-jump
(defun go-mode-setup ()
  (go-eldoc-setup)
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'go-mode-setup)

;;Custom Compile Command
(defun go-mode-setup ()
  (setq compile-command "go build -v && go test -v && golint && errcheck")
  (define-key (current-local-map) "\C-c\C-c" 'compile)
  (go-eldoc-setup)
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'go-mode-setup)

;;Load auto-complete
(ac-config-default)
(require 'auto-complete-config)
(require 'go-autocomplete)

(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/github.com/golang/lint/misc/emacs"))
(require 'golint)

(use-package org-bullets
 :ensure t
 :config
 (add-hook 'org-mode-hook (lambda() (org-bullets-mode t)))
)
