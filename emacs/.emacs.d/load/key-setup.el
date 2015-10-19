(global-set-key (kbd "C-.") 'ace-jump-mode)
(global-set-key (kbd "C-,") 'ace-jump-mode-pop-mark)

(global-set-key [f2] 'sudo-edit-current-file)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key "\C-co" 'switch-to-minibuffer) ;; Bind to `C-c o'
(global-set-key (kbd "C-S-c") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-S-v") 'clipboard-yank)
(global-set-key (kbd "C-S-x") 'kill-region)
(global-set-key [f1] 'switch-to-previous-buffer)
(global-set-key (kbd "M-p") 'ace-window)
(global-set-key (kbd "C-x C-b") 'bs-show)
(global-set-key (kbd "C-<apps>") 'kill-some-buffers)
(global-set-key (kbd "M-<apps>") 'other-frame)
(global-set-key (kbd "<scroll>") (lookup-key global-map (kbd "M-x")))
(global-set-key (kbd "C-d") 'kill-whole-line)
(global-set-key (kbd "M-p") 'ace-window)
(global-set-key (kbd "M-n") 'delete-other-windows)
(global-set-key (kbd "M-<RET>") 'ac-fuzzy-complete)
(global-set-key [f5] (lambda ()
                       (interactive)
                       (dired ".")))
(global-set-key [f6] (lambda ()
                       (interactive)
                       (print default-directory)))
;; (global-set-key (kbd "<left-margin> <double-mouse-1>") 'term-line-mode)

(when (fboundp 'next-buffer)            ; Emacs 21+.
  (global-set-key [C-pause] 'previous-buffer)                                   ; `C-pause'
  (global-set-key [M-scroll] 'previous-buffer)
  (global-set-key [M-pause] 'next-buffer))                                      ; `M-pause'

(global-set-key (kbd "C-'") 'term-line-mode)
(global-set-key (kbd "C-;") 'term-char-mode)

(global-set-key (kbd "M-]") 'multi-term-next)
(global-set-key (kbd "M-[") 'multi-term-prev)

(global-set-key (kbd "C-x e") 'term-send-C-x)
