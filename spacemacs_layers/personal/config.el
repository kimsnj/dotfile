;; Look and feel
(menu-bar-mode t)

;; Running automatically in server-mode when not already started
(if (and window-system (not (boundp 'server-process)))
    (server-start))

;; Trying out org-mode as a journal and a day planner
(custom-set-variables
 '(org-agenda-files (quote ("~/org/todo.org ~/org/journal.org")))
 '(org-agenda-ndays 7)
 '(org-deadline-warning-days 14))

(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "PENDING(p)"
                  "|" "DONE(d)" "DEFERED(f)" "CANCELLED(x)")))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/todo.org" "Tasks")
         "* TODO %?\n  %\n  %a")
        ("j" "Journal" entry (file+datetree+prompt "~/org/journal.org")
         "* %?\nEntered on %U\n\n%i\nLink:%a\n")))

