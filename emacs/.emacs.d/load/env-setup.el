(load-library "func-setup")

(setq read-buffer-completion-ignore-case t)
(setq inhibit-startup-message t)
(setq show-paren-delay 0)
(show-paren-mode 1)
;; (setq w32-pipe-read-delay 0)
;; Don't make a sound when striking the bell
(setq ring-bell-function 'ignore)
(setq visible-bell nil)

;; Default to UTF-8 everywhere
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8-unix)
(setq default-terminal-coding-system 'utf-8-unix)
(defadvice ansi-term (after advise-ansi-term-coding-system)
    (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(ad-activate 'ansi-term)
;; (setq default-process-coding-system '((utf-8-unix . utf-8-unix)))
(add-hook 'term-exec-hook
          (function
           (lambda ()
             (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))))

;; xterm in multi-term
;; comint install
(progn (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter)
       (setq comint-output-filter-functions (remove 'ansi-color-process-output comint-output-filter-functions))
       (setq font-lock-unfontify-region-function 'xterm-color-unfontify-region))

;; comint uninstall
;; (progn (remove-hook 'comint-preoutput-filter-functions 'xterm-color-filter)
;;        (add-to-list 'comint-output-filter-functions 'ansi-color-process-output)
;;        (setq font-lock-unfontify-region-function 'font-lock-default-unfontify-region))

;; Also set TERM accordingly (xterm-256color)

;; You can also use it with eshell (and thus get color output from system ls):

(add-hook 'eshell-mode-hook
          (lambda ()
            (setq xterm-color-preserve-properties t)))

(add-to-list 'eshell-preoutput-filter-functions 'xterm-color-filter)
(setq eshell-output-filter-functions (remove 'eshell-handle-ansi-color eshell-output-filter-functions))
;; (require 'ansi-color)
;; (defun colorize-compilation-buffer ()
;; (toggle-read-only)
;; (ansi-color-apply-on-region (point-min) (point-max))
;;   (toggle-read-only))
;;   (add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
;;
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; (add-to-list 'comint-output-filter-functions 'ansi-color-process-output)
;; done with xterm in multi-term

(add-hook 'shell-mode-hook 'compilation-shell-minor-mode)
(add-hook 'shell-mode-hook 'my-shell-mode-hook)

;; shell control
(setq read-file-name-completion-ignore-case t)
(setq comint-prompt-read-only t)
(setq comint-input-ignoredups t)
(setq pcomplete-ignore-case t)

(setq savehist-additional-variables    ;; also save...
  '(search-ring regexp-search-ring)    ;; ... my search entries
  savehist-file "~/.emacs.d/savehist")
(savehist-mode t)

(setq auto-mode-alist
      (append '((".*\\.zshrc\\'" . sh-mode))
              auto-mode-alist))
(setq auto-mode-alist
      (append '((".*\\.zsh-theme\\'" . sh-mode))
              auto-mode-alist))
(setq auto-mode-alist
      (append '((".*\\PKGBUILD\\'" . sh-mode))
              auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode))

(setq tramp-default-method "ssh")
(setq shell-file-name "/bin/zsh")
;; (setq tramp-shell-prompt-pattern "\(^[^#$%>\n]*[#$%>] *\)")
;; (setq tramp-shell-prompt-pattern "\\(\\(?:^\\|\\)[^]#$%>\n]*#?[]#$%>] *\\(\\[[0-9;]*[a-zA-Z] *\\)*\\|> *\\|\\[\\?[[:digit:]]+h *\\)")

(setq multi-term-program "/bin/zsh")
(setq term-buffer-maximum-size 10000)
(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)))


(setq directory-tracking-mode 'ftp)
(setq ssh-mode-hook (lambda ()
 (shell-dirtrack-mode t)
 (setq dirtrackp nil)))
(setq ssh-mode-hook 'ssh-directory-tracking-mode)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(add-hook 'after-init-hook #'global-flycheck-mode)
;; (setq flycheck-check-syntax-automatically '(mode-enabled save idle-change))

;; (defun auto-complete-mode-maybe ()
;;   "No maybe for you. Only AC!"
;;   (unless (minibufferp (current-buffer))
;;     (auto-complete-mode 1)))

(global-auto-complete-mode t)
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)

(smex-initialize)

(load-theme 'gruvbox t)
;; (load-theme 'Amelie t)

(global-linum-mode t)

(add-hook 'auto-save-hook 'my-desktop-save)

(when (functionp 'set-fontset-font)
  (set-fontset-font "fontset-default"
                    'unicode
                    (font-spec :family "DejaVu Sans Mono"
                               :width 'normal
                               :size 13
                               :weight 'normal)))
;; (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono" ))
;; (set-face-attribute 'default nilt :font  "DejaVu Sans Mono"

(windmove-default-keybindings 'meta)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-tabs-mode nil)
(setq tab-width 4)
;; (setq-default tab-stop-list (number-sequence 4 200 4))
;; (setq tab-stop-list (number-sequence 4 200 4))
;; (setq-default c-basic-offset 4)
;; (setq-default tab-always-indent 'complete)
;; (setq tab-always-indent 'complete)

(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'conf-mode-hook 'auto-complete-mode)
(add-hook 'markdown-mode-hook 'auto-complete-mode)
(add-hook 'haml-mode-hook 'auto-complete-mode)

(set 'clean-aindent-is-simple-indent t)

(defun my-pkg-init()
  (electric-indent-mode -1)  ; no electric indent, auto-indent is sufficient
  (clean-aindent-mode t)
  (setq clean-aindent-is-simple-indent t)
  (define-key global-map (kbd "RET") 'newline-and-indent))

(add-hook 'after-init-hook 'my-pkg-init)

(add-hook 'projectile-mode-hook 'projectile-rails-on)

(global-visual-line-mode t)

(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'ruby-mode-hook 'flymake-mode)
(add-hook 'ruby-mode-hook 'auto-complete-mode)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook 'rinari-minor-mode)
(add-hook 'ruby-mode-hook 'projectile-mode)
(add-hook 'ruby-mode-hook 'electric-pair-mode)
(add-hook 'ruby-mode-hook '(lambda ()
                                 (local-set-key (kbd "S-RET") 'reindent-then-newline-and-indent)))

(add-hook 'ruby-mode-hook
          (lambda () (highlight-indentation-current-column-mode)))
(add-hook 'coffee-mode-hook
          (lambda () (highlight-indentation-current-column-mode)))
(add-hook 'web-mode-hook
          (lambda () (highlight-indentation-current-column-mode)))
(add-hook 'haml-mode-hook
          (lambda () (highlight-indentation-current-column-mode)))
;; (add-hook 'robe-mode-hook 'ac-robe-setup)
;; (add-hook 'coffee-mode-hook 'flymake-coffee-load)
(add-hook 'coffee-mode-hook 'auto-complete-mode)
(add-hook 'web-mode-hook 'set-tab-stop-to-two)
(add-hook 'web-mode-hook 'my-web-mode-hook)

(setq flyspell-issue-message-flg nil)

(add-hook 'ruby-mode-hook
          (lambda () (flyspell-prog-mode)))
(add-hook 'web-mode-hook
          (lambda () (flyspell-prog-mode)))

(ac-flyspell-workaround)

(add-hook 'scss-mode-hook 'rainbow-mode)
(add-hook 'scss-mode-hook (lambda ()
                            (setq tab-width 2)))
(add-hook 'term-mode-hook (lambda ()
                            (yas-minor-mode -1)))

;; (autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))
(setq mouse-wheel-scroll-amount '(2 ((shift) . 2))) ;; one line at a time

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq scroll-step 1) ;; keyboard scroll one line at a time

(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

(autoload 'guess-style-set-variable "guess-style" nil t)
(autoload 'guess-style-guess-variable "guess-style")
(autoload 'guess-style-guess-all "guess-style" nil t)

(yas-global-mode 1)

(eval-after-load 'rspec-mode
  '(rspec-install-snippets))

(eval-after-load "abbrev"
  '(diminish 'abbrev-mode "Ab"))
(eval-after-load "yasnippet"
  '(diminish 'yas-minor-mode))
(eval-after-load "undo-tree"
  '(diminish 'undo-tree-mode " U"))
(eval-after-load "flymake"
  '(diminish 'flymake-mode " FM"))
(eval-after-load "flyspell"
  '(diminish 'flyspell-mode " FS"))
(eval-after-load "highlight-indentation"
  '(diminish 'highlight-indentation-current-column-mode " HI"))
(eval-after-load "rinari"
  '(diminish 'rinari-minor-mode "Rin"))
(eval-after-load "robe"
  '(diminish 'robe-mode "Rb"))
(eval-after-load "projectile-rails"
  '(diminish 'projectile-rails-mode "Rl"))
(eval-after-load "simple"
  '(diminish 'visual-line-mode " W"))

(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

(recentf-mode 1)
(setq recentf-max-menu-items 25)

(setq css-indent-offset 2)
(setq web-mode-html-offset 2)

(provide 'env-setup)
;;; env-setup ends here
