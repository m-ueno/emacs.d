;; init-atok.el

;; source: http://d.hatena.ne.jp/kiwanami/20101205/1291563195

;; ATOK X3
(setq iiimcf-server-control-hostlist (list (concat "/tmp/.iiim-" (user-login-name) "/:0.0")))
(when (and (= 0 (shell-command
                 (concat
                  "netstat --unix -l | grep -q "
                  (car iiimcf-server-control-hostlist))))
           (require 'iiimcf-sc nil t))
  (setq iiimcf-server-control-default-language "ja")
  (setq iiimcf-server-control-default-input-method "atokx3")
  (setq default-input-method 'iiim-server-control)
  (setq iiimcf-UI-input-method-title-format "<ATOK:%s>")
  (setq iiimcf-UI-preedit-use-face-p "window-system")
  (setq iiimcf-keycode-spec-alist
        (append
         '(
           (11 113 65535) ; C-k = F2(113)
           (12 114 65535) ; C-l = F3(114)
           (9  113 65535) ; C-i = F2(113)
           (15 114 65535) ; C-o = F3(114)
           (7  27  65535) ; C-g = Esc
           (16 38  65535) ; C-p = Up(38)
           (14 28  65535) ; C-n = Down(28)
           (2  37  65535) ; C-b = Left(37)
           (6  39  65535) ; C-f = Right(39)
           )
         iiimcf-keycode-spec-alist))
  (define-key global-map [henkan] (lambda ()
                                    (interactive)
                                    (if current-input-method (inactivate-input-method))
                                    (toggle-input-method)))
  (define-key global-map [muhenkan] (lambda ()
                                      (interactive)
                                      (inactivate-input-method)))
  )


(require 'popup)
(defvar iiimcf-UI-draw-lookup-choice-popup-instance nil)

(defun iiimcf-UI-draw-lookup-choice-popup-position ()
  ;; uic via dynamic scope!!!
  (let* ((pos (marker-position (iiimcf-UI-marker uic)))
         (text (iiimcf-UI-preedit-text uic))
         (len (length text))
         (pts 0) pte cprop position)
    (setq text (copy-sequence text))
    (while pts
      (setq cprop (get-text-property pts 'iiim-feedback text)
            pte (next-single-property-change pts 'iiim-feedback text))
      (if (eq 'reverse (car cprop))
          (setq position (+ pos pts) pts nil)
        (setq pts pte)))
    position))

(defun iiimcf-UI-draw-lookup-choice-popup (mk candidates)
  (let ((cands (aref candidates 0))
        (index (aref candidates 1))
        (title (aref candidates 2)) lst)
    (setq lst (loop for pair in cands
                    for num = (car pair)
                    for str = (cdr pair)
                    collect (popup-make-item
                             (format "%s:%s" num str))))
    (unless (and
             iiimcf-UI-draw-lookup-choice-popup-instance
             (popup-p iiimcf-UI-draw-lookup-choice-popup-instance))
      (setq iiimcf-UI-draw-lookup-choice-popup-instance
            (popup-create (iiimcf-UI-draw-lookup-choice-popup-position) ; pos
                          (popup-preferred-width lst)  ; width
                          10 ; height
                          :around t
                          :face 'popup-menu-face
                          :selection-face 'popup-menu-selection-face)))
    (popup-set-list iiimcf-UI-draw-lookup-choice-popup-instance lst)
    (popup-draw iiimcf-UI-draw-lookup-choice-popup-instance)
    (popup-select iiimcf-UI-draw-lookup-choice-popup-instance index)))

(defun iiimcf-UI-clear-lookup-choice-popup (marker)
  (when
      (and
       iiimcf-UI-draw-lookup-choice-popup-instance
       (popup-p iiimcf-UI-draw-lookup-choice-popup-instance))
    (popup-delete iiimcf-UI-draw-lookup-choice-popup-instance))
  (setq iiimcf-UI-draw-lookup-choice-popup-instance nil))

(defadvice iiimcf-UI-draw-lookup-choice-echo-line
  (around iiimcf-ui-popup (mk candidates))
  (iiimcf-UI-draw-lookup-choice-popup mk candidates)
                                        ;ad-do-it
  )

(defadvice iiimcf-UI-clear-lookup-choice-echo-line
  (around iiimcf-ui-popup (mk))
  (iiimcf-UI-clear-lookup-choice-popup mk)
                                        ;ad-do-it
  )

(ad-activate-regexp "^iiimcf-ui-popup")


;; 確定アンドゥ
(defun atok-undo-commit ()
  (interactive)
  (when iiimcf-server-control-ic-id
    (iiimcf-server-control-keyforward last-input-event)
    (iiimcf-set-icfocus iiimcf-server-control-ic-id)))

(define-key iiimcf-server-control-initial-state-keymap
  (kbd "<C-backspace>") ; ATOKでは C-BS に確定アンドゥが割り当ててある
  'atok-undo-commit)

