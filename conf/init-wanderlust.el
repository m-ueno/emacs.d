;;; init-wanderlust.el --- 

(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;; ----------------------------------------------------------------
;; .wl
;; ----------------------------------------------------------------
;; http://d.hatena.ne.jp/stanaka/20071025/1193286440
;; からまるごとコピー

;; IMAP サーバの設定
(setq elmo-imap4-default-server "imap.gmail.com")
(setq elmo-imap4-default-user "ueno.masaru.receive@gmail.com") ; 適宜修正してください
(setq elmo-imap4-default-authenticate-type 'clear) ; 以下3行コメント欄での指摘により追記
(setq elmo-imap4-default-port '993)
(setq elmo-imap4-default-stream-type 'ssl)

(setq elmo-imap4-use-modified-utf7 t)	; 日本語フォルダ対策

;; SMTP サーバの設定
(setq wl-smtp-connection-type 'starttls)
(setq wl-smtp-posting-port 587)
(setq wl-smtp-authenticate-type "plain")
(setq wl-smtp-posting-user "ueno.masaru.receive") ; 適宜修正してください
(setq wl-smtp-posting-server "smtp.gmail.com")
(setq wl-local-domain "gmail.com")

;; お勧め設定
;; デフォルトのフォルダ
(setq wl-default-folder "%inbox")

;; フォルダ名補完時に使用するデフォルトのスペック
(setq wl-default-spec "%")
(setq wl-draft-folder "%[Gmail]/Drafts") ; Gmail IMAPの仕様に合わせて
(setq wl-trash-folder "%[Gmail]/Trash")

(setq wl-folder-check-async t) ; 非同期でチェックするように

;; (setq wl-dispose-folder-alist
;;       (cons '("^%inbox" . remove) wl-dispose-folder-alist))

;; http://www.gside.org/blowg/w/user/tma/entry/wanderlust
;; 何も設定せずに起動すると以下のワーニングが表示されます。
;; Warning (elmo): Please set `wl-message-id-domain' to get valid Message-ID string.
;; .wlを編集して、差出人の設定をすると表示されなくなります。
(setq wl-from "ueno(receive-only) <ueno.masaru.receive@gmail.com>")

;; ----------------------------------------------------------------
;; POP
;; ----------------------------------------------------------------
;; http://www.gohome.org/wl/doc/wl-euc_30.html#SEC30
;; [.folders]
;;  #サーバーにメッセージを残さない場合
;;  &[username]@[server]
 
;;  #サーバーから%INBOXにメッセージを取り込む場合(サーバーにメッセージが残らない)
;;  |&[username]@[server]|%INBOX
 
;;  #サーバーから%INBOXにメッセージをコピーする場合(サーバーにメッセージが残る)
;;  |&[username]@[server]|:%INBOX

 ;; 送信済みフォルダ名称
 (setq wl-fcc ".Sent")
;; .folders に上記で設定したフォルダを記述します。
;; [.folders]
;;  .Sent

;; 逐一IMAPサーバーと通信をしてドラフトを保存をする機能が邪魔
;; http://q.hatena.ne.jp/1222169512
;; http://www.gohome.org/wl/doc/wl-euc_189.html
(setq wl-draft-folder "+draft")

;; ----------------------------------------------------------------
;; 公式ヘルプ
;; https://mail.google.com/support/bin/answer.py?answer=77657&topic=12762
;; 携帯端末/クライアント（iPhone/Outlook など）での操作	ウェブ上の Gmail での結果
;; メールを開く	メールを既読にする
;; メールにフラグを設定する	メールにスターを付ける
;; メールをフォルダに移動する	メールにラベルを付ける
;; メールをフォルダ内のフォルダに移動する*	フォルダ階層を示すラベルを付ける（「メインフォルダ/サブフォルダ」）*
;; フォルダを作成する	ラベルを作成する
;; メールを [[Gmail]/迷惑メール] に移動する	メールを迷惑メールとして報告する
;; メールを [[Gmail]/ゴミ箱] に移動する	メールを [ゴミ箱] に移動する
;; メールを送信する	メールを [送信済みメール] に保存する
;; 受信トレイのメールを削除する**	受信トレイからメールを削除する**
;; フォルダからメールを削除する**	メールからラベルを削除する**
;; メールを [[Gmail]/迷惑メール] や [[Gmail]/ゴミ箱] から削除する	メールを完全に削除する

;; http://www.deer-n-horse.jp/linux/tips/wanderlust.html
;; 3pane
(setq wl-thread-insert-opened t)
(setq wl-stay-folder-window t)
