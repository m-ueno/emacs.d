;; init-slime

;; Lisp
;; 小括弧 () の色を薄くする
;; http://0xcc.net/unimag/10/
(defvar paren-face 'paren-face)
(make-face 'paren-face)
(set-face-foreground 'paren-face "skyblue4")
(setq lisp-font-lock-keywords-2	;; lisp-mode の色設定に追加
      (append '(("(\\|)" . paren-face))
	      lisp-font-lock-keywords-2))

;; SLIME
(add-to-list 'load-path "~/.emacs.d/elisp/slime/")
(add-to-list 'load-path "~/.emacs.d/elisp/slime/contrib/")
;(setq inferior-lisp-program "sbcl")
;(setq inferior-lisp-program "clisp -K full")
(setq inferior-lisp-program "clisp -K base")
(require 'slime)
(require 'slime-autoloads)

(slime-setup '(slime-fancy))
(set-language-environment "UTF-8")
(setq slime-net-coding-system 'utf-8-unix)

;; slime-snapshot (filename)
;;   "Save a memory image to the file FILENAME."
;; slime-restore (filename)
;;   "Restore a memory image stored in file FILENAME."


