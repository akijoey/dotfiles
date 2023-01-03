;; -*- lexical-binding: t no-byte-compile: t -*-

;; melpa
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; load path
(defun add-subdirs-to-load-path (dir)
  "Recursive add directories to `load-path`"
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))

(defun add-emacs-directory (dir)
  "Add user emacs directory to `load-path`"
  (add-subdirs-to-load-path
    (expand-file-name dir user-emacs-directory)))

(add-emacs-directory "lisp")
(add-emacs-directory "site-lisp")

;; packages
(require 'init-package)
(require 'init-basic)
(require 'init-ui)
(require 'init-docker)
;; (require 'init-yasnippet)
