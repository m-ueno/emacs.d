;; longconfig.el
;; $Last update: 2011/09/05 23:38:47 $

;; 繰り返し処理の自動繰り返し ― dmacro
;(defconst *dmacro-key* "\C-\S-t" "繰返し指定キー")
;(global-set-key *dmacro-key* 'dmacro-exec)
;(autoload 'dmacro-exec "dmacro" nil t)

;; 2011-09-05
;; git checkout/merge/pull用
;; auto-revert-mode, global-auto-revert-modeでもいいが、
;; こっちはundoが効くので安心
(defun reopen-file ()
  (interactive)
  (let ((file-name (buffer-file-name))
        (old-supersession-threat
         (symbol-function 'ask-user-about-supersession-threat))
        (point (point)))
    (when file-name
      (fset 'ask-user-about-supersession-threat (lambda (fn)))
      (unwind-protect
          (progn
            (erase-buffer)
            (insert-file file-name)
            (set-visited-file-modtime)
            (goto-char point))
        (fset 'ask-user-about-supersession-threat
              old-supersession-threat)))))
(global-set-key (kbd "C-x C-r") 'reopen-file)


;; auto-insert
;; テンプレートの保存先
(setq auto-insert-directory "~/.emacs.d/template/")
(auto-insert-mode 1)
;; テンプレート挿入時に尋ねない。デフォルトは 'function
(setq auto-insert-query nil)
;; 指定したファイルを挿入する
(setq auto-insert-alist
      (append
       '(
         ;; モード名で指定
;         (yahtml-mode . "test.html")
         ;; ファイル名で指定
         ("\\.c$" . "template.c")
         ("\\.pl$" . "template.pl")
         ("\\.pm$" . "template.pl")
         ("\\.tex$" . "template.tex")
         )
       auto-insert-alist))

;; autosave file の生成場所
;; http://www.fan.gr.jp/~ring/Meadow/meadow.html
(setq auto-save-list-file-prefix (expand-file-name "~/.emacs.d/autosave"))

(setq *backup-directory* "~/.emacs.d/autosave")
(cond ((not (fboundp 'make-backup-file-name-original))
       (fset 'make-backup-file-name-original
             (symbol-function 'make-backup-file-name))
       (defun make-backup-file-name (filename)
         (let ((backup-directory-path (concat *backup-directory* "/")))
           (if (and (file-exists-p (expand-file-name *backup-directory*))
                    (file-directory-p
                     (expand-file-name backup-directory-path)))
               (expand-file-name
                (make-backup-file-name-original
                 (file-name-nondirectory filename)) backup-directory-path)
             (make-backup-file-name-original filename))))))

;; iswitchb 基本
(iswitchb-mode t)
(add-hook 'iswitchb-define-mode-map-hook
          'iswitchb-my-keys)
(defun iswitchb-my-keys ()
  "Add my keybindings for iswitchb."
  (define-key iswitchb-mode-map [right] 'iswitchb-next-match)
  (define-key iswitchb-mode-map [left] 'iswitchb-prev-match)
  (define-key iswitchb-mode-map "\C-f" 'iswitchb-next-match)
  (define-key iswitchb-mode-map " " 'iswitchb-next-match)
  (define-key iswitchb-mode-map "\C-b" 'iswitchb-prev-match)
  )
;; iswitchb-ext
(defadvice iswitchb-exhibit
  (after
   iswitchb-exhibit-with-display-buffer
   activate)
  "選択している buffer を window に表示してみる。"
  (when (and
         (eq iswitchb-method iswitchb-default-method)
         iswitchb-matches)
    (select-window
     (get-buffer-window (cadr (buffer-list))))
    (let ((iswitchb-method 'samewindow))
      (iswitchb-visit-buffer
       (get-buffer (car iswitchb-matches))))
    (select-window (minibuffer-window))))

;; yank 時に次の yank 候補を minibuffer に表示
(defun my-yank-display ()
  (unless (or (eq kill-ring-yank-pointer nil) ;; kill-ringが空だったり
              (= (aref (buffer-name) 0) ? )) ;; minibuf で yank しようとしていなければ
    (if (eq (cdr kill-ring-yank-pointer) nil)
        (message "end of kill-ring")
      (message (car (cdr kill-ring-yank-pointer))))))

(defun my-yank (arg)
  "Yank with displaying next"
  (interactive "*P")
  (yank arg)
  (my-yank-display)
  (setq this-command 'yank))

(defun my-yank-pop (arg)
  "Yank-pop with displaying next"
  (interactive "*p")
  (yank-pop arg)
  (my-yank-display)
  (setq this-command 'yank))

(global-set-key "\C-y" 'my-yank)
(global-set-key "\M-y" 'my-yank-pop)

