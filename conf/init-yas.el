;;; init-yas.el ---

;(add-to-list 'load-path "./.emacs.d/elisp/yasnippet/yasnippet.el")
(require 'yasnippet)
(setq yas/root-directory "~/.emacs.d/snippets")
(yas/load-directory yas/root-directory)
(require 'yasnippet-config)
;(yas/setup)
