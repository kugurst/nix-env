(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-modes
   (quote
    (emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode c-mode cc-mode c++-mode go-mode java-mode malabar-mode clojure-mode clojurescript-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode tcl-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode scss-mode less-css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode web-mode ts-mode sclang-mode verilog-mode qml-mode yaml-mode conf-mode)))
 '(eclim-eclipse-dirs
   (quote
    ("/Applications/eclipse" "/usr/lib/eclipse" "/usr/local/lib/eclipse" "/usr/share/eclipse" "/cygdrive/e/eclipse-java-mars-R-win32-x86_64" "~/cygdrive/e/eclipse-java-mars-R-win32-x86_64")))
 '(eclim-executable "~/cygdrive/e/eclipse-java-mars-R-win32-x86_64/eclim.bat")
 '(eclimd-default-workspace "~/cygdrive/e/Development/Java/Eclipse")
 '(ido-enable-flex-matching t)
 '(markdown-enable-math t)
 '(markdown-indent-on-enter t)
 '(menu-bar-mode nil)
 '(multi-term-buffer-name "multi-terminal")
 '(shell-pop-autocd-to-working-dir nil)
 '(shell-pop-default-directory nil)
 '(shell-pop-full-span t)
 '(shell-pop-shell-type
   (quote
    ("multi-term" "*terminal*"
     (lambda nil
       (multi-term)))))
 '(shell-pop-term-shell "/bin/zsh")
 '(shell-pop-universal-key "<apps>")
 '(shell-pop-window-position "top")
 '(shell-pop-window-size 33)
 '(show-paren-mode t)
 '(term-buffer-maximum-size 10000)
 '(term-unbind-key-list (quote ("C-z" "C-x" "C-c" "C-h" "C-y" "<ESC>")))
 '(tool-bar-mode nil)
 '(undo-tree-auto-save-history t))

(setq read-buffer-completion-ignore-case t)
(setq inhibit-startup-message t)
(setq show-paren-delay 0)
(show-paren-mode 1)
(setq w32-pipe-read-delay 0)
;; Don't make a sound when striking the bell
(setq visible-bell 1)

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
(progn (remove-hook 'comint-preoutput-filter-functions 'xterm-color-filter)
       (add-to-list 'comint-output-filter-functions 'ansi-color-process-output)
       (setq font-lock-unfontify-region-function 'font-lock-default-unfontify-region))

;; Also set TERM accordingly (xterm-256color)

;; You can also use it with eshell (and thus get color output from system ls):

(add-hook 'eshell-mode-hook
          (lambda ()
            (setq xterm-color-preserve-properties t)))

;; (add-to-list 'eshell-preoutput-filter-functions 'xterm-color-filter)
;; (setq eshell-output-filter-functions (remove 'eshell-handle-ansi-color eshell-output-filter-functions))
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

(load-theme 'darktooth t)
;; (load-theme 'Amelie t)

(global-linum-mode t)

(when (require 'term nil t) ; only if term can be loaded..
  (setq term-bind-key-alist
        (list (cons "C-c C-c" 'term-interrupt-subjob)
              (cons "C-c C-e" 'term-send-esc)
              (cons "C-p" 'previous-line)
              (cons "C-n" 'next-line)
              (cons "C-s" 'isearch-forward)
              (cons "C-m" 'term-send-return)
              (cons "C-y" 'term-paste)
              (cons "<C-left>" 'term-send-backward-word)
              (cons "<C-right>" 'term-send-forward-word)
              (cons "C-r" 'term-send-reverse-search-history)
              (cons "M-M" 'term-send-forward-kill-word)
              (cons "M-N" 'term-send-backward-kill-word)
              (cons "<C-backspace>" 'term-send-backward-kill-word)
              (cons "M-," 'term-send-raw)
              (cons "M-." 'comint-dynamic-complete))))

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

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata-g" :foundry "outline" :slant normal :weight normal :height 143 :width normal)))))




(load-library "func-setup")
