;; v0.4
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
;; By default, *Help*, *Completions*, *compilation*, and *Occur*

(gdefkey "C-x p" popwin:keymap)

;; | Key    | Command                    |
;; |--------+----------------------------|
;; | b, C-b | popwin:popup-buffer        |
;; | M-b    | popwin:popup-buffer-tail   |
;; | o, C-o | popwin:display-buffer      |
;; | p, C-p | popwin:display-last-buffer |
;; | f, C-f | popwin:find-file           |
;; | M-f    | popwin:find-file-tail      |
;; | s, C-s | popwin:select-popup-window |
;; | M-s    | popwin:stick-popup-window  |
;; | 0      | popwin:close-popup-window  |
;; | m, C-m | popwin:messages            |
