;; melpa
(require 'package)
(add-to-list 'package-archives 
    '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; recursive load path
(defun add-subdirs-to-load-path(dir)
    "Recursive add directories to `load-path`"
    (let ((default-directory (file-name-as-directory dir)))
        (add-to-list 'load-path dir)
        (normal-top-level-add-subdirs-to-load-path)))
(add-subdirs-to-load-path "~/.emacs.d/config")
(add-subdirs-to-load-path "~/.emacs.d/extension")

;; require config
(require 'init-config)
