;;; init-font.el --- 

(when window-system
  (progn
    (set-default-font "Consolas-13")
    (set-fontset-font (frame-parameter nil 'font)
                      'japanese-jisx0208
                      '("M+2VM+IPAG circle" . "unicode-bmp"))))
