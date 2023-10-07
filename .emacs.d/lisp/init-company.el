;; init-company.el -*- lexical-binding: t -*-

(use-package company
  :diminish
  :hook (after-init . global-company-mode)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay
    (lambda () (if (company-in-string-or-comment) nil 0)))
  (setq company-global-modes
    '(not erc-mode message-mode help-mode gud-mode eshell-mode shell-mode))
  (setq company-selection-wrap-around t)
  (setq company-require-match nil)

  ;; frontends
  (setq company-tooltip-align-annotations t)
  (setq company-tooltip-limit 12)
  (setq company-text-face-extra-attributes
    '(:weight bold :slant italic))

  ;; backends
  (setq company-dabbrev-ignore-case nil)
  (setq company-dabbrev-downcase nil)
  (setq company-backends '((company-capf :with company-yasnippet)
    (company-dabbrev-code company-keywords company-files)
    company-dabbrev)))

(provide 'init-company)
