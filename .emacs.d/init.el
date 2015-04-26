;; Package management
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

;; Look'n Feel
(load-theme 'monokai t)
(set-face-attribute 'default nil :font "Ubuntu Mono")
(tool-bar-mode -1)
(global-linum-mode 1)
(hl-line-mode 1)
(column-number-mode 1)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; Smartline
(smart-mode-line-enable)

;; IDO mode
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; Smex -- Ido style matching for M-x
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; Snippets
(setq yas-snippet-dirs
      '("~/.emacs.d/elpa/haskell-mode-13.12/snippets"
	"~/.emacs.d/elpa/yasnippet-20150415.244/snippets"
        ))

(yas-global-mode 1)
(setq-default yas-prompt-functions '(yas-ido-prompt yas-dropdown-prompt))

;; Keyboard
(load-library "iso-transl")

;; Haskell
;; =======
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)

;; GHC Mod
(add-to-list 'exec-path "~/.cabal/bin")
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; Completion with company-ghc
(add-hook 'after-init-hook 'global-company-mode)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
