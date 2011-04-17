;; .emacs
;; $Last update: 2011/02/05 18:40:39 $
;; �E��{init-global.el
;; �Eelisp�� utility-functions.el ��
(defun add-to-load-path (&rest paths)
  (mapc '(lambda (path)
           (add-to-list 'load-path path))
        (mapcar 'expand-file-name paths)))

;; elisp�Ɛݒ�t�@�C���̃f�B���N�g����load-path�ɒǉ�
(add-to-load-path
 "~/.emacs.d/elisp"
 "~/.emacs.d/elisp/navi2ch"
 "~/.emacs.d/elisp/slime"
 "~/.emacs.d/conf")

;; eval-safe
;; ���S�ȕ]���B�]���Ɏ��s���Ă������Ŏ~�܂�Ȃ�
;; �t�ɍ���?
;; http://www.sodan.org/~knagano/emacs/dotemacs.html#eval-safe
(defmacro eval-safe (&rest body)
  `(condition-case err
       (progn ,@body)
     (error (message "[eval-safe] %s" err))))

;; CL��require���Ă���
(eval-when-compile (require 'cl))

(load "conf-long")
(load "conf-tips")
(load "utility-functions")

(load "init-anything")
(load "init-color")
(load "init-dired")
(load "init-font")			;Consolas13
(load "init-flymake")
;(load "init-ibus")
(load "init-lang")
(load "init-load")
(load "init-outline")
(load "init-slime")			; init-lisp�𓝍�
(load "init-yas")
(load "init-yatex")			; init-auctex/init-yatex�𕪗�

;; for auto-install
;(setq url-proxy-services '(("http" . "proxy.kuins.net:8080")))

;; 2011/02/01
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
