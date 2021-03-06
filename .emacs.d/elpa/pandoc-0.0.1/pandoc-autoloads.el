;;; pandoc-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "pandoc" "pandoc.el" (22516 31158 0 0))
;;; Generated autoloads from pandoc.el

(autoload 'pandoc-convert-file "pandoc" "\
Convert `FILE-PATH' as `INPUT-FORMAT' to `OUTPUT-FORMAT'.

\(fn FILE-PATH INPUT-FORMAT OUTPUT-FORMAT)" nil nil)

(autoload 'pandoc-convert-stdio "pandoc" "\
Convert `BODY' as `INPUT-FORMAT' to `OUTPUT-FORMAT'.

\(fn BODY INPUT-FORMAT OUTPUT-FORMAT)" nil nil)

(autoload 'pandoc-open-eww "pandoc" "\
Render `FILE' using EWW and Pandoc.

\(fn FILE)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; pandoc-autoloads.el ends here
