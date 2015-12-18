(global-set-key (kbd "C-.") 'ace-jump-mode)
(global-set-key (kbd "C-,") 'ace-jump-mode-pop-mark)
(global-set-key (kbd "C-<") 'avy-goto-line)
(global-set-key (kbd "C->") 'avy-goto-char-2)

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

(global-set-key [f7] 'auto-complete-mode)
;; (global-set-key (kbd "<left-margin> <double-mouse-1>") 'term-line-mode)

(when (fboundp 'next-buffer)            ; Emacs 21+.
  (global-set-key [C-pause] 'previous-buffer)                                   ; `C-pause'
  (global-set-key [M-scroll] 'previous-buffer)
  (global-set-key [M-pause] 'next-buffer))                                      ; `M-pause'

(global-set-key (kbd "C-'") 'term-line-mode)
(global-set-key (kbd "C-;") 'term-char-mode)
(global-set-key [S-return] 'reindent-then-newline-and-indent)

(global-set-key (kbd "M-]") 'multi-term-next)
(global-set-key (kbd "M-[") 'multi-term-prev)

(global-set-key (kbd "C-SPC") 'auto-complete)

(global-set-key (kbd "C-x e") 'term-send-C-x)

;; (define-key text-mode-map (kbd "<tab>") 'tab-to-tab-stop)
;; (global-set-key (kbd "TAB") 'indent-relative)
;; (global-set-key (kbd "TAB") 'tab-to-tab-stop)

(global-set-key [scroll] 'minimap-toggle)

(global-set-key (kbd "C-l") 'helm-swoop)
(global-set-key (kbd "C-S-l") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-M-i") 'helm-multi-swoop-all)

(global-set-key (kbd "C-z") 'undo-tree-undo)
(global-set-key (kbd "C-S-z") 'undo-tree-redo)

(global-set-key (kbd "C-a") 'smart-beginning-of-line)
;; (global-set-key (kbd "S-<home>") 'beginning-of-line-mark)
;; (global-set-key [C-S-home] 'beginning-of-buffer-mark)

(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(define-key markdown-mode-map (kbd "M-<up>") 'windmove-up)
(define-key markdown-mode-map (kbd "M-<down>") 'windmove-down)
(define-key markdown-mode-map (kbd "M-<left>") 'windmove-left)
(define-key markdown-mode-map (kbd "M-<right>") 'windmove-right)
(define-key markdown-mode-map (kbd "M-p") 'ace-window)
(define-key term-mode-map (kbd "TAB") 'term-send-raw)
