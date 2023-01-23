;; -*- lexical-binding: t -*-

;; init-company.el

(use-package company
  :diminish
  :hook (after-init . global-company-mode)
  :config
  (setq
    ;; customization
    company-minimum-prefix-length 1
    company-idle-delay
      (lambda () (if (company-in-string-or-comment) nil 0))
    company-global-modes
      '(not erc-mode message-mode help-mode gud-mode eshell-mode shell-mode)
    company-selection-wrap-around t
    company-require-match nil

    ;; frontends
    company-tooltip-align-annotations t
    company-tooltip-limit 12
    company-text-face-extra-attributes
      '(:weight bold :slant italic)
    
    ;; backends
    company-dabbrev-ignore-case nil
    company-dabbrev-downcase nil
    company-backends '((company-capf :with company-yasnippet)
      (company-dabbrev-code company-keywords company-files)
      company-dabbrev)))

(provide 'init-company)
