;; utility-functions.el
;; í∑ÇﬂÇÃä÷êîåQ

;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
    (filename (buffer-file-name)))
    (if (not filename)
    (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
      (message "A buffer named '%s' already exists!" new-name)
    (progn
      (rename-file name new-name 1)
      (rename-buffer new-name)
      (set-visited-file-name new-name)
      (set-buffer-modified-p nil))))))

(defun doya-show ()
  (interactive)
  (let ((doya-faces '("                      ÅQÅQÅQ  Ç‹ÇüämÇ©Ç…ÅEÅEÅE
                    Å^Å‹  '' Å‹Å_
                  Å^Åi Åú ) (Åú )Å_             EmacsÇóßÇøè„Ç∞ÇΩÇÃÇÕÇ®ëO
                Å^::Å‹  ,    ÅTÅ‹::Å_    (Å‹)
                |       `∞=-'     |    …~.⁄-rÑ¢§
                Å_               Å^   Ém  |.| |
.         ,  Å‹ ÅL  Å_     ÅP   ÅL !ÅqÅPÅM- LÉ…_⁄⁄
        /    __       ÅR        |  ÅPÅMÅ[Å]-Å]Å]ÅL
.      ÅV ,. --É~        ÅR     i   |/Én Å^
      jiÅ^    ÅPÅM          ÅR  |"

                      "                      ÅQÅQÅQ
                    Å^Ém '' Å‹Å_
                  Å^Åi Åú ) (Åú )Å_Ç≈Ç‡ÅAÇ±ÇÃâÊñ Ç‹Ç≈óàÇÍÇΩÇÃÇÕâ¥ÇÃÇ®Ç©Ç∞
                Å^::Å‹   ,   ÅTÅ‹::Å_
                |       ƒ==®'     |
    _,r∞Ç≠ÅLÅ_  Å_,--§    `Å['    Å^
. ,-Ç≠ ÅR.Å_ ÅR YÅL  Å^   Å[    ÅL !ÅM∞-§
  {  -!  l _£_…Å]Åå/ ÅR            |    Å»
. ÅR  ﬁ∞'ÅL ÅR    /     ÅR        i  |/Én
  ÅMÅTÅA    …  Ém         ÅR     |"


                      "                      ÅQÅQÅQ
                    Å^ÅR ''ÉmÅ_
                  Å^Åi Åú ) (Åú )Å_
                Å^::Å‹    §ÅQÅTÅ‹::Å_   (Å‹)          ÇæÇÎÇ¡ÅH
                |         -       |   … ~.⁄-rÑ¢§
                Å_               Å^  Ém_  |.| |
.         ,  Å‹ ÅL  Å_     ÅP   ÅL !ÅqÅP  ÅM-LÉ…_⁄⁄
        /    __       ÅR        |  ÅPÅMÅ[Å]-Å]Å]ÅL
.      ÅV ,. --É~        ÅR     i    |/Én  Å^
      jiÅ^    ÅPÅM          ÅR  |"))
        ol)
    (dolist (i doya-faces)
      (setq ol (make-overlay (window-start) (point-max)))
      ;; (setq i (propertize i 'face 'highlight))
      (unwind-protect
          (progn (overlay-put ol 'after-string i)
                 (overlay-put ol 'invisible t)
                 (redisplay)
                 (sleep-for 4)
                 (discard-input))
        (delete-overlay ol)))))

;; C-x k ÇíuÇ´ä∑Ç¶ÇÈ C-x / Ç≈Ç‡Ç«Ç∑
;; http://d.hatena.ne.jp/kitokitoki/20100608/p2
;; recentf Ç…ìoò^Ç≥ÇÍÇ»Ç¢ÇÃÇ≈Ç‚ÇﬂÇΩ
(defvar my-killed-file-name-list nil)
(defun my-push-killed-file-name-list ()
  (when (buffer-file-name)
    (push (expand-file-name (buffer-file-name)) my-killed-file-name-list)))
(defun my-pop-killed-file-name-list ()
  (interactive)
  (unless (null my-killed-file-name-list)
    (find-file (pop my-killed-file-name-list))))
(add-hook 'kill-buffer-hook 'my-push-killed-file-name-list)
(global-set-key "\C-xk" (lambda() (interactive)(kill-buffer (buffer-name))))
(global-set-key "\C-x\/" 'my-pop-killed-file-name-list)


;; recursive byte-compile
;; http://labs.unoh.net/2008/07/emacstips_1.html
(defun my-byte-compile-directory ()
  (interactive)
  (defun byte-compile-directories (dir)
    (if (file-directory-p dir)
        (byte-compile-directory-r (mapcar (function (lambda (f) (concat dir "/" f)))
                                          (directory-files dir)))))
  (defun byte-compile-directory-r (file-list)
    (cond ((null (car file-list))
           nil)
          ((and (file-directory-p (car file-list))
                (not (string-match "/\.\.?$" (car file-list))))
           (byte-compile-directories (car file-list))
           (if (not (null (cdr file-list)))
               (progn
                 (byte-compile-directories (cadr file-list))
                 (byte-compile-directory-r (cdr file-list)))))
          ((string-match "\.el$" (car file-list))
           (progn
             (byte-compile-file (car file-list))
             (byte-compile-directory-r (cdr file-list))))
          (t
           (if (not (null (cdr file-list)))
               (byte-compile-directory-r (cdr file-list))))))
  (byte-compile-directories (replace-regexp-in-string "/$" "" default-directory)))

;; ÉJÅ[É\ÉãìÆÇ©Ç≥Ç∏Ç…ÉXÉNÉçÅ[Éã
;; http://norainu.net/mt/archives/2006/11/emacs_elisp.html
(defun scroll-up-in-place (n)
  (interactive "p")
  (previous-line n)
  (scroll-down n))
(defun scroll-down-in-place (n)
  (interactive "p")
  (next-line n)
  (scroll-up n))
(global-set-key "\M-p" 'scroll-up-in-place)
(global-set-key "\M-n" 'scroll-down-in-place)

;; for cl-memo
(fset 'memo
   [?\M-< S-f5 ?\C-j ?\C-q ?\C-i?* ?  ?\C-o ?\C-o])
(defvar my-save-buffer-hook nil)
(defun save-buffer-wrapper ()
  (interactive)
  (let ((tostr (concat "$Last update: " (format-time-string "%Y/%m/%d %k:%M:%S") " $")))
    (save-excursion
        (goto-char (point-min))
        (while (re-search-forward
                "\\$Last update\\([0-9/: ]*\\)?\\$" nil t)
          (replace-match tostr nil t)))
    (run-hooks 'my-save-buffer-hook)
    (save-buffer)))

(global-set-key "\C-x\C-s" 'save-buffer-wrapper)

;; my-explorer-open [C-x C-@]
;; http://www.jaist.ac.jp/~n-yoshi/tips/junk_elisp.html#explorer
(defun my-explorer-open ()
  (interactive)
  (shell-command "explorer /e,."))
(global-set-key "\C-x\C-@" 'my-explorer-open)

;; insert date/time [F5 / S-F5]
(defun my-get-date-gen (form) (insert (format-time-string form)))
(defun my-get-date () (interactive) (my-get-date-gen "%Y-%m-%d"))
(defun my-get-time () (interactive) (my-get-date-gen "%H:%M"))
(defun my-get-dtime () (interactive) (my-get-date-gen "%Y-%m-%d %H:%M"))
;(global-set-key [f5] 'my-get-date) ;; anything Ç∆ã£çá
(global-set-key [S-f5] 'my-get-dtime)

;; *scratch*Çè¡Ç≥Ç»Ç¢
(defun my-make-scratch (&optional arg)
  (interactive)
  (progn
    ;; "*scratch*" ÇçÏê¨ÇµÇƒ buffer-list Ç…ï˙ÇËçûÇﬁ
    (set-buffer (get-buffer-create "*scratch*"))
    (funcall initial-major-mode)
    (erase-buffer)
    (when (and initial-scratch-message (not inhibit-startup-message))
      (insert initial-scratch-message))
    (or arg (progn (setq arg 0)
                   (switch-to-buffer "*scratch*")))
    (cond ((= arg 0) (message "*scratch* is cleared up."))
          ((= arg 1) (message "another *scratch* is created")))))

(add-hook 'kill-buffer-query-functions
          ;; *scratch* ÉoÉbÉtÉ@Ç≈ kill-buffer ÇµÇΩÇÁì‡óeÇè¡ãéÇ∑ÇÈÇæÇØÇ…Ç∑ÇÈ
          (lambda ()
            (if (string= "*scratch*" (buffer-name))
                (progn (my-make-scratch 0) nil)
              t)))

(add-hook 'after-save-hook
          ;; *scratch* ÉoÉbÉtÉ@ÇÃì‡óeÇï€ë∂ÇµÇΩÇÁ *scratch* ÉoÉbÉtÉ@ÇêVÇµÇ≠çÏÇÈ
          (lambda ()
            (unless (member (get-buffer "*scratch*") (buffer-list))
              (my-make-scratch 1))))


;; ï™äÑÇµÇΩâÊñ Çì¸ÇÍë÷Ç¶ÇÈ [f2]
(defun swap-screen()
  "Swap two screen,leaving cursor at current window."
  (interactive)
  (let ((thiswin (selected-window))
        (nextbuf (window-buffer (next-window))))
    (set-window-buffer (next-window) (window-buffer))
    (set-window-buffer thiswin nextbuf)))
(defun swap-screen-with-cursor()
  "Swap two screen,with cursor in same buffer."
  (interactive)
  (let ((thiswin (selected-window))
        (thisbuf (window-buffer)))
    (other-window 1)
    (set-window-buffer thiswin (window-buffer))
    (set-window-buffer (selected-window) thisbuf)))
(global-set-key [f2] 'swap-screen)
(global-set-key [S-f2] 'swap-screen-with-cursor)

