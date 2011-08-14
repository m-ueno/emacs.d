;; init-myopera.el
;; uid: uenop
(require 'weblogger)
(setq weblogger-config-alist
      '(("default" ;; blogのweblogger上での名前
	 "http://my.opera.com/uenop/blog/api/" "uenop" "opera1"
	 "4586712" ;; blogID
	 )))
(setq weblogger-save-password)
(global-set-key (kbd "C-c b s") 'weblogger-start-entry)

(defun my-weblogger-send-entry (&optional arg)
  (interactive)
  (save-buffer)
  (set-buffer-modified-p t)
  (weblogger-save-entry nil arg)
  (my-weblogger-quit))

(defun my-weblogger-quit ()
  (interactive)
  (when (y-or-n-p "Do you want to quit weblogger-entry? ")
    (bury-buffer)))

(add-hook 'weblogger-start-edit-entry-hook
          '(lambda ()
             ;; 必要ないキーバインドを除去
             ;; (define-key weblogger-entry-mode-map (kbd "C-c C-k") nil)
             ;; (define-key weblogger-entry-mode-map (kbd "C-x C-s") nil)
             ;; (define-key weblogger-entry-mode-map (kbd "C-c C-n") nil)
             ;; (define-key weblogger-entry-mode-map (kbd "C-c C-p") nil)

             (define-key weblogger-entry-mode-map
               (kbd "C-c C-c") 'my-weblogger-send-entry)
             (define-key weblogger-entry-mode-map
               (kbd "C-c C-k") 'my-weblogger-quit)
             (auto-fill-mode -1)))
