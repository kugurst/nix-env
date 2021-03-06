(defun my-shell-mode-hook ()
  (setq comint-input-ring-file-name "~/.zsh_history")  ;; or bash_history
  (comint-read-input-ring t))

(defun switch-to-previous-buffer ()
      (interactive)
      (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun sudo-edit-current-file ()
  (interactive)
  (let ((my-file-name) ; fill this with the file to open
        (position))    ; if the file is already open save position
    (if (equal major-mode 'dired-mode) ; test if we are in dired-mode
        (progn
          (setq my-file-name (dired-get-file-for-visit))
          (find-alternate-file (prepare-tramp-sudo-string my-file-name)))
      (setq my-file-name (buffer-file-name); hopefully anything else is an already opened file
            position (point))
      (find-alternate-file (prepare-tramp-sudo-string my-file-name))
      (goto-char position))))


(defun prepare-tramp-sudo-string (tempfile)
  (if (file-remote-p tempfile)
      (let ((vec (tramp-dissect-file-name tempfile)))

        (tramp-make-tramp-file-name
         "sudo"
         (tramp-file-name-user nil)
         (tramp-file-name-host vec)
         (tramp-file-name-localname vec)
         (format "ssh:%s@%s|"
                 (tramp-file-name-user vec)
                 (tramp-file-name-host vec))))
    (concat "/sudo:root@localhost:" tempfile)))


(defun switch-to-minibuffer ()
  "Switch to minibuffer window."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))
    (error "Minibuffer is not active")))

(defun my-desktop-save ()
  (interactive)
  ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))

(defun term-send-C-x ()
  (interactive)
  (term-send-raw-string "\C-x"))

(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line.

Move point to the first non-whitespace character on this line.
If point was already at that position, move point to beginning of line."
  (interactive) ; Use (interactive "^") in Emacs 23 to make shift-select work
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))

(defun my-pkg-init()
  (electric-indent-mode -1)  ; no electric indent, auto-indent is sufficient
  (clean-aindent-mode t)
  (setq clean-aindent-is-simple-indent t)
  (define-key global-map (kbd "RET") 'newline-and-indent))

(defun join-region (beg end)
  "Apply join-line over region."
  (interactive "r")
  (if mark-active
      (let ((beg (region-beginning))
            (end (copy-marker (region-end))))
        (goto-char beg)
        (while (< (point) end)
                  (join-line 1)))))

(defun set-tab-stop-to-two ()
  (setq-local tab-width 2)
  (setq-local tab-stop-list (number-sequence 2 200 2)))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-attr-indent-offset 2))

(defun ruby-eval-region()
  "Prints the evaluation of Ruby statements in region to a new output buffer"
  (interactive)
  (let ((output-buffer "Ruby Output"))
    (shell-command-on-region (mark) (point) "ruby" output-buffer)
    (switch-to-buffer output-buffer)))

(defun ruby-pretty-print()
  "Pretty prints the evaluation of a Ruby expression in region to a new output buffer"
  (interactive)
  (save-excursion
    (let ((code (buffer-substring (mark) (point)))
          (code-buffer (generate-new-buffer "ruby-code")))
      (switch-to-buffer code-buffer)
      (insert (concat "require 'pp'\nputs (" code ")\n"))
      (mark-whole-buffer)
      (ruby-eval-region)
      (kill-buffer code-buffer))))

(defun diminished-modes ()
  "Echo all active diminished or minor modes as if they were minor.
The display goes in the echo area; if it's too long even for that,
you can see the whole thing in the *Messages* buffer.
This doesn't change the status of any modes; it just lets you see
what diminished modes would be on the mode-line if they were still minor."
  (interactive)
  (let ((minor-modes minor-mode-alist)
        message)
    (while minor-modes
      (when (symbol-value (caar minor-modes))
        ;; This minor mode is active in this buffer
        (let* ((mode-pair (car minor-modes))
               (mode (car mode-pair))
               (minor-pair (or (assq mode diminished-mode-alist) mode-pair))
               (minor-name (cadr minor-pair)))
          (when (symbolp minor-name)
            ;; This minor mode uses symbol indirection in the cdr
            (let ((symbols-seen (list minor-name)))
              (while (and (symbolp (callf symbol-value minor-name))
                          (not (memq minor-name symbols-seen)))
                (push minor-name symbols-seen))))
          (push minor-name message)))
      (callf cdr minor-modes))
    ;; Handle :eval forms
    (setq message (mapconcat
                   (lambda (form)
                     (if (and (listp form) (eq (car form) :eval))
                         (apply 'eval (cdr form))
                       form))
                   (nreverse message) ""))
    (when (= (string-to-char message) ?\ )
      (callf substring message 1))
      (message "%s" message)))
