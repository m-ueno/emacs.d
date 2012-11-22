;; init-load.el

;; id: syohex
(require 'quickrun)
(global-set-key "\C-x\C-x" 'quickrun)

;; jaunte: http://kawaguchi.posterous.com/emacshit-a-hint
(require 'jaunte)
(global-set-key (kbd "C-c C-j") 'jaunte)

;; 13-2
(require 'summarye)

;; 12-6
(require 'usage-memo)
(setq usage-memo-base-directory "~/.emacs.d/umemo")
(umemo-initialize)

;; 6-2
(require 'redo+)
(global-set-key (kbd "C-M-/") 'redo)
(setq undo-no-redo t)          ;過去のundoがredoされないようにする
;; 大量のundoに耐える
(setq undo-limit 600000)
(setq undo-strong-limit 900000)
;; 5-8
(require 'goto-chg)
(global-set-key [f8] 'goto-last-change)
(global-set-key [S-f8] 'goto-last-change-reverse)
;; ;; 5.7 M-SPCでいくつでもブックマーク
;; (setq-default bm-buffer-persistence nil) ;誤植?
;; (setq bm-restore-repository-on-load t)
;; (require 'bm)
;; (add-hook' after-init-hook 'bm-repository-load)
;; (add-hook 'find-file-hooks 'bm-buffer-restore)
;; (add-hook 'kill-buffer-hook 'bm-buffer-save)
;; (add-hook 'kill-emacs-hook '(lambda nil (bm-buffer-save-all)
;;                    (bm-repository-save)))
;; (add-hook 'after-save-hook 'bm-buffer-save)
;; (add-hook 'after-revert-hook 'bm-buffer-restore)
;; (add-hook 'vc-before-checkin-hook 'bm-buffer-save)
;; (global-set-key (kbd "M-SPC" 'bm-toggle))
;; (global-set-key (kbd "M-[" 'bm-previous))
;; (global-set-key (kbd "M-]" 'bm-next))

;; 5-6
(require 'point-undo)
(define-key global-map [f7] 'point-undo)
(define-key global-map [S-f7] 'point-redo)

;; 4-8 ファイルを自動保存する
(require 'auto-save-buffers)
(run-with-idle-timer 0.5 t 'auto-save-buffers)
;(auto-save-buffers-toggle)

;; 4-2 ファイル名がかぶった場合にバッファ名をわかりやすくする
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")
;; 3-10
;; `raise-minor-mode-map-alist' / `lower-minor-mode-map-alist' - resolve `minor-mode-map-alist' conflict
(require 'minor-mode-hack)
;; show-minor-mode-map-priority

;; 1-9 自動バイトコンパイル
;; (require 'auto-async-byte-compile)
;; (setq auto-async-byte-compile-exclude-files-regexp "/junk/")
;; (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
;; (setq auto-async-byte-compile-display-function 'display-mode)

;; (require 'sticky)
;; (use-sticky-key ";" sticky-alist:ja)

;; ----------------------------------------------------------------
;(require 'irc)
;(require 'smart-compile+)

;; C-x u
(require 'undo-tree)
(global-undo-tree-mode)

;; xmpfilter っぽい (by rubikitch)
(require 'lispxmp)

;; mcomplete: M-x の補完を iswitchb のようにしたい
;; http://www.bookshelf.jp/soft/meadow_27.html
;; (require 'mcomplete)
;; (load "mcomplete-history")
;; (turn-on-mcomplete-mode)

(require 'dropdown-list)
(setq yas/prompt-functions '(yas/dropdown-prompt
                             yas/ido-prompt
                             yas/completing-prompt))

;; ;; C-x ) でマクロ
;; (add-hook 'tinymacro-:load-hook 'tinymacro-install-default-keybindings)
;; (require 'tinymacro)

;; M-! で補完
;; 非動作
(require 'shell-command)
(shell-command-completion-mode)

;; moccurの改良：color-moccur
(require 'color-moccur)

;; 動的補完 dabbrev
(load "dabbrev-ja")
(require 'dabbrev-highlight)

;; auto-install (install-elispの上位互換)
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/elisp/")
;(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; ;; ウインドウ構成のヒストリ
;; (require 'winhist)
;; (winhist-mode 1)
;; (global-set-key "\M-B" 'winhist-backward)
;; (global-set-key "\M-F" 'winhist-forward)

;; one-key
(require 'one-key)
(require 'one-key-config)
(require 'one-key-default)
(one-key-default-setup-keys)

;auto-installで必要?
(require 'url-util)

;; navi2ch
(autoload 'navi2ch "navi2ch" "Navi2ch" t)

;; session
(require 'session)
;; 閉じた時の場所を保存する
(setq session-undo-check -1)
(add-hook 'after-init-hook 'session-initialize)
