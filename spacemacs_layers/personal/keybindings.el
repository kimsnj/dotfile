
;; Keyboard - Navigation
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)

;; Org capture
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c e") 'yas-expand)

;; Using helm for buffers and files
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'spacemacs/helm-find-files)

;; Multiple cursors
(global-set-key (kbd "C-»") 'mc/mark-next-like-this)
(global-set-key (kbd "C-«") 'mc/mark-previous-like-this)

(global-set-key (kbd "C-c C-«") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C-»") 'mc/mark-all-like-this)

(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
