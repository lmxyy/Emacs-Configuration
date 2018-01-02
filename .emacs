;; Refresh the Packages
(require 'package)
;; If you want to use latest version
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; If you want to use last tagged version
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/My Own Configuration"))
(require 'my-cpp-mode)
(require 'my-ido-mode)
(require 'my-init)
(require 'my-java-mode)
(require 'my-multiple-cursors)
(require 'my-org-mode)
(require 'my-tex-mode)
(require 'my-verilog-mode)
(require 'my-hs-minor-mode)

;; --------------------Custom Sets--------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (multiple-cursors org htmlize yasnippet auto-complete)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier 10 Pitch" :foundry "bitstream" :slant normal :weight bold :height 151 :width normal)))))
;; 禁用cua快捷键
