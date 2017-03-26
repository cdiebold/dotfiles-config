(setq font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)
;; Dont beep. No Visual Bell. Just blink the Mode line on errors.
(setq visual-bell nil)
(setq rung-bell-function(lambda()
			  (invert-face 'mode-line)
			  (run-with-timer 0.05 nil 'invert-face 'mode-line)))
;; Highlight current line
(global-hl-line-mode 1)

;; set custom path for themes
(setq custom-theme-directory (concat user-emacs-directory "themes"))

(dolist
    (path (directory-files custom-theme-directory t "\\w+"))
  (when (file-directory-p path)
    (add-to-list 'custom-theme-path path)))


;; Don't defer screen updates when performing operations
(setq redisplay-dont-pause t)

;; org-mode colors
(setq org-todo-keyword-faces
      '(
	("INPR" . (:foreground "yellow" :weight bold))
	("DONE" . (:foreground "green" :weight bold))
	("IMPEDED" . (:foreground "red" :weight bold))
	))
;; highlight matching parens when cursor is on them
(show-paren-mode 1)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (blink-cursor-mode -1))

;; Make zooming affect frame instead of buffers
(require 'zoom-frm)


(provide 'appearence)
