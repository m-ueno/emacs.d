;; init-color.el

;; reverse video
(set-face-foreground 'default "gray90")
(set-face-background 'default "gray10")
(setq frame-background-mode 'dark)

(set-cursor-color "goldenrod")
;; (set-face-foreground 'font-lock-comment-face "turquoise") ;予約語とかぶる
;;(set-face-foreground 'font-lock-comment-face "deep sky blue")
(set-face-foreground 'font-lock-comment-face "pink") ;目立ちすぎる
;;(set-face-background 'font-lock-comment-face "black")  ;; BACKground

;; http://weboo-returns.com/blog/emacs-shows-double-space-and-tab/
(setq whitespace-style
      '(tabs tab-mark spaces space-mark))
(setq whitespace-space-regexp "\\(\x3000+\\)")
(setq whitespace-display-mappings
      '((space-mark ?\x3000 [?\□])
        (tab-mark   ?\t   [?\xBB ?\t])
        ))
(require 'whitespace)
(global-whitespace-mode 1)
(set-face-foreground 'whitespace-space "LightSlateGray")
(set-face-background 'whitespace-space "DarkSlateGray")
(set-face-foreground 'whitespace-tab "LightSlateGray")
(set-face-background 'whitespace-tab "DarkSlateGray")
