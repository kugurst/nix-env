(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(require 'ido)
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
(ido-mode t)
(ido-everywhere 1)

(setq visible-bell 1)
(setq read-buffer-completion-ignore-case t)

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

;; xterm-color
(require 'xterm-color)
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
(add-hook 'shell-mode-hook 'compilation-shell-minor-mode)
(add-hook 'shell-mode-hook 'my-shell-mode-hook)
(defun my-shell-mode-hook ()
  (setq comint-input-ring-file-name "~/.zsh_history")  ;; or bash_history
  (comint-read-input-ring t))

(setq inhibit-startup-message t)

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

;; (setq tramp-shell-prompt-pattern "\(^[^#$%>\n]*[#$%>] *\)")
;; (setq tramp-shell-prompt-pattern "\\(\\(?:^\\|\\)[^]#$%>\n]*#?[]#$%>] *\\(\\[[0-9;]*[a-zA-Z] *\\)*\\|> *\\|\\[\\?[[:digit:]]+h *\\)")
(setq tramp-default-method "ssh")

(setq shell-file-name "/bin/zsh")

(setq show-paren-delay 0)
(show-paren-mode 1)

;; loading packages

(add-to-list 'load-path "~/.emacs.d/plugins/")
(let ((default-directory "~/.emacs.d/plugins/"))
  (normal-top-level-add-subdirs-to-load-path))

(require 'ecb)

(require 'multi-term)
(setq multi-term-program "/bin/zsh")
(setq term-buffer-maximum-size 10000)
(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)))

(defun switch-to-previous-buffer ()
      (interactive)
      (switch-to-buffer (other-buffer (current-buffer) 1)))

(require 'ssh)
(setq directory-tracking-mode 'ftp)
(setq ssh-mode-hook (lambda ()
 (shell-dirtrack-mode t)
 (setq dirtrackp nil)))
(setq ssh-mode-hook 'ssh-directory-tracking-mode)

(require 'exec-path-from-shell) ;; if not using the ELPA package
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'ace-window)
(require 'unbound)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-show-menu t)

;; (defun auto-complete-mode-maybe ()
;;   "No maybe for you. Only AC!"
;;   (unless (minibufferp (current-buffer))
;;     (auto-complete-mode 1)))
(global-auto-complete-mode t)

(setq w32-pipe-read-delay 0)

(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(global-set-key (kbd "C-.") 'ace-jump-mode)

;; 
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(global-set-key (kbd "C-,") 'ace-jump-mode-pop-mark)

;; (require 'fasd-shell)
;; (add-hook 'shell-mode-hook 'fasd-shell-mode)

(require 'shell-pop)
(require 'dired)

;; (require 'joseph-sudo)
;; (global-set-key [f2] 'toggle-read-only-file-with-sudo)
(require 'tramp)
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

(global-set-key [f2] 'sudo-edit-current-file)


(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(require 'better-defaults)

(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

(require 'ido-yes-or-no)
(ido-yes-or-no-mode 1)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(require 'undo-tree)
(global-undo-tree-mode)

(require 'dash)

(require 'eclim)
(require 'eclimd)
(global-eclim-mode)

(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)

(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;; Key bindings and desktop
(load-theme 'darktooth t)
;; (load-theme 'Amelie t)

(global-linum-mode t)
(defun switch-to-minibuffer ()
  "Switch to minibuffer window."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))
    (error "Minibuffer is not active")))

(global-set-key "\C-co" 'switch-to-minibuffer) ;; Bind to `C-c o'
(global-set-key (kbd "C-S-c") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-S-v") 'clipboard-yank)
(global-set-key (kbd "C-S-x") 'kill-region)
(global-set-key [f1] 'switch-to-previous-buffer)
(global-set-key (kbd "M-p") 'ace-window)
(global-set-key (kbd "C-x C-b") 'bs-show)
(global-set-key (kbd "M-<apps>") 'kill-some-buffers)
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

(when (fboundp 'next-buffer)            ; Emacs 21+.
  (global-set-key [C-pause] 'previous-buffer)                                   ; `C-pause'
  (global-set-key [M-pause] 'next-buffer))                                      ; `M-pause'

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
(global-set-key (kbd "C-'") 'term-line-mode)
(global-set-key (kbd "C-;") 'term-char-mode)

(global-set-key (kbd "M-]") 'multi-term-next)
(global-set-key (kbd "M-[") 'multi-term-prev)

(require 'desktop)
(desktop-save-mode 1)
(defun my-desktop-save ()
  (interactive)
  ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))
(add-hook 'auto-save-hook 'my-desktop-save)

(defun term-send-C-x ()
  (interactive)
  (term-send-raw-string "\C-x"))
(global-set-key (kbd "C-x e") 'term-send-C-x)

;; Default font
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
