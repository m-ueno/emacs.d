;; .emacs
;; $Last update: 2011/07/27  8:55:28 $
;; ・基本init-global.el
;; ・elispは utility-functions.el へ

(eval-when-compile (require 'cl))

(defun add-to-load-path (&rest paths)
  (mapc '(lambda (path) (add-to-list 'load-path path))
        (mapcar 'expand-file-name paths)))

;; elispと設定ファイルのディレクトリをload-pathに追加
(add-to-load-path
 "~/.emacs.d/conf"
 "~/.emacs.d/elisp"
 "~/.emacs.d/elisp/goby"
 "~/.emacs.d/elisp/navi2ch"
 "~/.emacs.d/elisp/slime"
 "~/.emacs.d/elisp/slime/contrib"
 "/usr/share/emacs/site-lisp/"
 )

;; eval-safe
;; http://www.sodan.org/~knagano/emacs/dotemacs.html#eval-safe
(defmacro eval-safe (&rest body)
  `(condition-case err
       (progn ,@body)
     (error (message "[eval-safe] %s" err))))

;; 分岐 : (or #'system-name system-type system-configuration)
(if (string-equal "gnu/linux" system-type)
    (load "init-linux"))

(load "conf-long")
(load "conf-tips")
(load "utility-functions")

(load "init-anything")
(load "init-color")
(load "init-dired")
(load "init-font")			;Consolas13
(load "init-flymake")
(load "init-goby")
(load "init-lang")
(load "init-load")
(load "init-mozc")
(load "init-myopera")
(load "init-outline")
(load "init-slime")			; init-lispを統合
(load "init-yas")
(load "init-yatex")			; init-auctex/init-yatexを分離

;; for auto-install
;(setq url-proxy-services '(("http" . "proxy.kuins.net:8080")))
;(setq url-proxy-services nil)

;; comment out 2011/07/14
;; (set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

