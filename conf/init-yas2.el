;;; init-yas.el ---

(require 'yasnippet)
;(require 'yasnippet-config)
(setq yas/snippet-dirs
      '("~/.emacs.d/snippets"
        "~/.emacs.d/elisp/yasnippet/snippets"))
(yas/global-mode 1)

;; (setq yas/trigger-key (kbd "SPC"))
;; (setq yas/next-field-key (kbd "TAB"))


