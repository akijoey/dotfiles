;; init.el -*- lexical-binding: t no-byte-compile: t -*-

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; resolve path
(setq user-home-directory
  (file-name-as-directory (getenv "HOME")))

(defun expand-directory-name (name &optional dir)
  "Convert directory name to absolute path"
  (file-name-as-directory
    (expand-file-name name dir)))

;; load path
(defun add-subdirs-to-load-path (dir)
  "Recursive add directories to `load-path`"
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))

(defun add-emacs-directory (dir)
  "Add user emacs directory to `load-path`"
  (add-subdirs-to-load-path
    (expand-directory-name dir user-emacs-directory)))

(add-emacs-directory "lisp")
(add-emacs-directory "site-lisp")

;; custom file
(defun load-custom-file (file)
  "Set file to `custom-file`"
  (setq custom-file
    (expand-file-name file user-emacs-directory))
  (when (file-exists-p custom-file)
    (load custom-file)))

(load-custom-file "custom.el")

;; packages
(require 'init-package)
(require 'init-basic)
(require 'init-themes)
(require 'init-company)
(require 'init-counsel)
(require 'init-yasnippet)
(require 'init-dashboard)
(require 'init-projectile)
(require 'init-treemacs)
(require 'init-docker)
(require 'init-magit)
(require 'init-prog)
(require 'init-lsp)
(require 'init-org)
