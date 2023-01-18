;; -*- lexical-binding: t -*-

;; init-company.el

(use-package company
  :diminish
  :defines (company-dabbrev-ignore-case company-dabbrev-downcase)
  :bind (("M-/" . company-complete)
    ("C-M-i" . company-complete)
    :map company-mode-map
    ("<backtab>" . company-yasnippet)
    :map company-active-map
    ("<backtab>" . my-company-yasnippet))
  :hook (after-init . global-company-mode)
  :init
  (setq
    company-tooltip-align-annotations t
    company-tooltip-limit 12
    company-idle-delay 0
    company-echo-delay (if (display-graphic-p) nil 0)
    company-minimum-prefix-length 1
    company-icon-margin 3
    company-require-match nil
    company-dabbrev-ignore-case nil
    company-dabbrev-downcase nil
    company-global-modes
      '(not erc-mode message-mode help-mode gud-mode eshell-mode shell-mode)
    company-backends '((company-capf :with company-yasnippet)
      (company-dabbrev-code company-keywords company-files)
      company-dabbrev)))

(provide 'init-company)
