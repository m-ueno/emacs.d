(add-to-load-path "~/.emacs.d/elisp/ee")
;;====================================
;;; Ee - Emacs Information Manager
;;===================================
(require 'ee-autoloads)
;; アウトラインの該当個所を表示
;; ee のアウトライン表示で該当箇所を別ウィンドウに表示できる．
(defadvice previous-line
  (after ee activate)
  (if (and (eq major-mode 'ee-mode)
           (string-match "ee-outline" (buffer-name (current-buffer))))
      (ee-outline-display-buffer)))

(defadvice next-line
  (after ee activate)
  (if (and (eq major-mode 'ee-mode)
           (string-match "ee-outline" (buffer-name (current-buffer))))
      (ee-outline-display-buffer)))

(defadvice ee-view-record-select-or-expansion-show-or-hide
  (around ee-delete-window activate)
  (if (and (eq major-mode 'ee-mode)
           (string-match "ee-outline" (buffer-name (current-buffer))))
      (progn
        ad-do-it
        (delete-other-windows))
    ad-do-it))

(defun my-ee-outline ()
  "事前にoutline-modeを起動してからee-outlineにする"
  (interactive)
  (outline-mode)
  (ee-outline))

;; C-c o で起動。
(global-set-key "\C-co" 'my-ee-outline)


(defun outtree ()
  "outline-tree
見出しを別ウィンドウで表示させる.
by yama @ Thu Mar 29 23:37:45 2007"
  (interactive)
  (if 'outline-mode (outline-mode))
  (hide-body)
  (let* ((basename (princ (buffer-name)))
         (newtmp (concat basename "-tree")))
    (if (get-buffer newtmp)
        (unless (get-buffer-window newtmp)
            (split-window-vertically 10)
            (switch-to-buffer newtmp)
            (other-window 1))
      (progn
        (make-indirect-buffer (current-buffer) newtmp)
        (split-window-vertically 10)
        (switch-to-buffer newtmp)
        (if 'outline-mode (outline-mode))
        (hide-sublevels 1)
        (other-window 1)))))
