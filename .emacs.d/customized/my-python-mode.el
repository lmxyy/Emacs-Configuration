;; (add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook
	  '(lambda ()
	     (setq default-tab-width 4)
	     (auto-complete-mode 1)
	     )
	  )
(provide 'my-python-mode)
