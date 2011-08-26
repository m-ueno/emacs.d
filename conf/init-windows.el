;;; init-windows.el --- 
(when window-system
  (progn
    (set-default-font "Consolas-14")
;    (set-default-font "ricty-14")
    (set-fontset-font (frame-parameter nil 'font)
                      'japanese-jisx0208
                      '("Meiryo" . "unicode-bmp"))))
