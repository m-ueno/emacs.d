;;; language.el --- 

;; JavaScript
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; C
;; http://oku.edu.mie-u.ac.jp/~okumura/c/style.html
(require 'cc-mode)
(add-hook 'c-mode-common-hook
     	  '(lambda ()
             (progn
	       (c-set-style "stroustrup")
	       (setq c-auto-newline t)
               (c-toggle-hungry-state 1)
               (setq c-basic-offset 4 indent-tabs-mode nil))))
;; C#
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
   (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

;; bat
(require 'batch-mode)

;; css-mode
(autoload 'css-mode "css-mode" "Mode for editing CSS files" t)
(setq auto-mode-alist
      (append '(("\\.css$" . css-mode))
              auto-mode-alist))

;; nxhtml
;;(load "~/site-lisp/nxhtml/autostart22.el")

;; rd-mode
(autoload 'rd-mode "rd-mode" "major mode for ruby document formatter RD" t)
(add-to-list 'auto-mode-alist '("\\.rd$" . rd-mode))

;; ruby-mode
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(custom-set-variables '(current-language-environment "Japanese"))
;;  ‰¥∞
;(require 'ruby-electric)
;; inf-ruby -- inferior ruby
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                              interpreter-mode-alist))

(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
      '(lambda ()
         (inf-ruby-keys)))

;;Yahtml
;; (setq auto-mode-alist
;;       (cons (cons "\\.html$" 'yahtml-mode) auto-mode-alist))
;; (autoload 'yahtml-mode "yahtml" "Yet Another HTML mode" t)
;; (setq yahtml-www-browser "firefox")
;; (setq yahtml-path-url-alist
;;      '(("/home/yuuji/public_html" . "http://www.mynet/~yuuji")
;; 	("/home/staff/yuuji/html" . "http://www.othernet/~yuuji")))


