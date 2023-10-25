;; early-init.el -*- lexical-binding: t -*-

;; defer garbage collection
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'emacs-startup-hook (lambda ()
  (setq gc-cons-threshold (* 100 1000 1000))))

;; defer initialize package
(setq package-enable-at-startup nil)

;; increase maximum data
(setq read-process-output-max (* 1024 1024))

;; minimize user Interface
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(horizontal-scroll-bar-mode 0)
