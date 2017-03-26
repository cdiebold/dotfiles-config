; defvar is the correct way to declare global variables
; you might see setq as well, but setq is supposed to be use just to set variables,
					; not create them.

(defvar required-packages
  '(
    magit
    yasnippets
    helm
    flycheck
    indent-guide
    elixir-yasnippets
    evil-nerd-commenter
    flycheck-mix
    tern
    tern-auto-complete
    org
    neotree
    flycheck-elixir
    auto-complete
    org-bullets
    poweerline
    
    } ; a list of required packages installed at luanch
    (dolist (p required-packages)
      (when (not (package-installed-p p))
	(package-install p)))
    
