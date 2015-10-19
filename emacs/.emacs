(add-to-list 'load-path "~/.emacs.d/load/")
(add-to-list 'load-path "~/.emacs.d/plugins/")
(let ((default-directory "~/.emacs.d/plugins/"))
  (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(load-library "package-setup")
(load-library "env-setup")
(load-library "key-setup")
