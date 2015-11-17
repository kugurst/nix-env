(add-to-list 'load-path "~/.emacs.d/load/")
(add-to-list 'load-path "~/.emacs.d/plugins/guess-style")
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
  (emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode c-mode cc-mode c++-mode go-mode java-mode malabar-mode clojure-mode clojurescript-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode tcl-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode scss-mode less-css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode web-mode ts-mode sclang-mode verilog-mode qml-mode yaml-mode conf-mode markdown-mode)))
 '(clean-aindent-mode t)
 '(coffee-tab-width 2)
 '(custom-safe-themes
 (quote
  ("5d1434865473463d79ee0523c1ae60ecb731ab8d134a2e6f25c17a2b497dd459" "f21caace402180ab3dc5157d2bb843c4daafbe64aadc362c9f4558ac17ce43a2" "0b6645497e51d80eda1d337d6cabe31814d6c381e69491931a688836c16137ed" "f245c9f24b609b00441a6a336bcc556fe38a6b24bfc0ca4aedd4fe23d858ba31" "c0dd384b870de1c769d37fec8f9ff22f191b1eba7a49b1181d361e7a3c4713f0" "03e3e79fb2b344e41a7df897818b7969ca51a15a67dc0c30ebbdeb9ea2cd4492" "b6db49cec08652adf1ff2341ce32c7303be313b0de38c621676122f255ee46db" default)))
 '(desktop-restore-forces-onscreen nil)
 '(desktop-save-mode t)
 '(display-buffer-function nil)
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote (("/" "/"))))
 '(eclim-eclipse-dirs
 (quote
  ("/Applications/eclipse" "/usr/lib/eclipse" "/usr/local/lib/eclipse" "/usr/share/eclipse" "/cygdrive/e/eclipse-java-mars-R-win32-x86_64" "~/cygdrive/e/eclipse-java-mars-R-win32-x86_64")))
 '(eclim-executable "~/cygdrive/e/eclipse-java-mars-R-win32-x86_64/eclim.bat")
 '(eclimd-default-workspace "~/cygdrive/e/Development/Java/Eclipse")
 '(ido-enable-flex-matching t)
 '(indent-tabs-mode nil)
 '(inf-ruby-default-implementation "pry")
 '(inf-ruby-implementations
 (quote
  (("pry" . "pry")
   ("ruby" . "irb --prompt default --noreadline -r irb/completion")
   ("jruby" . "jruby -S irb --prompt default --noreadline -r irb/completion")
   ("rubinius" . "rbx -r irb/completion")
   ("yarv" . "irb1.9 -r irb/completion")
   ("macruby" . "macirb -r irb/completion"))))
 '(markdown-command "\"/cygdrive/c/Program Files (x86)/Pandoc/pandoc\"")
 '(markdown-enable-math t)
 '(markdown-indent-on-enter t)
 '(menu-bar-mode nil)
 '(multi-term-buffer-name "mt")
 '(multi-term-program "/bin/zsh")
 '(shell-pop-autocd-to-working-dir nil)
 '(shell-pop-default-directory nil)
 '(shell-pop-full-span t)
 '(shell-pop-shell-type (quote ("multi-term" "*mt-p*" (lambda nil (multi-term)))))
 '(shell-pop-term-shell "/bin/zsh")
 '(shell-pop-universal-key "<apps>")
 '(shell-pop-window-position "top")
 '(shell-pop-window-size 33)
 '(show-paren-mode t)
 '(tab-always-indent (quote complete))
 '(tab-stop-list
 (quote
  (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120 124 128 132 136 140 144 148 152 156 160 164 168 172 176 180 184 188 192 196 200)))
 '(term-bind-key-alist
 (quote
  (("C-c C-c" . term-interrupt-subjob)
   ("C-c C-e" . term-send-esc)
   ("C-p" . previous-line)
   ("C-n" . next-line)
   ("C-s" . isearch-forward)
   ("C-m" . term-send-return)
   ("C-y" . term-paste)
   ("<C-right>" . term-send-forward-word)
   ("<C-left>" . term-send-backward-word)
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
 '(default ((t (:family "Inconsolata" :foundry "PfEd" :slant normal :weight normal :height 145 :width normal)))))

(yas-global-mode 1)

(provide '.emacs)
;;; .emacs ends here
