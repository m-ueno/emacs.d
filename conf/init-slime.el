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
;(setq inferior-lisp-program "sbcl")
;(setq inferior-lisp-program "clisp -K full")
(setq inferior-lisp-program "clisp -K base")
(require 'slime)
(require 'slime-autoloads)

(slime-setup '(slime-fancy))
;; (slime-setup
;;  '(inferior-slime
;;    ;slime-asdf
;;    slime-autodoc
;;    slime-banner
;;    slime-c-p-c
;;    slime-editing-commands
;;    slime-fancy-inspector
;;    slime-fancy
;;    slime-fuzzy
;; ;   slime-highlight-edits
;;    slime-parse
;;    slime-presentation-streams
;;    slime-references
;;    slime-repl
;;    slime-scratch
;;    slime-tramp
;; ;   slime-typeout-frame
;;    ))
(set-language-environment "UTF-8")
(setq slime-net-coding-system 'utf-8-unix)

;; *Memo*
;; slime-snapshot (filename)
;;   "Save a memory image to the file FILENAME."
;; slime-restore (filename)
;;   "Restore a memory image stored in file FILENAME."

;; refer HyperSpec with w3m
(defadvice common-lisp-hyperspec
  (around hyperspec-lookup-w3m () activate)
  (let* ((window-configuration (current-window-configuration))
         (browse-url-browser-function
          `(lambda (url new-window)
             (w3m-browse-url url nil)
             (let ((hs-map (copy-keymap w3m-mode-map)))
               (define-key hs-map (kbd "q")
                 (lambda ()
                   (interactive)
                   (kill-buffer nil)
                   (set-window-configuration ,window-configuration)))
               (use-local-map hs-map)))))
    ad-do-it))

(add-hook 'lisp-mode-hook (lambda ()
                (define-key global-map (kbd "C-c h") 'hyperspec-lookup)
                (slime-mode t) ;minor-mode
                (show-paren-mode 1)))

(require 'hyperspec)
(setq common-lisp-hyperspec-root
      (concat "file://" (expand-file-name "~/doc/HyperSpec/")))
(setq common-lisp-hyperspec-symbol-table
      (expand-file-name "~/doc/HyperSpec/Data/Map_Sym.txt"))
;(slime-autodoc-mode)

(defun my-slime (&optional command coding-system)
  (interactive)
  (if (< (count-windows) 2)
      (split-window-vertically))
  (slime command coding-system))

;; C-c Lでslime起動
(gdefkey "C-c L" 'my-slime)
;; slime 終わり----------------

;; paredit.el -- Emacs LISP TB
;; annoying
;; (require 'paredit)
;; (define-key paredit-mode-map (kbd ")")
;;   'paredit-close-round-and-newline)
;; (define-key paredit-mode-map (kbd "M-)")
;;   'paredit-close-round)

