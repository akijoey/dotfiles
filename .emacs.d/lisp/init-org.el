;; init-org.el -*- lexical-binding: t -*-

(setq org-directory
  (expand-directory-name "org" user-home-directory))
(setq org-agenda-directory
  (expand-directory-name "agenda" org-directory))
(setq org-roam-directory
  (expand-directory-name "roam" org-directory))

(ensure-directory org-directory)
(ensure-directory org-agenda-directory)
(ensure-directory org-roam-directory)

;; agenda commands
(setq org-agenda-custom-commands-default
  '("n" "Agenda and all TODOs" ((agenda "") (alltodo ""))))
(setq org-agenda-custom-commands-daily
  `("d" "Daily agenda and all TODOs"
    ,(list
      `(tags "PRIORITY=\"A\""
        ,(list
          '(org-agenda-skip-function
            '(org-agenda-skip-entry-if 'todo 'done))
          '(org-agenda-overriding-header "High-priority unfinished tasks:")))
      `(agenda ""
        ,(list
          '(org-agenda-span 'day)))
      `(alltodo ""
        ,(list
          '(org-agenda-skip-function
            '(org-agenda-skip-if nil '(scheduled deadline)))
          '(org-agenda-overriding-header "ALL normal priority tasks:"))))))

(use-package org
  :ensure nil
  :bind
  ("C-c a" . org-agenda)
  ("C-c c" . org-capture)
  :config
  (setq org-startup-indented t)
  (setq org-todo-keywords
    '((sequence "TODO" "DOING" "DONE")))
  (setq org-agenda-files
    (directory-files-recursively org-agenda-directory "\\.org$"))
  (setq org-agenda-custom-commands
    (list org-agenda-custom-commands-default org-agenda-custom-commands-daily))
  (setq org-default-notes-file
    (expand-file-name "notes.org" org-directory))
  (setq org-capture-templates
    '(("t" "Task" entry
        (file+headline "" "Tasks") "* TODO %?\n%U\n%a")
      ("n" "Note" entry
        (file+headline "" "Notes") "* %?\n%U\n%a"))))
  
(use-package org-roam
  :after org
  :bind
  ("C-c n l" . org-roam-buffer-toggle)
  ("C-c n f" . org-roam-node-find)
  ("C-c n g" . org-roam-graph)
  ("C-c n i" . org-roam-node-insert)
  ("C-c n c" . org-roam-capture)
  ("C-c n j" . org-roam-dailies-capture-today)
  :config
  (org-roam-db-autosync-mode))

(provide 'init-org)
