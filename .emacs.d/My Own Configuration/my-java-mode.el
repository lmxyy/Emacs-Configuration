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
(provide 'my-java-mode)
