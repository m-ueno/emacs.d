;;; init-linux.el ---

(when window-system
  (progn
;    (set-default-font "Consolas-14")
    (set-default-font "ricty-16")
    ;; (set-face-attribute 'default nil
    ;;                     :family "SourceCodePro"
    ;;                     :height 140)
    (set-fontset-font (frame-parameter nil 'font)
                      'japanese-jisx0208
                      '("M+2VM+IPAG circle" . "unicode-bmp"))))

(provide 'init-linux)
;;; init-linux.el ends here

(require 'w3m)                          ;for hyperspec
(require '3dmaze)
