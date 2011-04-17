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
  "���ƥ���� face"
  :group 'navi2ch-face)

(defface navi2ch-list-board-name-face
  '((((class color) (background light)) (:foreground "Navy"))
    (((class color) (background dark)) (:foreground "SkyBlue")))
  "��̾�� face"
  :group 'navi2ch-face)

(defface navi2ch-list-add-board-name-face
  '((((class color) (background light)) (:foreground "FireBrick" :bold t))
    (((class color) (background dark)) (:foreground "cyan" :bold t)))
  "�ɲä��줿��̾�� face"
  :group 'navi2ch-face)

(defface navi2ch-list-change-board-name-face
  '((((class color) (background light)) (:foreground "DarkOliveGreen" :bold t))
    (((class color) (background dark)) (:foreground "GreenYellow" :bold t)))
  "�ѹ����줿��̾�� face"
  :group 'navi2ch-face)

(defface navi2ch-bm-unread-face
  '((((class color) (background light)) (:foreground "DarkOliveGreen"))
    (((class color) (background dark)) (:foreground "GreenYellow")))
  "�ɤ�Ǥʤ������ face"
  :group 'navi2ch-face)

(defface navi2ch-bm-view-face
  '((((class color) (background light)) (:foreground "FireBrick"))
    (((class color) (background dark)) (:foreground "cyan")))
  "ɽ�����Ƥ��륹��� face"
  :group 'navi2ch-face)
u
(defface navi2ch-bm-cache-face
  '((((class color) (background light)) (:foreground "Navy"))
    (((class color) (background dark)) (:foreground "SkyBlue")))
  "�ɤ���������륹��� face"
  :group 'navi2ch-face)

(defface navi2ch-bm-update-face
  '((((class color) (background light)) (:foreground "SaddleBrown"))
    (((class color) (background dark)) (:foreground "LightSkyBlue")))
  "������������� face"
  :group 'navi2ch-face)

(defface navi2ch-bm-down-face
  '((((class color) (background light)) (:foreground "Black" :bold t))
    (((class color) (background dark)) (:foreground "White" :bold t)))
  "dat������������ face"
  :group 'navi2ch-face)

(defface navi2ch-bm-mark-face
  '((((class color) (background light)) (:foreground "Tomato3"))
    (((class color) (background dark)) (:foreground "tomato")))
  "�ޡ������������ face"
  :group 'navi2ch-face)

(defface navi2ch-bm-new-unread-face
  '((((class color) (background light)) (:foreground "DarkOliveGreen" :bold t))
    (((class color) (background dark)) (:foreground "GreenYellow" :bold t)))
  "�������ɤ�Ǥʤ������ face"
  :group 'navi2ch-face)

(defface navi2ch-bm-new-view-face
  '((((class color) (background light)) (:foreground "FireBrick" :bold t))
    (((class color) (background dark)) (:foreground "PaleGreen" :bold t)))
  "������ɽ�����Ƥ��륹��� face"
  :group 'navi2ch-face)

(defface navi2ch-bm-new-cache-face
  '((((class color) (background light)) (:foreground "Navy" :bold t))
    (((class color) (background dark)) (:foreground "SkyBlue" :bold t)))
  "�������ɤ���������륹��� face"
  :group 'navi2ch-face)

(defface navi2ch-bm-new-update-face
  '((((class color) (background light)) (:foreground "SaddleBrown" :bold t))
    (((class color) (background dark)) (:foreground "LightSkyBlue" :bold t)))
  "������������������� face"
  :group 'navi2ch-face)

(defface navi2ch-bm-new-mark-face
  '((((class color) (background light)) (:foreground "Tomato3" :bold t))
    (((class color) (background dark)) (:foreground "tomato" :bold t)))
  "�������ޡ������������ face"
  :group 'navi2ch-face)

(defface navi2ch-bm-updated-unread-face
  '((((class color) (background light)) (:foreground "DarkOliveGreen" :bold t))
    (((class color) (background dark)) (:foreground "GreenYellow" :bold t)))
  "�쥹�����ä��ɤ�Ǥʤ������ face"
  :group 'navi2ch-face)

(defface navi2ch-bm-updated-view-face
  '((((class color) (background light)) (:foreground "FireBrick" :bold t))
    (((class color) (background dark)) (:foreground "PaleGreen" :bold t)))
  "�쥹�����ä�ɽ�����Ƥ��륹��� face"
  :group 'navi2ch-face)

(defface navi2ch-bm-updated-cache-face
  '((((class color) (background light)) (:foreground "Navy" :bold t))
    (((class color) (background dark)) (:foreground "SkyBlue" :bold t)))
  "�쥹�����ä��ɤ���������륹��� face"
  :group 'navi2ch-face)

