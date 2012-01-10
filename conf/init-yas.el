# -*- coding: utf-8 -*-
;;; init-yas.el ---

;(add-to-list 'load-path "./.emacs.d/elisp/yasnippet/yasnippet.el")
(require 'yasnippet)
(require 'yasnippet-config)
(setq yas/root-directory "~/.emacs.d/snippets")
;(yas/setup)

;; id:antipop
;; トリガはSPC, 次の候補への移動はTAB
(setq yas/trigger-key (kbd "SPC"))
(setq yas/next-field-key (kbd "TAB"))

;;; [2008-03-20]
;;; ポップアップをdropdown-listにする

;; ver 0.4.0からyasnippel.el内にdropdown-list.elが含まれるようになった
;; が、いまのところ、それだとリストの選択肢でC-mしてもinsertされない。
;; 理由はわからないが、とりあえず自前で用意したものをrequireするとうま
;; く行く。

;; (require 'dropdown-list)
;; (setq yas/text-popup-function
;;       #'yas/dropdown-list-popup-for-template)

;;; [2008-03-20]
;;; コメントやリテラルではスニペットを展開しない

;; ver 0.4.0からそれを利用して、コメント・リテラルの中では、スニペット
;; で特に指定されない限り、展開を行わない。

;; (setq yas/buffer-local-condition
;;       '(or (not (or (string= "font-lock-comment-face"
;;                              (get-char-property (point) 'face))
;;                     (string= "font-lock-string-face"
;;                              (get-char-property (point) 'face))))
;;            '(require-snippet-condition . force-in-comment)))

;;; [2008-03-15]
;;; 複数のディレクトリからスニペットを読み込む。

;; yasnippetのsnippetを置いてあるディレクトリ
;(setq yas/root-directory (expand-file-name "~/dev/yasnippet/snippets"))

;; 自分用スニペットディレクトリ(リストで複数指定可)
(defvar my-snippet-directories
  (list ;(expand-file-name "~/dev/yasnippet-snippets/common")  ; CodeRepos
        ;(expand-file-name "~/dev/yasnippet-snippets/kentaro") ; CodeRepos
        (expand-file-name "~/.emacs.d/snippets")))            ; Private

;; yasnippet公式提供のものと、自分用カスタマイズスニペットをロード同名
;; のスニペットが複数ある場合、あとから読みこんだ自分用のものが優先され
;; る。また、スニペットを変更、追加した場合、このコマンドを実行すること
;; で、変更・追加が反映される。

(defun yas/load-all-directories ()
  (interactive)
  (yas/reload-all)
  (mapc 'yas/load-directory-1 my-snippet-directories))

;;; [2008-03-17]
;;; yasnippet展開中はflymakeを無効にする

(defvar flymake-is-active-flag nil)

(defadvice yas/expand-snippet
  (before inhibit-flymake-syntax-checking-while-expanding-snippet activate)
  (setq flymake-is-active-flag
        (or flymake-is-active-flag
            (assoc-default 'flymake-mode (buffer-local-variables))))
  (when flymake-is-active-flag
    (flymake-mode-off)))

(add-hook 'yas/after-exit-snippet-hook
          '(lambda ()
             (when flymake-is-active-flag
               (flymake-mode-on)
               (setq flymake-is-active-flag nil))))

;;; [2008-03-19]
;;; yasnippetを使って、ttのディレクティヴを補完

;; スニペットに`(tt-directives)`と書いて置くと補完読み込みする。
;; http://clouder.jp/yoshiki/mt/archives/000377.html から。

;; TODO: minor-modeでフェイスを定義して、色をつけたい。
(defvar tt-directives
  '(
    ("IF")
    ("UNLESS")
    ("ELSIF")
    ("ELSE")
    ("FOREACH")
    ("WHILE")
    ("FILTER")
    ("GET")
    ("CALL")
    ("MACRO")
    ("SET")
    ("DEFAULT")
    ("INSERT")
    ("INCLUDE")
    ("BLOCK")
    ("END")
    ("PROCESS")
    ("WRAPPER")
    ("SWITCH")
    ("CASE")
    ("USE")
    ("PERL")
    ("RAWPERL")
    ("TRY")
    ("THROW")
    ("FINAL")
    ("CATCH")
    ("NEXT")
    ("LAST")
    ("RETURN")
    ("STOP")
    ("CLEAR")
    ("META")
    ("TAGS")
    ))

(defun tt-insert-directive ()
  (let ((directive (completing-read "Directive Name: " tt-directives nil t)))
    (when (and directive
             (not (string= directive "")))
        (concat "[%- " directive " %]"))))

;; yasnippet初期化
(yas/initialize)
(yas/load-all-directories)
