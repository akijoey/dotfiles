;; init-lsp.el -*- lexical-binding: t -*-

(defun lsp-bash-check-zsh-shell (&rest _)
  "Check whether 'sh-shell' is sh, bash, or zsh"
  (and (memq major-mode '(sh-mode bash-ts-mode))
    (memq sh-shell '(sh bash zsh))))

(use-package lsp-mode
  :hook
  (prog-mode . (lambda ()
    (unless (derived-mode-p 'emacs-lisp-mode 'lisp-mode 'makefile-mode)
      (lsp-deferred))))
  ((markdown-mode yaml-mode yaml-ts-mode) . lsp-deferred)
  (lsp-mode . lsp-enable-which-key-integration)
  :bind (:map lsp-mode-map
    ([remap xref-find-definitions] . lsp-find-definition)
    ([remap xref-find-references] . lsp-find-references))
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-modeline-code-action-fallback-icon "!")
  (advice-add 'lsp-bash-check-sh-shell
    :override 'lsp-bash-check-zsh-shell))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-sideline-enable nil))

(use-package lsp-treemacs
  :after (lsp-mode treemacs)
  :demand t
  :config
  (lsp-treemacs-sync-mode))

(use-package lsp-ivy)

(provide 'init-lsp)
