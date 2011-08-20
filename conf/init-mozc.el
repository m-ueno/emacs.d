(require 'mozc)  ; or (load-file "/path/to/mozc.el")
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")

(global-set-key [henkan]
		(lambda()
		  (interactive)
		  (set-input-method "japanese-mozc")))

(global-set-key [muhenkan]
		(lambda()
		  (interactive)
		  (set-input-method nil)))

;;http://d.hatena.ne.jp/kitokitoki/20110815/p4
(require 'ccc)

(global-set-key (kbd "<zenkaku-hankaku>") 'toggle-input-method)

;; mozc-mode 時はカーソルを青にする
(setq mozc-color "blue")

(defun mozc-change-cursor-color ()
  (if mozc-mode
      (set-buffer-local-cursor-color mozc-color)
    (set-buffer-local-cursor-color nil)))

(defadvice toggle-input-method (after my-toggle-input-method activate)
;  (key-chord-mode 1) ;key-chord.elを利用していないならこの行は不要
  (mozc-change-cursor-color))

(defsubst mozc-session-sendkey (key-list)
  "Send a key event to the helper process and return the resulting protobuf.
The resulting protocol buffer, which is represented as alist, is
mozc::commands::Output in C++.  Return nil on error.

KEY-LIST is a list of key code(97 = ?a) and/or key symbols('space, 'shift,
'meta and so on)."
  (when (equal '(zenkaku-hankaku) key-list) ;; 全角半角は強引に C-\ だったことにする
    (setq key-list '(110 control)))
  (when (mozc-session-create)
    (apply 'mozc-session-execute-command 'SendKey key-list)))

;; ----------------おれおれ
(setq mozc-cursor-color "blue")
;; (defadvice set-input-method (before)
;;   (if current-input-method
;;       (set-cursor-color mozc-cursor-color)
;;     (set-cursor-color "goldenrod")))

