(autoload 'goby "goby" nil t)
(setq goby-theme 'dark)

(add-hook 'goby-mode-hook
      '(lambda ()
	 (global-hl-line-mode nil)
	 ))
;; Specify some fonts, e.g.
(setq goby-helvetica "arial")
(setq goby-times     "times new roman")
(setq goby-courier   "courier new")

