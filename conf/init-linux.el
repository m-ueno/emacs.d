;;; init-linux.el --- 

(when window-system
  (progn
    (set-default-font "Consolas-14")
;    (set-default-font "ricty-14")
    (set-fontset-font (frame-parameter nil 'font)
                      'japanese-jisx0208
                      '("M+2VM+IPAG circle" . "unicode-bmp"))))

(provide 'init-linux)
;;; init-linux.el ends here

