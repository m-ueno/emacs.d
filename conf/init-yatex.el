;; init-yatex.el
(add-to-load-path "~/.emacs.d/elisp/yatex/")
(require 'yatex)
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))

(add-hook 'yatex-mode-hook #'(lambda () (progn (auto-fill-mode nil)
                                               (show-paren-mode t))))

(setq dviprint-command-format "dvipdfmx %s") ;C-c t l

;;; TeX src-special ¤Î¤¿¤á¤ÎÀßÄê
;;; emacs-xdviÏ¢·È
(if (load "xdvi-search" t) ; É¬¿Ü
    (server-start) ; É¬¿Ü
  (progn
    (custom-set-variables
     '(server-switch-hook (quote (raise-frame)))) ; Áë¤ò¾å¤Ë
    (custom-set-faces)
    (add-hook 'yatex-mode-hook
              '(lambda ()
                 (define-key YaTeX-mode-map "\C-c\C-j" 'xdvi-jump-to-line)))))

(add-hook 'LaTeX-mode-hook
          '(lambda ()
             (let*
                 ((kcode (symbol-name buffer-file-coding-system))
                  (opt (cond
                        ((string-match "^utf-8" kcode) " -kanji=utf8")
                        ((string-match "^shift_jis" kcode) " -kanji=sjis")
                        ((string-match "^euc-jp" kcode) " -kanji=euc")
                        ((string-match "^iso-2022-jp" kcode) " -kanji=jis")
                        (t ""))))
               (if (boundp 'japanese-TeX-command-list)
                   (progn
                     (setcar (cdr (assoc "pLaTeX" japanese-TeX-command-list))
                             (concat "%(PDF)platex" opt " %`%S%(PDFout)%(mode)%' %t"))
                     (setcar (cdr (assoc "jBibTeX" japanese-TeX-command-list))
                             (concat "%(PDF)jbibtex" opt " %s"))
                     (message "pLaTeX UTF-8 flag enabled"))
                 (message "pLaTeX UTF-8 flag disabled")))))

;; M-x align
(require 'align)
(add-to-list 'align-rules-list
             '(yatex-table
               (regexp . "\\(\\s-*\\)&")
               (modes  . '(yatex-mode))))
