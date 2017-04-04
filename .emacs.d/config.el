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

(set-default-font "Menlo 14")
(setq font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)

;; Highlight current line
(global-hl-line-mode 1)

;; Don't defer screen updates when performing operations
(setq redisplay-dont-pause t)

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
         '(tool-bar-mode                ; No toolbars, more room for text
           scroll-bar-mode              ; No scroll bars either
           blink-cursor-mode))          ; The blinking cursor gets old
  (funcall mode 0))

(dolist (mode
         '(abbrev-mode                  ; E.g. sopl -> System.out.println
           column-number-mode           ; Show column number in mode line
           delete-selection-mode        ; Replace selected text
           dirtrack-mode                ; directory tracking in *shell*
;           drag-stuff-global-mode       ; Drag stuff around
           global-company-mode          ; Auto-completion everywhere
           global-git-gutter-mode       ; Show changes latest commit
           global-prettify-symbols-mode ; Greek letters should look greek
           golden-ratio-mode            ; Automatic resizing of windows
           projectile-global-mode       ; Manage and navigate projects
           recentf-mode                 ; Recently opened files
           show-paren-mode))            ; Highlight matching parentheses
  (funcall mode 1))

(use-package color-theme
  :ensure t)

(use-package org-bullets
 :ensure t
 :config
 (add-hook 'org-mode-hook (lambda() (org-bullets-mode 1)))
)

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

(use-package js2-mode ; javascript mode
:ensure t)

(use-package tern ; javascript completion
:ensure t)

(use-package powerline ; pretty mode lines
:ensure t)

(use-package neotree ; show project as a tree
:ensure t)

(use-package evil-nerd-commenter ; toggle comments in any programming language
:ensure t)

(use-package indent-guide
:ensure t)

(use-package golden-ratio ; auto-resizing of buffers
:ensure t)

(use-package hl-todo ; highlight TODO and similar tags
:ensure t)

(use-package sass-mode
:ensure t)

(use-package elixir-mode
:ensure t)

(use-package alchemist ; elixir tooling integration
:ensure t)

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
