;; require
(require 'sr-speedbar)

;; speedbar width
(setq sr-speedbar-width 20)

;; left side
(setq sr-speedbar-right-side nil)

;; disable icon
(setq speedbar-use-images nil)

;; auto refresh
(setq sr-speedbar-auto-refresh t)

;; display all file
(setq speedbar-show-unknown-files t)

;; sort tags
(setq speedbar-tag-hierarchy-method '(speedbar-prefix-group-tag-hierarchy))

;; close line number
(add-hook 'speedbar-mode-hook '(lambda () (linum-mode -1)))

;; speedbar toggle
(global-set-key (kbd "<f5>") (lambda() (interactive) (sr-speedbar-toggle)))

;; provide
(provide 'init-sr-speedbar)
