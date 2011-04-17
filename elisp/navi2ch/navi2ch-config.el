;;; -*- Emacs-Lisp -*-
;;; navi2ch-config.el.  Generated from navi2ch-config.el.in by configure.
;;; navi2ch-config.el --- configure variables

;;; Commentary:

;;

;;; Code:
(provide 'navi2ch-config)
(defconst navi2ch-config-ident
  "$Id: navi2ch-config.el.in,v 1.4 2008/01/11 15:52:08 nawota Exp $")

(defconst navi2ch-config-icondir
  "/usr/share/emacs/23.2/etc/navi2ch/icons")

(defface navi2ch-list-category-face
  '((((class color) (background light)) (:foreground "Gray30" :bold t))
    (((class color) (background dark)) (:foreground "SkyBlue" :bold t)))
  "カテゴリの face"
  :group 'navi2ch-face)

(defface navi2ch-list-board-name-face
  '((((class color) (background light)) (:foreground "Navy"))
    (((class color) (background dark)) (:foreground "SkyBlue")))
  "板名の face"
  :group 'navi2ch-face)

(defface navi2ch-list-add-board-name-face
  '((((class color) (background light)) (:foreground "FireBrick" :bold t))
    (((class color) (background dark)) (:foreground "cyan" :bold t)))
  "追加された板名の face"
  :group 'navi2ch-face)

(defface navi2ch-list-change-board-name-face
  '((((class color) (background light)) (:foreground "DarkOliveGreen" :bold t))
    (((class color) (background dark)) (:foreground "GreenYellow" :bold t)))
  "変更された板名の face"
  :group 'navi2ch-face)

(defface navi2ch-bm-unread-face
  '((((class color) (background light)) (:foreground "DarkOliveGreen"))
    (((class color) (background dark)) (:foreground "GreenYellow")))
  "読んでないスレの face"
  :group 'navi2ch-face)

(defface navi2ch-bm-view-face
  '((((class color) (background light)) (:foreground "FireBrick"))
    (((class color) (background dark)) (:foreground "cyan")))
  "表示しているスレの face"
  :group 'navi2ch-face)
u
(defface navi2ch-bm-cache-face
  '((((class color) (background light)) (:foreground "Navy"))
    (((class color) (background dark)) (:foreground "SkyBlue")))
  "読んだ事があるスレの face"
  :group 'navi2ch-face)

(defface navi2ch-bm-update-face
  '((((class color) (background light)) (:foreground "SaddleBrown"))
    (((class color) (background dark)) (:foreground "LightSkyBlue")))
  "更新したスレの face"
  :group 'navi2ch-face)

(defface navi2ch-bm-down-face
  '((((class color) (background light)) (:foreground "Black" :bold t))
    (((class color) (background dark)) (:foreground "White" :bold t)))
  "dat落ちしたスレの face"
  :group 'navi2ch-face)

(defface navi2ch-bm-mark-face
  '((((class color) (background light)) (:foreground "Tomato3"))
    (((class color) (background dark)) (:foreground "tomato")))
  "マークしたスレの face"
  :group 'navi2ch-face)

(defface navi2ch-bm-new-unread-face
  '((((class color) (background light)) (:foreground "DarkOliveGreen" :bold t))
    (((class color) (background dark)) (:foreground "GreenYellow" :bold t)))
  "新しい読んでないスレの face"
  :group 'navi2ch-face)

(defface navi2ch-bm-new-view-face
  '((((class color) (background light)) (:foreground "FireBrick" :bold t))
    (((class color) (background dark)) (:foreground "PaleGreen" :bold t)))
  "新しい表示しているスレの face"
  :group 'navi2ch-face)

(defface navi2ch-bm-new-cache-face
  '((((class color) (background light)) (:foreground "Navy" :bold t))
    (((class color) (background dark)) (:foreground "SkyBlue" :bold t)))
  "新しい読んだ事があるスレの face"
  :group 'navi2ch-face)

(defface navi2ch-bm-new-update-face
  '((((class color) (background light)) (:foreground "SaddleBrown" :bold t))
    (((class color) (background dark)) (:foreground "LightSkyBlue" :bold t)))
  "新しい更新したスレの face"
  :group 'navi2ch-face)

(defface navi2ch-bm-new-mark-face
  '((((class color) (background light)) (:foreground "Tomato3" :bold t))
    (((class color) (background dark)) (:foreground "tomato" :bold t)))
  "新しいマークしたスレの face"
  :group 'navi2ch-face)

(defface navi2ch-bm-updated-unread-face
  '((((class color) (background light)) (:foreground "DarkOliveGreen" :bold t))
    (((class color) (background dark)) (:foreground "GreenYellow" :bold t)))
  "レスがあった読んでないスレの face"
  :group 'navi2ch-face)

(defface navi2ch-bm-updated-view-face
  '((((class color) (background light)) (:foreground "FireBrick" :bold t))
    (((class color) (background dark)) (:foreground "PaleGreen" :bold t)))
  "レスがあった表示しているスレの face"
  :group 'navi2ch-face)

(defface navi2ch-bm-updated-cache-face
  '((((class color) (background light)) (:foreground "Navy" :bold t))
    (((class color) (background dark)) (:foreground "SkyBlue" :bold t)))
  "レスがあった読んだ事があるスレの face"
  :group 'navi2ch-face)

(defface navi2ch-bm-updated-update-face
  '((((class color) (background light)) (:foreground "SaddleBrown" :bold t))
    (((class color) (background dark)) (:foreground "LightSkyBlue" :bold t)))
  "レスがあった更新したスレの face"
  :group 'navi2ch-face)

(defface navi2ch-bm-updated-mark-face
  '((((class color) (background light)) (:foreground "Tomato3" :bold t))
    (((class color) (background dark)) (:foreground "tomato" :bold t)))
  "レスがあったマークしたスレの face"
  :group 'navi2ch-face)

(defface navi2ch-bm-seen-unread-face
  '((((class color) (background light)) (:foreground "DarkOliveGreen" :underline t))
    (((class color) (background dark)) (:foreground "GreenYellow" :underline t)))
  "すでに見た読んでないスレの face"
  :group 'navi2ch-face)

(defface navi2ch-bm-seen-view-face
  '((((class color) (background light)) (:foreground "FireBrick" :underline t))
    (((class color) (background dark)) (:foreground "PaleGreen" :underline t)))
  "すでに見た表示しているスレの face"
  :group 'navi2ch-face)

(defface navi2ch-bm-seen-cache-face
  '((((class color) (background light)) (:foreground "Navy" :underline t))
    (((class color) (background dark)) (:foreground "SkyBlue" :underline t)))
  "すでに見た読んだ事があるスレの face"
  :group 'navi2ch-face)

(defface navi2ch-bm-seen-update-face
  '((((class color) (background light)) (:foreground "SaddleBrown" :underline t))
    (((class color) (background dark)) (:foreground "LightSkyBlue" :underline t)))
  "すでに見た更新したスレの face"
  :group 'navi2ch-face)

(defface navi2ch-bm-seen-mark-face
  '((((class color) (background light)) (:foreground "Tomato3" :underline t))
    (((class color) (background dark)) (:foreground "tomato" :underline t)))
  "すでに見たマークしたスレの face"
  :group 'navi2ch-face)

(defface navi2ch-article-header-face
  '((((class color) (background light)) (:foreground "Gray30" :bold t))
    (((class color) (background dark)) (:foreground "gray" :bold t)))
  "ヘッダの From とかの部分の face"
  :group 'navi2ch-face)

(defface navi2ch-article-header-contents-face
  '((((class color) (background light)) (:foreground "Navy"))
    (((class color) (background dark)) (:foreground "saddle brown")))
  "ヘッダの内容の方の face"
  :group 'navi2ch-face)

(defface navi2ch-article-header-fusianasan-face
  '((((class color) (background light)) (:underline t :foreground "Navy"))
    (((class color) (background dark)) (:underline t :foreground "yellow")))
  "ふしあなさんを表示する際の face"
  :group 'navi2ch-face)

(defface navi2ch-article-link-face
  '((((class color) (background light)) (:bold t))
    (((class color) (background dark)) (:bold t)))
  "同じスレ中へのリンクの face"
  :group 'navi2ch-face)

(defface navi2ch-article-url-face
  '((((class color) (background light)) (:bold t))
    (((class color) (background dark)) (:bold t)))
  "url の face"
  :group 'navi2ch-face)

(defface navi2ch-article-citation-face
  '((((class color) (background light)) (:foreground "FireBrick"))
    (((class color) (background dark)) (:foreground "HotPink1")))
  "引用の face"
  :group 'navi2ch-face)

(defface navi2ch-article-face
  nil
  "スレの face"
  :group 'navi2ch-face)

(defface navi2ch-article-auto-decode-face
  '((((class color) (background light)) (:background "gray90"))
    (((class color) (background dark)) (:foreground "gray10")))
  "スレのエンコードされたセクションの face"
  :group 'navi2ch-face)

(defface navi2ch-article-message-separator-face
  '((((class color) (background light)) (:foreground "SpringGreen4"))
    (((class color) (background dark)) (:foreground "gray30")))
  "レスの区切の face"
  :group 'navi2ch-face)

(defface navi2ch-splash-screen-face
  '((((type tty) (background dark)) (:foreground "cyan"))
    (((class color) (background dark)) (:foreground "SkyBlue"))
    (((class color) (background light)) (:foreground "SteelBlue")))
  "Face used for displaying splash screen."
  :group 'navi2ch-face)

(defface navi2ch-message-link-face
  '((((class color) (background light)) (:bold t))
    (((class color) (background dark)) (:bold t)))
  "同じスレ中へのリンクの face"
  :group 'navi2ch-face)

(defface navi2ch-message-url-face
  '((((class color) (background light)) (:bold t))
    (((class color) (background dark)) (:bold t)))
  "url の face"
  :group 'navi2ch-face)

(defface navi2ch-message-citation-face
  '((((class color) (background light)) (:foreground "FireBrick"))
    (((class color) (background dark)) (:foreground "HotPink1")))
  "引用の face"
  :group 'navi2ch-face)


;;; navi2ch-config.el ends here
