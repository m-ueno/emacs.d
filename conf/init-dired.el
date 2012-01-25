;; dired.el

;; あまり使わないがな！

;; wdired
;; http://d.hatena.ne.jp/higepon/20061226/1167098839 経由
(autoload 'wdired-change-to-wdired-mode "wdired")
(add-hook 'dired-load-hook
          '(lambda ()
             (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
             (define-key dired-mode-map
               [menu-bar immediate wdired-change-to-wdired-mode]
               '("Edit File Names" . wdired-change-to-wdired-mode))))
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
;; (require 'wdired-extension) ; not installed!
