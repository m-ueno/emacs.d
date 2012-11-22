;;; conf-tips.el --- default function (short configure)

;; id:tomoya 20091015
(setq comment-style 'multi-line)

;; id:rubikitch
;; http://d.hatena.ne.jp/rubikitch/20100210/emacs
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))

(global-set-key (kbd "C-t") 'other-window-or-split)

;; リージョン選択の解除（デフォルトでM-ESC ESC | ESC ESC ESC）
;; http://dev.ariel-networks.com/articles/emacs/part4/
(global-set-key (kbd "C-M-g") 'keyboard-escape-quit)

;; http://d.hatena.ne.jp/khiker/20100114
;; 左フリンジの上下にマークをつける
(setq-default indicate-buffer-boundaries 'left)
;; 右フリンジの上下にマークをつける
(setq-default indicate-buffer-boundaries 'right)

;; 左フリンジの上と右フリンジの下にマークをつける
(setq-default indicate-buffer-boundaries '((top . left) (t . right)))
;; 右フリンジの上と左フリンジの下にマークをつける
(setq-default indicate-buffer-boundaries '((top . right) (t . left)))
;; 右フリンジの上にのみマークをつける
(setq-default indicate-buffer-boundaries '((top . right) (t . nil)))


;; C-UP/C-DOWN でペインをリサイズ
;; http://d.hatena.ne.jp/khiker/20100118
(global-set-key [(ctrl up)] '(lambda (arg) (interactive "p")
                               (shrink-window arg)))
(global-set-key [(ctrl down)] '(lambda (arg) (interactive "p")
                                 (shrink-window (- arg))))

;; mode line
(display-time)
(global-hl-line-mode t)
(set-face-background 'hl-line "dark slate gray")
(display-battery-mode t)

;(ffap-bindings)

;; 最近使ったファイル
(recentf-mode)
(setq recentf-max-menu-items 10)
(setq recentf-max-saved-items 100)
;; Trampのリモートファイルを除く
;; http://homepage.mac.com/zenitani/elisp-j.html
(setq recentf-exclude '("^/[^/:]+:"))

;; Emacs23には最初から入っている
(global-linum-mode t)

;; show-paren-mode
(show-paren-mode t)

;; diredで
(setq ls-lisp-dirs-first t)

;; 前回編集していた場所を記憶させるには ― saveplace
(load "saveplace")
(setq-default save-place t)

;; コンパイルウインドウの高さを制限
(setq compilation-window-height 15)

;; ファイルを開くとき
;; http://www.bookshelf.jp/soft/meadow_23.html
(if (<= emacs-major-version 23)
    (partial-completion-mode t))

; S-Arrowでウインドウ移動
(setq windmove-wrap-around t)
(windmove-default-keybindings)

;; http://infolab.stanford.edu/~manku/dotemacs.html
(setq require-final-newline t)
(setq next-line-add-newlines nil)

;; window 分割時、画面外に出る文章を折り返したい
(setq truncate-partial-width-windows nil)

;; kill-ringに重複を許さない
(defadvice kill-new (before ys:no-kill-new-duplicates activate)
  (setq kill-ring (delete (ad-get-arg 0) kill-ring)))

;;Emacs の動作を軽快にしたい
(setq gc-cons-threshold 5242880)

;; 1 行ずつスクロールさせる
;; http://www.bookshelf.jp/soft/meadow_31.html#SEC428
(setq scroll-conservatively 35
       scroll-margin 0
       scroll-step 1)
(setq comint-scroll-show-maximum-output t)

;; kill-lineで行末の改行文字も削除
(setq kill-whole-line t)

;; 開始時にホームディレクトリに移動
(cd (expand-file-name "~"))

;; 起動時の画面はいらない
(setq inhibit-startup-message t
      startup-echo-area-message ""
      initial-scratch-message "")

;; y-or-n-p
(fset 'yes-or-no-p 'y-or-n-p)

;; メニューバー、ツールバー非表示
(menu-bar-mode -1)
(tool-bar-mode -1)

;; ヴィジブルベルを抑制
(setq visible-bell nil)

;; ビープ音を抑制
(setq ring-bell-function '(lambda ()))

;; カーソルの点滅を抑制
(blink-cursor-mode nil)

;; 行数、列数を表示
(line-number-mode t)
(column-number-mode t)

;; 自動セーブの設定
;(setq auto-save-default nil)

;; バックアップの設定
(setq make-backup-files nil)

;; 自動保存したファイルを削除するか
(setq delete-auto-save-files t)

;; ----------------------------------------------------------------
;; key binding
;; ----------------------------------------------------------------

;; http://www.bookshelf.jp/soft/meadow_12.html
;; 基本は (define-key map-name kbd function)
;; global-set-key はこれの global-map 版のマクロ
;; map-name には c-mode-map, lisp-mode-map などが入る
;; 普通はhook時にやるので、
;; (add-hook 'c-mode-hook
;;           '(lambda ()
;;              (define-key c-mode-map "\C-c>" 'indent-region)))
;; とするか、あるいは c-mode-map を書かずに
;; (add-hook 'c-mode-hook
;;           '(lambda ()
;; 	     (local-set-key "\C-c>" 'indent-region)))
;; とする
;; #'global-unset-key もある

;; defkey / gdefkey マクロを追加した(Emacs Lisp TB)

(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\C-z" 'scroll-down)

;; clipboard
(global-set-key (kbd "S-<insert>") 'clipboard-yank)

(global-set-key (kbd "C-c r") 'query-replace)
