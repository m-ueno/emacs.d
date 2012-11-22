;; -*- coding: utf-8-auto -*-
(eval-when-compile (require 'cl))

(defun add-to-load-path-recompile (&rest paths)
  (mapc '(lambda (path)
           (add-to-list 'load-path path)
           (let (save-abbrevs) (byte-recompile-directory path)))
        (mapcar 'expand-file-name paths)))

(add-to-load-path-recompile
 "~/.emacs.d/conf"
 "~/.emacs.d/elisp")

;; elispと設定ファイルのディレクトリをload-pathに追加
(add-to-load-path-recompile
 "~/.emacs.d/conf"
 "~/.emacs.d/elisp"
 "~/.emacs.d/elisp/3dmaze"
 "~/.emacs.d/elisp/ee"
 "~/.emacs.d/elisp/goby"
 "~/.emacs.d/elisp/haskell-mode"
 "~/.emacs.d/elisp/iiimecf"
 "~/.emacs.d/elisp/jshint-mode"
 "~/.emacs.d/elisp/navi2ch"
 "~/.emacs.d/elisp/slime"
 "~/.emacs.d/elisp/slime/contrib"
 "~/.emacs.d/elisp/w3m"
 "~/.emacs.d/elisp/yasnippet"
 "~/.emacs.d/elisp/yatex/"
 "/usr/share/emacs/site-lisp/"
 )

;; eval-safe
;; http://www.sodan.org/~knagano/emacs/dotemacs.html#eval-safe
(if (string-equal "gnu/linux" system-type)
    (load "init-linux"))
(if (string-equal "windows-nt" system-type)
    (load "init-windows"))
(if (string-equal "arch-lab" (getenv "COMPUTERNAME")) ; equal to 'system-name
    (load "init-lab"))
(if (string-equal system-name "arch-vm")
    (load "init-mozc"))

(load "conf-long")
(load "conf-tips")
(load "utility-functions")

(load "init-ac")
;(load "init-3dmaze")
(load "init-anything")
;(load "init-atok")
(load "init-chord")
(load "init-color")
(load "init-dired")
(load "init-font")          ;Consolas13
(load "init-flymake")
;(load "init-goby")
(load "init-lang")
;(load "init-load")
(load "init-magit")
(load "init-markdown")
;(load "init-myopera")
(load "init-outline")
(load "init-popwin")
(load "init-slime")             ; init-lispを統合
(load "init-smartchr")
(load "init-yas2")
;(load "init-yatex")             ; init-auctex/init-yatexを分離

(prefer-coding-system 'utf-8)

;; for auto-install
;(setq url-proxy-services '(("http" . "proxy.kuins.net:8080")))
;(setq url-proxy-services nil)
(defun ruby-mode-set-encoding () ())

;; comment out 2011/07/14
;; (set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(load "~/.emacs.d/elisp/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such pinstance.
 ;; If there is more than one, they won't work right.
 '(current-language-environment "Japanese")
 '(send-mail-function nil))

;; org-tree-slite
(when (require 'org-tree-slide nil t)
  (org-tree-slide-simple-profile))
(global-set-key (kbd "<f8>") 'org-tree-slide-mode)
(global-set-key (kbd "S-<f8>") 'org-tree-slide-skip-done-toggle)
