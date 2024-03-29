;;; init-lang.el
;;; for editing programming languages

(setq compilation-scroll-output t)

;; hatena
(setq-default
 tab-width 4
 indent-tabs-mode nil)

;; bat
(require 'batch-mode)

;; C
;; http://oku.edu.mie-u.ac.jp/~okumura/c/style.html
(require 'cc-mode)
(add-hook 'c-mode-common-hook
          '(lambda ()
             (progn
               (c-set-style "user")
               (setq c-auto-newline nil)
               (c-toggle-hungry-state 1)
               (setq c-basic-offset 4 indent-tabs-mode nil))))

;; C#
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

;; css-mode
(autoload 'css-mode "css-mode" "Mode for editing CSS files" t)
(setq auto-mode-alist
      (append '(("\\.css$" . css-mode))
              auto-mode-alist))

;; Fortran 90
(add-hook 'f90-mode-hook
          '(lambda ()
             (define-key f90-mode-map "¥C-m" 'newline-and-indent)))

;; JavaScript

;; comment-out 2011-08-23 23:36
;; (autoload 'js2-mode "js2" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; ;;http://d.hatena.ne.jp/gan2/20080625/1214410086
;; ; tabで位置をビシッと決める。
;; (setq js2-bounce-indent-flag nil)
;; ;インデントしたときにスペースを除いた行頭にポイントが移動するようにした。
;; ;(define-key js2-mode-map "\C-i" 'indent-and-back-to-indentation)
;; (add-hook 'js2-mode-hook
;;           '(lambda ()
;;              (setq js2-bounce-indent-flag nil)
;;              (define-key js2-mode-map "\C-m" 'newline-and-indent)
;;              (define-key js2-mode-map "\C-i" 'indent-and-back-to-indentation)
;;              ))
;; (defun indent-and-back-to-indentation ()
;;   (interactive)
;;   (indent-for-tab-command)
;;   (let ((point-of-indentation
;;          (save-excursion
;;            (back-to-indentation)
;;            (point))))
;;     (skip-chars-forward "\s " point-of-indentation)))
;;; js2-mode
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

                                        ; fixing indentation
                                        ; refer to http://mihai.bazon.net/projects/editing-javascript-with-emacs-js2-mode
(autoload 'espresso-mode "espresso")

(defun my-js2-indent-function ()
  (interactive)
  (save-restriction
    (widen)
    (let* ((inhibit-point-motion-hooks t)
           (parse-status (save-excursion (syntax-ppss (point-at-bol))))
           (offset (- (current-column) (current-indentation)))
           (indentation (espresso--proper-indentation parse-status))
           node)

      (save-excursion

        ;; I like to indent case and labels to half of the tab width
        (back-to-indentation)
        (if (looking-at "case\\s-")
            (setq indentation (+ indentation (/ espresso-indent-level 2))))

        ;; consecutive declarations in a var statement are nice if
        ;; properly aligned, i.e:
        ;;
        ;; var foo = "bar",
        ;;     bar = "foo";
        (setq node (js2-node-at-point))
        (when (and node
                   (= js2-NAME (js2-node-type node))
                   (= js2-VAR (js2-node-type (js2-node-parent node))))
          (setq indentation (+ 4 indentation))))

      (indent-line-to indentation)
      (when (> offset 0) (forward-char offset)))))

(defun my-indent-sexp ()
  (interactive)
  (save-restriction
    (save-excursion
      (widen)
      (let* ((inhibit-point-motion-hooks t)
             (parse-status (syntax-ppss (point)))
             (beg (nth 1 parse-status))
             (end-marker (make-marker))
             (end (progn (goto-char beg) (forward-list) (point)))
             (ovl (make-overlay beg end)))
        (set-marker end-marker end)
        (overlay-put ovl 'face 'highlight)
        (goto-char beg)
        (while (< (point) (marker-position end-marker))
          ;; don't reindent blank lines so we don't set the "buffer
          ;; modified" property for nothing
          (beginning-of-line)
          (unless (looking-at "\\s-*$")
            (indent-according-to-mode))
          (forward-line))
        (run-with-timer 0.5 nil '(lambda(ovl)
                                   (delete-overlay ovl)) ovl)))))

(defun my-js2-mode-hook ()
  (require 'espresso)
  (setq espresso-indent-level 4
        indent-tabs-mode nil
        c-basic-offset 4)
  (c-toggle-auto-state 0)
  (c-toggle-hungry-state 1)
  (set (make-local-variable 'indent-line-function) 'my-js2-indent-function)
                                        ; (define-key js2-mode-map [(meta control |)] 'cperl-lineup)

  (define-key js2-mode-map "\C-m" 'newline-and-indent)
                                        ; (define-key js2-mode-map [(backspace)] 'c-electric-backspace)
                                        ; (define-key js2-mode-map [(control d)] 'c-electric-delete-forward)
  (define-key js2-mode-map "\C-\M-q" 'my-indent-sexp)

  ;; add 2011-08-25 10:04
  (setq js2-mirror-mode nil
        js2-strict-inconsistent-return-warning nil
        js2-missing-semi-one-line-override t)
  ;; end

  (if (featurep 'js2-highlight-vars)
      (js2-highlight-vars-mode))
  (message "My JS2 hook"))

(add-hook 'js2-mode-hook 'my-js2-mode-hook)


;; Lua
(require 'lua-mode)


;; nxhtml
;;(load "~/site-lisp/nxhtml/autostart22.el")
(add-hook 'nxml-mode
          (lambda()
            (setq indent-tabs-mode nil)))

;; Perl
(defalias 'perl-mode 'cperl-mode)
(add-to-list 'auto-mode-alist '("\\.xcr$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.t$" . cperl-mode))

(add-hook 'cperl-mode-hook
          (lambda ()
            (cperl-set-style "PerlStyle")
            (setq indent-tabs-mode nil  ;スペースを使う
                                        ;cf. untabify
                  tab-width 4
                  cperl-indent-level 4
                  cperl-continued-statement-offset 4
                  cperl-close-paren-offset -4
                  cperl-comment-column 40
                  cperl-highlight-variables-indiscriminately t
                  cperl-indent-parens-as-block t
                  cperl-label-offset -4
                  cperl-tab-always-indent nil
                  cperl-font-lock t)

            (set-face-bold-p 'cperl-array-face nil)
            (set-face-background 'cperl-array-face nil)
            (set-face-bold-p 'cperl-hash-face nil)
            (set-face-italic-p 'cperl-hash-face nil)
            (set-face-background 'cperl-hash-face nil)
            (require 'perl-completion)
            (perl-completion-mode t)
            (setq plcmp-buffer-dabbrev-expansions-number 0)
            (define-key cperl-mode-map (kbd "C-c C-j") 'jaunte))) ;re-override
;; perldoc -m を開く

;; モジュールソースバッファの場合はその場で、
;; その他のバッファの場合は別ウィンドウに開く。
(put 'perl-module-thing 'end-op
     (lambda ()
       (re-search-forward "\\=[a-zA-Z][a-zA-Z0-9_:]*" nil t)))
(put 'perl-module-thing 'beginning-op
     (lambda ()
       (if (re-search-backward "[^a-zA-Z0-9_:]" nil t)
           (forward-char)
         (goto-char (point-min)))))

(defun perldoc-m ()
  (interactive)
  (let ((module (thing-at-point 'perl-module-thing))
        (pop-up-windows t)
        (cperl-mode-hook nil))
    (when (string= module "")
      (setq module (read-string "Module Name: ")))
    (let ((result (substring (shell-command-to-string (concat "perldoc -m " module)) 0 -1))
          (buffer (get-buffer-create (concat "*Perl " module "*")))
          (pop-or-set-flag (string-match "*Perl " (buffer-name))))
      (if (string-match "No module found for" result)
          (message "%s" result)
        (progn
          (with-current-buffer buffer
            (toggle-read-only -1)
            (erase-buffer)
            (insert result)
            (goto-char (point-min))
            (cperl-mode)
            (toggle-read-only 1)
            )
          (if pop-or-set-flag
              (switch-to-buffer buffer)
            (display-buffer buffer)))))))

;; php-mode
(require 'php-mode)

;; rd-mode
(autoload 'rd-mode "rd-mode" "major mode for ruby document formatter RD" t)
(add-to-list 'auto-mode-alist '("\\.rd$" . rd-mode))

;; ruby-mode
(require 'rvm)
(rvm-use-default)

(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(setq ruby-deep-indent-paren-style nil) ; http://www.hinet.mydns.jp/tdiary/20060923.html

;; http://d.hatena.ne.jp/eiel/20101106
(require 'ruby-block)
(setq ruby-block-highlight-toggle t)
(defun ruby-mode-hook-ruby-block()
  (ruby-block-mode t))
(add-hook 'ruby-mode-hook 'ruby-mode-hook-ruby-block)

(defun ruby-mode-hook-init ()
  "encodingを自動挿入しないようにする"
  (remove-hook 'before-save-hook 'ruby-mode-set-encoding)
  (defun ruby-mode-set-encoding () ()))
(add-hook 'ruby-mode-hook 'ruby-mode-init)

(defun my-ruby-mode-set-encoding ()
  "set-encoding ruby-mode"
  (interactive)
  (ruby-mode-set-encoding))
(define-key ruby-mode-map "\C-ce" 'my-ruby-mode-set-encoding)

;; (setq ruby-insert-encoding-magic-comment nil)

