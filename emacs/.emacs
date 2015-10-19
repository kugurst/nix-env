(add-to-list 'load-path "~/.emacs.d/load/")
(add-to-list 'load-path "~/.emacs.d/plugins/")
(let ((default-directory "~/.emacs.d/plugins/"))
  (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(load-library "package-setup")
(load-library "env-setup")
(load-library "key-setup")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-modes
   (quote
    (emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode c-mode cc-mode c++-mode go-mode java-mode malabar-mode clojure-mode clojurescript-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode tcl-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode scss-mode less-css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode web-mode ts-mode sclang-mode verilog-mode qml-mode yaml-mode conf-mode)))
 '(desktop-restore-forces-onscreen nil)
 '(desktop-save-mode t)
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
 '(multi-term-program "/bin/zsh")
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
 '(term-bind-key-alist
   (quote
    (("C-c C-c" . term-interrupt-subjob)
     ("C-c C-e" . term-send-esc)
     ("C-p" . previous-line)
     ("C-n" . next-line)
     ("C-s" . isearch-forward)
     ("C-m" . term-send-return)
     ("C-y" . term-paste)
     ("<C-left>" . term-send-forward-word)
     ("<C-right>" . term-send-backward-word)
     ("C-r" . term-send-reverse-search-history)
     ("M-M" . term-send-forward-kill-word)
     ("M-N" . term-send-backward-kill-word)
     ("<C-backspace>" . term-send-backward-kill-word)
     ("M-," . term-send-raw)
     ("M-." . comint-dynamic-complete))))
 '(term-buffer-maximum-size 10000)
 '(term-unbind-key-list (quote ("C-z" "C-x" "C-c" "C-h" "C-y" "<ESC>")))
 '(tool-bar-mode nil)
 '(undo-tree-auto-save-history t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata-g" :foundry "outline" :slant normal :weight normal :height 143 :width normal)))))
