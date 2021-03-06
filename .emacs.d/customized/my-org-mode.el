(setq org-startup-indented t)
(add-hook 'org-mode-hook
	  (lambda ()
	    ;; 不用主题
	    (defun disable-all-themes ()
	      "disable all active themes."
	      (dolist (i custom-enabled-themes)
		(disable-theme i)))
	    
	    (defadvice load-theme (before disable-themes-first activate)
	      (disable-all-themes))
	    ;; 快速插入代码块
	    (defun org-insert-src-block (src-code-type)
	      "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
	      (interactive
	       (let ((src-code-types
		      '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
			"calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
			"octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
			"haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
			"scheme" "sqlite" "verilog")))
		 (list (ido-completing-read "Source code type: " src-code-types))))
	      (progn
		(newline-and-indent)
		(insert (format "#+BEGIN_SRC %s\n" src-code-type))
		(newline-and-indent)
		(insert "#+END_SRC\n")
		(previous-line 2)
		(org-edit-src-code)))
	    ;; turn on flyspell-mode by default
	    ;; (flyspell-mode 1)
	    ;; C-TAB for expanding
	    ;; (local-set-key (kbd "C-<tab>") 'yas/expand-from-trigger-key)
	    ;; keybinding for editing source code blocks
	    (local-set-key (kbd "C-c s e") 'org-edit-src-code)
	    ;; keybinding for inserting code blocks
	    (local-set-key (kbd "C-c s i") 'org-insert-src-block)    
	    )
	  )
(provide 'my-org-mode)
