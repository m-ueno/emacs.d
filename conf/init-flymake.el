;; init-flymake.el
(require 'flymake)
(defun flymake-show-and-sit ()
  "Displays the error/warning for the current line in the minibuffer"
  (interactive)
  (progn
    (let* ( (line-no (flymake-current-line-no) )
	    (line-err-info-list (nth 0 (flymake-find-err-info 
					flymake-err-info line-no)))
	    (count (length line-err-info-list)))
      (while (> count 0)
	(when line-err-info-list
	  (let* ((file (flymake-ler-file (nth (1- count) 
					      line-err-info-list)))
		 (full-file (flymake-ler-full-file (nth (1- count)
							line-err-info-list)))
		 (text (flymake-ler-text (nth (1- count) line-err-info-list)))
		 (line (flymake-ler-line (nth (1- count) 
					      line-err-info-list))))
	    (message "[%s] %s" line text)))
	(setq count (1- count)))))
  (sit-for 60.0))
(global-set-key "\C-cd"
		'flymake-show-and-sit)

;; flymake C
(defun flymake-c-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "gcc" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))
(push '("\\.c$" flymake-c-init) flymake-allowed-file-name-masks)

(add-hook 'c-mode-hook
          '(lambda ()
	     (flymake-mode t)))

;; flymake Ruby
(set-face-background 'flymake-errline "red4")
(set-face-background 'flymake-warnline "dark slate blue")
					; Invoke ruby with '-c' to get syntax checking
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))
(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)
(add-hook
 'ruby-mode-hook
 '(lambda ()
    ;; Don't want flymake mode for ruby regions in rhtml files
    (if (not (null buffer-file-name)) (flymake-mode))))


;; Additional functionality that makes flymake error messages appear 
;; in the minibuffer when point is on a line containing a flymake 
;; error. This saves having to mouse over the error, which is a 
;; keyboard user's annoyance
;; http://plope.com/Members/chrism/flymake-mode

;;flymake-ler(file line type text &optional full-file) 
(defun show-fly-err-at-point () 
  "If the cursor is sitting on a flymake error, display the message in the minibuffer" 
  (interactive) 
  (let ((line-no (line-number-at-pos))) 
    (dolist (elem flymake-err-info) 
      (if (eq (car elem) line-no) 
	  (let ((err (car (second elem)))) 
	    (message "%s" (fly-pyflake-determine-message err))))))) 

(defun fly-pyflake-determine-message (err) 
  "pyflake is flakey if it has compile problems, this adjusts the 
message to display, so there is one ;)" 
  (cond ((not (or (eq major-mode 'Python) (eq major-mode 'python-mode) t))) 
	((null (flymake-ler-file err)) 
	 ;; normal message do your thing 
	 (flymake-ler-text err)) 
	(t ;; could not compile err 
	 (format "compile error, problem on line %s" (flymake-ler-line err))))) 

(defadvice flymake-goto-next-error (after display-message activate compile) 
  "Display the error in the mini-buffer rather than having to mouse over it" 
  (show-fly-err-at-point)) 

(defadvice flymake-goto-prev-error (after display-message activate compile) 
  "Display the error in the mini-buffer rather than having to mouse over it" 
  (show-fly-err-at-point)) 

(defadvice flymake-mode (before post-command-stuff activate compile) 
  "Add functionality to the post command hook so that if the 
cursor is sitting on a flymake error the error information is 
displayed in the minibuffer (rather than having to mouse over 
it)" 
  (set (make-local-variable 'post-command-hook) 
       (cons 'show-fly-err-at-point post-command-hook))) 
