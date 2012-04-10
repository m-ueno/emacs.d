;; smartchr.el (= の両脇にスペース)

(require 'smartchr)
;;(global-set-key (kbd "=") (smartchr '(" = " "=" " == " " === ")))
(defun my-smartchr-setting ()
  (local-set-key (kbd "\"") (smartchr '("\"`!!'\"" "\"")))
  (local-set-key (kbd "'") (smartchr '("'" "'`!!''")))

  (local-set-key (kbd "(") (smartchr '("(" "(`!!')")))
  (local-set-key (kbd "{") (smartchr '("{" "{`!!'}" "{ `!!' }" "{\n`!!'\n}")))
  (local-set-key (kbd "[") (smartchr '("[" "[`!!']")))
  )
(defun my-smartchr-setting-rails ()
  (local-set-key (kbd "%") (smartchr '("<%= `!!' %>" "%")))
  )

(add-hook 'c-mode-hook 'my-smartchr-setting)
(add-hook 'javascript-mode-hook 'my-smartchr-setting)
(add-hook 'perl-mode-hook 'my-smartchr-setting)
(add-hook 'ruby-mode-hook 'my-smartchr-setting)
(add-hook 'html-mode-hook 'my-smartchr-setting-rails)

;; ;; { で閉じ括弧を補完(Cのcompletetion と競合)
;; ; substitute `!!' with cursor
;; ;(global-set-key (kbd "{")
;; ;        (smartchr '("{ `!!' }" "{ \"`!!'\" }" "{")))
