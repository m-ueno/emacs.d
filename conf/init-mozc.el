(require 'mozc)  ; or (load-file "/path/to/mozc.el")
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")

(global-set-key [henkan]
		(lambda()
		  (interactive)
		  (set-input-method "japanese-mozc")))

(global-set-key [muhenkan]
		(lambda()
		  (interactive)
		  (set-input-method nil)))
