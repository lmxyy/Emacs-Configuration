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
(provide 'my-verilog-mode)
