;; Eshell Path
(setenv "GCC_HOME" "/usr/local")
(setenv "PATH" (concat (getenv "PATH") ":" (getenv "GCC_HOME") "/bin"))
(setenv "GDB_HOME" "/usr/local/Cellar/gdb/8.1")
(setenv "PATH" (concat (getenv "PATH") ":" (getenv "GDB_HOME") "/bin"))

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  ;; (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/My Own Configuration"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/emacs-color-theme-solarized"))
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(require 'my-cpp-mode)
(require 'my-c-mode)
;; (require 'my-ido-mode)
(require 'my-init)
(require 'my-java-mode)
;; (require 'my-multiple-cursors)
(require 'my-org-mode)
;; (require 'my-tex-mode)
(require 'my-verilog-mode)
(require 'my-hs-minor-mode)
(require 'my-python-mode)
(require 'antlr-mode)
(require 'dash)
(require 'solarized)
;; (require 'color-theme)
;; (load-theme 'solarized t)
(load-theme 'solarized-light t)

(setq auto-mode-alist
      ;; 将文件模式和文件后缀关联起来
      (append '(("\\.py\\'" . python-mode)
                ("\\.s?html?\\'" . html-helper-mode)
                ("\\.g4\\'" . antlr-v4-mode)
                ("\\.asp\\'" . html-helper-mode)
                ("\\.phtml\\'" . html-helper-mode)
                ("\\.css\\'" . css-mode))
              auto-mode-alist))

;; --------------------Custom Sets--------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes
   '("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default))
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(## solarized-theme multiple-cursors org htmlize yasnippet auto-complete))
 '(tool-bar-mode nil))
;; mac下打开文件不要打开两个emacs
(setq ns-pop-up-frames nil)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "PT Mono" :foundry "monotype" :slant normal :weight normal :height 180 :width normal)))))
