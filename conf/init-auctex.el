;===================================
; AUCTeX
;===================================
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(require 'tex-site)
(setq TeX-default-mode 'japanese-latex-mode)
(setq japanese-TeX-command-default "pTeX")
(setq japanese-LaTeX-command-default "pLaTeX")
(setq japanese-LaTeX-default-style "jsarticle")
(setq TeX-file-extensions '("tex" "sty" "cls" "ltx" "texi" "texinfo" "dtx"))
(setq kinsoku-limit 10)
(setq LaTeX-indent-level 4)
(setq TeX-output-view-style '(("^dvi$" "." "/usr/bin/xdvi %d")))

;; preview-latex ¤Ç dvipng ¤ò»È¤¦
(setq preview-image-type 'dvipng)

