;; utility-functions.el
;; ���߂̊֐��Q

;; defkey -- merge 'kbd' macro
;; Emacs LISP TB
;; �o����: ������ "" �� 'command
(defmacro defkey (keymap key command)
  `(define-key ,keymap ,(read-kbd-macro key) ,command))
(defmacro gdefkey (key command)
  `(define-key global-map ,(read-kbd-macro key) ,command))


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
  (let ((doya-faces '("                      �Q�Q�Q  �܂��m���ɁE�E�E
                    �^��  '' �܁_
                  �^�i �� ) (�� )�_             Emacs�𗧂��グ���̂͂��O
                �^::��  ,    �T��::�_    (��)
                |       `�=-'     |    �~.�-r���
                �_               �^   �m  |.| |
.         ,  �� �L  �_     �P   �L !�q�P�M- L��_��
        /    __       �R        |  �P�M�[�]-�]�]�L
.      �V ,. --�~        �R     i   |/�n �^
      ji�^    �P�M          �R  |"

                      "                      �Q�Q�Q
                    �^�m '' �܁_
                  �^�i �� ) (�� )�_�ł��A���̉�ʂ܂ŗ��ꂽ�͉̂��̂�����
                �^::��   ,   �T��::�_
                |       �==�'     |
    _,r����L�_  �_,--�    `�['    �^
. ,-�� �R.�_ �R Y�L  �^   �[    �L !�M�-�
  {  -!  l _�_Ɂ]��/ �R            |    ��
. �R  ް'�L �R    /     �R        i  |/�n
  �M�T�A    �  �m         �R     |"


                      "                      �Q�Q�Q
                    �^�R ''�m�_
                  �^�i �� ) (�� )�_
                �^::��    ��Q�T��::�_   (��)          ������H
                |         -       |   � ~.�-r���
                �_               �^  �m_  |.| |
.         ,  �� �L  �_     �P   �L !�q�P  �M-L��_��
        /    __       �R        |  �P�M�[�]-�]�]�L
.      �V ,. --�~        �R     i    |/�n  �^
      ji�^    �P�M          �R  |"))
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

;; C-x k ��u�������� C-x / �ł��ǂ�
;; http://d.hatena.ne.jp/kitokitoki/20100608/p2
;; recentf �ɓo�^����Ȃ��̂ł�߂�
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
;; cf. #'byte-recompile-directory
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

;; �J�[�\�����������ɃX�N���[��
;; http://norainu.net/mt/archives/2006/11/emacs_elisp.html
                                        ;(unless (fboundp 'scroll-up-line)
(defun scroll-up-line (n)
  (interactive "p")
  (previous-line n)
  (scroll-down n))
(defun scroll-down-line (n)
  (interactive "p")
  (next-line n)
  (scroll-up n))
(global-set-key "\M-p" 'scroll-up-line)
(global-set-key "\M-n" 'scroll-down-line)

;; for cl-memo
(fset 'memo
   [?\M-< S-f5 ?\C-j ?\C-q ?\C-i?* ?  ?\C-o ?\C-o])

(defvar my-save-buffer-hook nil)
;(defvar my-save-buffer-hook #'delete-trailing-whitespace)
(defun save-buffer-wrapper ()
  (interactive)
  (let ((tostr (concat "$Last update: " (format-time-string "%Y/%m/%d %k:%M:%S") " $")))
    (save-excursion
        (goto-char (point-min))
        (while (re-search-forward
                "\\$Last update\\([0-9/: ]*\\)?\\$" nil t)
          (replace-match tostr nil t)))
    (delete-trailing-whitespace)
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
;;(global-set-key [f5] 'my-get-date)
(gdefkey "S-<f5>" 'my-get-dtime)

;; *scratch*�������Ȃ�
(defun my-make-scratch (&optional arg)
  (interactive)
  (progn
    ;; "*scratch*" ���쐬���� buffer-list �ɕ��荞��
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
          ;; *scratch* �o�b�t�@�� kill-buffer ��������e���������邾���ɂ���
          (lambda ()
            (if (string= "*scratch*" (buffer-name))
                (progn (my-make-scratch 0) nil)
              t)))

(add-hook 'after-save-hook
          ;; *scratch* �o�b�t�@�̓��e��ۑ������� *scratch* �o�b�t�@��V�������
          (lambda ()
            (unless (member (get-buffer "*scratch*") (buffer-list))
              (my-make-scratch 1))))


;; ����������ʂ����ւ��� [f2]
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
