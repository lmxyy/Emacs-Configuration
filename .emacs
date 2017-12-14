;;--------------------General--------------------
;; Refresh the Packages
(require 'package)
;; If you want to use latest version
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; If you want to use last tagged version
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;; Keyboard Shortcuts
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "C-`") 'set-mark-command)
(global-set-key (kbd "<f5>") 'eshell)
;; 修改透明度
(set-frame-parameter (selected-frame) 'alpha (list 78 78))
(add-to-list 'default-frame-alist (cons 'alpha (list 78 78)))
;; set the cursor
(setq-default cursor-type 'bar)
;; comment-dwim
(defun strong-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command. If no region is selected and current line is not blank and we are not at the end of the line, then comment current line. Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key (kbd "M-;") 'strong-comment-dwim-line) 
;; Remove tool bar
(tool-bar-mode -1)
;; 不要滚动栏，现在都用滚轴鼠标了，可以不用滚动栏了
(scroll-bar-mode -1)
;; 设置行号
(global-linum-mode t)
;; Change the Title
(setq frame-title-format "%b@lmxyy'-emacs")
;; 滚动页面时比较舒服，不要整页的滚动
(setq scroll-step 1
      scroll-margin 3
      scroll-conservatively 10000)
;; 设置界面 start
(if window-system
    (setq default-frame-alist
	  (append
	   '( (top . 0)
	      (left . 0)
	      (width . 300)
	      (height . 300))
	   default-frame-alist))
  )
;; 允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)
;; 去掉菜单栏，我将F10绑定为显示菜单栏，万一什么东西忘了，需要菜单栏了可以摁F10调出，再摁F10就去掉菜单
(menu-bar-mode -1)
;; 显示列号
(setq column-number-mode t)
;; 开启语法高亮。
(global-font-lock-mode 1)
;; Auto Indent
(global-set-key (kbd "RET") 'newline-and-indent)


;; --------------------Tex Mode--------------------
;; Emacs加载Auctex
;; (load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)
;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
;; (setq-default TeX-master nil)	    
;; (add-hook 'LaTeX-mode-hook
;; 	  '(lambda ()
;; 	     ;;LaTeX 模式下，不打开自动折行
;; 	     (turn-off-auto-fill)
;; 	     ;; 打开自动补全
;; 	     (auto-complete-mode 1)
;; 	     ;; 启动 math mode，你也可以不用。
;; 	     (LaTeX-math-mode 1)
;; 	     ;; 打开 outline mode
;; 	     (outline-minor-mode 1)
;; 	     ;; 接下来是和编译 TeX 有关的
;; 	     ;; 编译的时候，不在当前窗口中显示编译信息
;; 	     (setq TeX-show-compilation nil)
;; 	     (setq TeX-clean-confirm nil)
;; 	     (setq TeX-save-query nil)
;; 	     ;; 按 \ 后光标跳到 mini-buffer 里面输入命令
;; 	     ;; 看个人习惯，因为如果有了 auto-complete 和 yasnippet
;; 	     ;; 这个不开启也问题不大。
;; 	     (setq TeX-electric-escape t)
;; 	     ;; 重新定义 pdf viewer，我设定为了 evince。
;; 	     (setq TeX-view-program-list '(("Evince" "evince %o")))
;; 	     (setq TeX-view-program-selection
;; 	     	   '((output-pdf "Evince")))
;; 	     ;; 设置编译引擎为 XeTeX
;; 	     (setq TeX-global-PDF-mode t
;; 	     	   TeX-engine 'xetex)
;; 	     ;; 使用 XeLaTeX 作为默认程序来编译 LaTeX
;; 	     (add-to-list 'TeX-command-list
;; 	     		    '("XeLaTeX" "%'xelatex%(mode)%' %t"
;; 	     				     TeX-run-TeX nil t))
;; 	     (setq TeX-command-default "XeLaTeX")
;; 	     )
;; 	  )


;;;;;;;;;;;;;;AUCTex initiating;;;;
(load "auctex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;;;;;;;;;;;;RefTex;;;;;;;;;;;;;;;;
(require 'reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) 
(setq reftex-plug-into-AUCTeX t)
(setq reftex-enable-partial-scans t)
(setq reftex-save-parse-info t)
(setq reftex-use-multiple-selection-buffers t)
(setq reftex-toc-split-windows-horizontally t) ;;*toc*buffer在左侧。
(setq reftex-toc-split-windows-fraction 0.2)  ;;*toc*buffer 使用整个frame的比例。
(autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)  
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)
;;;;;;;;;;;;;;;CDLatex;;;;;;;;;;;;
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
(autoload 'cdlatex-mode "cdlatex" "CDLaTeX Mode" t)
(autoload 'turn-on-cdlatex "cdlatex" "CDLaTeX Mode" nil)

;;;;;;;;;math-mode;;;;;;;;;;;;;;;
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;;;;;;;;;LaTex-mode settings;;;;;
(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (TeX-fold-mode 1)
	    (turn-off-auto-fill)              ;;LaTeX模式下，不打开自动折行
	    (linum-mode 1)
	    (auto-complete-mode 1)
	    (LaTeX-math-mode 1)
	    (outline-minor-mode 1)            ;;使用 LaTeX mode 的时候打开 outline mode
	    (setq TeX-show-compilation nil)   ;;NOT display compilation windows
	    (setq TeX-global-PDF-mode t       ;;PDF mode enable, not plain
		  TeX-engine 'xetex)  ;;use xelatex default
	    (setq TeX-clean-confirm nil)
	    (setq TeX-save-query nil)
	    (imenu-add-menubar-index)
	    (setq font-latex-fontify-script t)
	    (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
	    ;; 用C-TAB代替排版
	    (global-set-key (kbd "C-<tab>") 'indent-for-tab-command)
	    (setq TeX-electric-escape t)      ;; 按 \ 后光标跳到mini-buffer里面输入命令
	    (setq TeX-view-program-list '(("Evince" "evince %o"))) ;;重新定义pdf viewer
	    (setq TeX-view-program-selection '((output-pdf "Evince")))
	    (add-to-list 'TeX-command-list '("XeLaTeX" "%'xelatex%(mode)%' %t" TeX-run-TeX nil t))
	    (setq TeX-command-default "XeLaTeX")
	    (setq TeX-fold-env-spec-list (quote (("[comment]" ("comment")) ("[figure]" ("figure")) ("[table]" ("table"))("[itemize]"("itemize"))("[enumerate]"("enumerate"))("[description]"("description"))("[overpic]"("overpic"))("[tabularx]"("tabularx"))("[code]"("code"))("[shell]"("shell")))))

	    ;;定义latex-mode下的快捷键
	    (define-key LaTeX-mode-map (kbd "C-c C-p") 'reftex-parse-all)
	    
            ;;;;;;设置更深层的目录;;;;;;;;;;;;;
	    (setq reftex-section-levels
		  '(("part" . 0) ("chapter" . 1) ("section" . 2) ("subsection" . 3)
		    ("frametitle" . 4) ("subsubsection" . 4) ("paragraph" . 5)
		    ("subparagraph" . 6) ("addchap" . -1) ("addsec" . -2)))


	    (setq LaTeX-section-hook
		  '(LaTeX-section-heading
		    LaTeX-section-title
		    ;;LaTeX-section-toc
		    LaTeX-section-section
		    LaTeX-section-label))
	    ;; 设置编译信息
	    (defun compile-xelatex ()
	      (interactive)
	      (compile (format "xelatex -shell-escape %s" (buffer-name))))
	    (global-set-key (kbd "<f9>") 'compile-xelatex)
	    (defun compile-latex ()
	      (interactive)
	      (compile (format "latex -shell-escape %s" (buffer-name))))
	    (global-set-key (kbd "C-<f9>") 'compile-latex)
	    (global-set-key (kbd "C-c =") 'show-subtree)
	    (global-set-key (kbd "C-c -") 'hide-subtree)
	    
	    ;; 设置tab为4个空格的宽度	 
	    ;; (setq c-basic-offset 4)
	    ;; (setq default-tab-width 4)
	    
	    ));;


(provide 'my-auctex)


;; --------------------C++ Mode--------------------
(add-hook 'c++-mode-hook
	  '(lambda ()
	     ;; 设置编译信息
	     (defun compile-cpp ()
	       (interactive)
	       (compile (format "g++ -o %s %s -g -lm -Wall -std=c++11"  (file-name-sans-extension (buffer-name))(buffer-name))))
	     (defun compile-cpp-O2 ()
	       (interactive)
	       (compile (format "g++ -o %s %s -g -lm -Wall -std=c++11 -O2"  (file-name-sans-extension (buffer-name))(buffer-name))))
	     (global-set-key (kbd "<f9>") 'compile-cpp)
	     (global-set-key (kbd "C-<f9>") 'compile-cpp-O2)
	     ;; 设置一键调试
	     (global-set-key (kbd "<f8>") 'gud-gdb)
	     ;; 设置tab为4个空格的宽度	 
	     (setq c-basic-offset 4)
	     (setq default-tab-width 4)
	     )
	  )

;; --------------------Java Mode--------------------
(add-hook 'java-mode-hook
	  '(lambda ()
	     ;; 设置编译信息
	     (defun compile-java ()
	       (interactive)
	       (compile (format "javac %s" (buffer-name))))
	     (global-set-key (kbd "<f9>") 'compile-java)
	     ;; 设置tab为4个空格的宽度	 
	     (setq c-basic-offset 4)
	     (setq default-tab-width 4)
	     )
	  )


;; --------------------Org Mode--------------------
(setq org-startup-indented t)
(add-hook 'org-mode-hook
	  (lambda ()
	    ;; 快速插入代码块
	    (defun org-insert-src-block (src-code-type)
	      "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
	      (interactive
	       (let ((src-code-types
		      '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
			"calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
			"octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
			"haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
			"scheme" "sqlite")))
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
	    ;; (local-set-key (kbd "C-c s e") 'org-edit-src-code)
	    ;; keybinding for inserting code blocks
	    (local-set-key (kbd "C-c s i") 'org-insert-src-block)    
	    )
	  )


;; --------------------Ido Mode--------------------
;; 启用ido模式
(ido-mode t)

;; --------------------Verilog Mode--------------------
(add-hook 'verilog-mode-hook
	  (lambda ()
	    ;; 设置编译信息
	    (defun compile-verilog ()
	      (interactive)
	      (compile (format "iverilog -o %s %s"  (file-name-sans-extension (buffer-name))(buffer-name))))
	    (global-set-key (kbd "<f9>") 'compile-verilog)
	    ;; 代码补全
	    (auto-complete-mode 1)
	    )
	  )

;; --------------------Custon Sets--------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier 10 Pitch" :foundry "bitstream" :slant normal :weight bold :height 151 :width normal)))))
