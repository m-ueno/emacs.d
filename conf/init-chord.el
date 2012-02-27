;;; init-chord.el ---

(require 'key-chord)
(key-chord-mode t)

(setq key-chord-two-keys-delay 0.04)

(defun test-keychord()
  (interactive)
  (view-mode)
  (message "hoge"))
(key-chord-define-global "jk" '(lambda()
                                 (interactive)
                                 (vi-mode)
                                 (message (format "vi-mode"))))
;(key-chord-define-global "jk" 'test-keychord)

(key-chord-define-global "hj" 'goto-line)
(key-chord-define-global "ja" 'jaunte)
(key-chord-define-global ",."     "<>\C-b")
;; (key-chord-define-global [?h ?j]  'undo)  ; the same
(key-chord-define-global "cv"     'reindent-then-newline-and-indent)

