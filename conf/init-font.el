;;; init-font.el --- 

(when window-system
  (progn
    (set-default-font "Consolas-14")
;    (set-default-font "ricty-14")
    (set-fontset-font (frame-parameter nil 'font)
                      'japanese-jisx0208
                      '("M+2VM+IPAG circle" . "unicode-bmp"))))

(global-set-key [C-mouse-5] '(lambda ()(interactive)(text-scale-increase -1)))
(global-set-key [C-mouse-4] '(lambda ()(interactive)(text-scale-increase 1)))
(global-set-key [C-mouse-2] '(lambda ()(interactive)(text-scale-increase 0)))

