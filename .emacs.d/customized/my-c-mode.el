(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-hook
	  '(lambda ()
	     ;; 设置tab为4个空格的宽度	 
	     (setq c-basic-offset 4)
	     (setq default-tab-width 4)

	     (c-set-style "stroustrup")
	     ;; (c-toggle-auto-state)
	     (c-toggle-hungry-state)
	     (imenu-add-menubar-index)
	     (which-function-mode)
	     
	     (auto-complete-mode 1)
	     )
	  )
(provide 'my-c-mode)
