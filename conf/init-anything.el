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

;http://d.hatena.ne.jp/mooz/20110320/p1
(require 'cl)  ; loop, delete-duplicates
(defun anything-font-families ()
  "Preconfigured `anything' for font family."
  (interactive)
  (flet ((anything-mp-highlight-match () nil))
    (anything-other-buffer
     '(anything-c-source-font-families)
     "*anything font families*")))

(defun anything-font-families-create-buffer ()
  (with-current-buffer
      (get-buffer-create "*Fonts*")
    (loop for family in (sort (delete-duplicates (font-family-list)) 'string<)
          do (insert
              (propertize (concat family "\n")
                          'font-lock-face
                          (list :family family :height 2.0 :weight 'bold))))
    (font-lock-mode 1)))

(defvar anything-c-source-font-families
      '((name . "Fonts")
        (init lambda ()
              (unless (anything-candidate-buffer)
                (save-window-excursion
                  (anything-font-families-create-buffer))
                (anything-candidate-buffer
                 (get-buffer "*Fonts*"))))
        (candidates-in-buffer)
        (get-line . buffer-substring)
        (action
         ("Copy Name" lambda
          (candidate)
          (kill-new candidate))
         ("Insert Name" lambda
          (candidate)
          (with-current-buffer anything-current-buffer
            (insert candidate))))))

(global-set-key (kbd "C-;") 'anything)
;(global-set-key (kbd "M-x") 'anything-M-x)
;(define-key global-map (kbd "C-;") 'anything)

;; http://d.hatena.ne.jp/rubikitch/searchdiary?word=%2a%5bone%2dkey%5d
(define-key global-map (kbd "C-M-;") 'one-key-menu-anything)
