(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(require 'cl)

(defvar packages-list
  '(ace-window
    auto-complete
    avy
    avy-zap
    better-defaults
    darktooth-theme
    furl
    grizzl
    ido-yes-or-no
    markdown-mode
    marmalade
    multi-term
    popup
    readline-complete
    s
    seti-theme
    shell-pop
    smex
    xterm-color
    yasnippet)
  "List of packages needs to be installed at launch")

(defun has-package-not-installed ()
  (loop for p in packages-list
        when (not (package-installed-p p)) do (return t)
        finally (return nil)))
(when (has-package-not-installed)
  ;; Check for new packages (package versions)
  (message "%s" "Get latest versions of all packages...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; Install the missing packages
  (dolist (p packages-list)
    (when (not (package-installed-p p))
      (package-install p))))

;; Install packages here

(require 'ido)
(ido-mode t)
(ido-everywhere 1)

(require 'xterm-color)
(require 'ecb)
(require 'multi-term)

(require 'ssh)
(require 'exec-path-from-shell)
(require 'ace-window)
(require 'unbound)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-show-menu t)

;; (require 'fasd-shell)
;; (add-hook 'shell-mode-hook 'fasd-shell-mode)
(require 'shell-pop)
(require 'dired)
;; (require 'joseph-sudo)
;; (global-set-key [f2] 'toggle-read-only-file-with-sudo)
(require 'tramp)
(require 'better-defaults)

(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

(require 'ido-yes-or-no)
(ido-yes-or-no-mode 1)

(require 'yaml-mode)

(require 'undo-tree)
(global-undo-tree-mode)

(require 'dash)

(require 'eclim)
(require 'eclimd)
(global-eclim-mode)

(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)

(require 'markdown-mode)

(require 'desktop)
