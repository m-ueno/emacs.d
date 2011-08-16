;; init-Anything
;http://dev.ariel-networks.com/Members/matsuyama/open-anything-emacs
;2007”N‚Ì‹LŽ–
(require 'anything)
(require 'anything-config)
(setq anything-sources
      '(anything-c-source-buffers
	anything-c-source-recentf
	anything-c-source-file-name-history
	anything-c-source-files-in-current-dir
;	anything-c-source-bookmarks
;	anything-c-source-buffer-not-found
;       anything-c-source-locate
;	anything-c-source-calculation-result
;	anything-c-source-info-pages
;	anything-c-source-info-elisp
;	anything-c-source-man-pages
;	anything-c-source-emacs-commands
;	anything-c-source-auto-install-from-emacswiki ;anything-auto-install
;	anything-c-source-auto-install-from-library
))

(global-set-key (kbd "C-;") 'anything)
;(global-set-key (kbd "M-x") 'anything-M-x)
;(define-key global-map (kbd "C-;") 'anything)

;; http://d.hatena.ne.jp/rubikitch/searchdiary?word=%2a%5bone%2dkey%5d
(define-key global-map (kbd "C-M-;") 'one-key-menu-anything)