(defface navi2ch-bm-updated-update-face
  '((((class color) (background light)) (:foreground "SaddleBrown" :bold t))
    (((class color) (background dark)) (:foreground "LightSkyBlue" :bold t)))
  "�쥹�����ä�������������� face"
  :group 'navi2ch-face)

(defface navi2ch-bm-updated-mark-face
  '((((class color) (background light)) (:foreground "Tomato3" :bold t))
    (((class color) (background dark)) (:foreground "tomato" :bold t)))
  "�쥹�����ä��ޡ������������ face"
  :group 'navi2ch-face)

(defface navi2ch-bm-seen-unread-face
  '((((class color) (background light)) (:foreground "DarkOliveGreen" :underline t))
    (((class color) (background dark)) (:foreground "GreenYellow" :underline t)))
  "���Ǥ˸����ɤ�Ǥʤ������ face"
  :group 'navi2ch-face)

(defface navi2ch-bm-seen-view-face
  '((((class color) (background light)) (:foreground "FireBrick" :underline t))
    (((class color) (background dark)) (:foreground "PaleGreen" :underline t)))
  "���Ǥ˸���ɽ�����Ƥ��륹��� face"
  :group 'navi2ch-face)

(defface navi2ch-bm-seen-cache-face
  '((((class color) (background light)) (:foreground "Navy" :underline t))
    (((class color) (background dark)) (:foreground "SkyBlue" :underline t)))
  "���Ǥ˸����ɤ���������륹��� face"
  :group 'navi2ch-face)

(defface navi2ch-bm-seen-update-face
  '((((class color) (background light)) (:foreground "SaddleBrown" :underline t))
    (((class color) (background dark)) (:foreground "LightSkyBlue" :underline t)))
  "���Ǥ˸���������������� face"
  :group 'navi2ch-face)

(defface navi2ch-bm-seen-mark-face
  '((((class color) (background light)) (:foreground "Tomato3" :underline t))
    (((class color) (background dark)) (:foreground "tomato" :underline t)))
  "���Ǥ˸����ޡ������������ face"
  :group 'navi2ch-face)

(defface navi2ch-article-header-face
  '((((class color) (background light)) (:foreground "Gray30" :bold t))
    (((class color) (background dark)) (:foreground "gray" :bold t)))
  "�إå��� From �Ȥ�����ʬ�� face"
  :group 'navi2ch-face)

(defface navi2ch-article-header-contents-face
  '((((class color) (background light)) (:foreground "Navy"))
    (((class color) (background dark)) (:foreground "saddle brown")))
  "�إå������Ƥ����� face"
  :group 'navi2ch-face)

(defface navi2ch-article-header-fusianasan-face
  '((((class color) (background light)) (:underline t :foreground "Navy"))
    (((class color) (background dark)) (:underline t :foreground "yellow")))
  "�դ����ʤ����ɽ������ݤ� face"
  :group 'navi2ch-face)

(defface navi2ch-article-link-face
  '((((class color) (background light)) (:bold t))
    (((class color) (background dark)) (:bold t)))
  "Ʊ��������ؤΥ�󥯤� face"
  :group 'navi2ch-face)

(defface navi2ch-article-url-face
  '((((class color) (background light)) (:bold t))
    (((class color) (background dark)) (:bold t)))
  "url �� face"
  :group 'navi2ch-face)

(defface navi2ch-article-citation-face
  '((((class color) (background light)) (:foreground "FireBrick"))
    (((class color) (background dark)) (:foreground "HotPink1")))
  "���Ѥ� face"
  :group 'navi2ch-face)

(defface navi2ch-article-face
  nil
  "����� face"
  :group 'navi2ch-face)

(defface navi2ch-article-auto-decode-face
  '((((class color) (background light)) (:background "gray90"))
    (((class color) (background dark)) (:foreground "gray10")))
  "����Υ��󥳡��ɤ��줿���������� face"
  :group 'navi2ch-face)

(defface navi2ch-article-message-separator-face
  '((((class color) (background light)) (:foreground "SpringGreen4"))
    (((class color) (background dark)) (:foreground "gray30")))
  "�쥹�ζ��ڤ� face"
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
  "Ʊ��������ؤΥ�󥯤� face"
  :group 'navi2ch-face)

(defface navi2ch-message-url-face
  '((((class color) (background light)) (:bold t))
    (((class color) (background dark)) (:bold t)))
  "url �� face"
  :group 'navi2ch-face)

(defface navi2ch-message-citation-face
  '((((class color) (background light)) (:foreground "FireBrick"))
    (((class color) (background dark)) (:foreground "HotPink1")))
  "���Ѥ� face"
  :group 'navi2ch-face)


;;; navi2ch-config.el ends here
