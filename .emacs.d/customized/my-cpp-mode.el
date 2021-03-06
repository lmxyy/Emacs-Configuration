(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook
	  '(lambda ()
	     ;; 设置编译信息
	     (defun compile-cpp ()
	       (interactive)
	       (compile (format "g++ -o \"%s\" \"%s\" -g -lm -Wall -std=c++11"  (file-name-sans-extension (buffer-name))(buffer-name))))
	     (defun compile-cpp-O2 ()
	       (interactive)
	       (compile (format "g++ -o \"%s\" \"%s\" -g -lm -Wall -std=c++11 -O2"  (file-name-sans-extension (buffer-name))(buffer-name))))
	     (global-set-key (kbd "<f9>") 'compile-cpp)
	     (global-set-key (kbd "C-<f9>") 'compile-cpp-O2)
	     ;; 设置tab为4个空格的宽度	 
	     (setq c-basic-offset 4)
	     (setq default-tab-width 4)

	     ;; (imenu-add-menubar-index)
	     (which-function-mode)
	     
	     (auto-complete-mode 1)
	     )
	  )
(provide 'my-cpp-mode)
