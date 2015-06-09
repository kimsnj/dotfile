;; Package management
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

;; Customize
;; ----------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(custom-safe-themes
   (quote
    ("a2db5fd0449d42d50d00a014304fdb50ce6473e2ad6bd1441d47848375986282" "e80932ca56b0f109f8545576531d3fc79487ca35a9a9693b62bf30d6d08c9aaf" "b9d8459b4dc66c6506950a0d5c60c29fd980c3653dfde41cff0674425bbfc7b9" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "198d02aba1ec88561e5864fb10f6c8323faa8aebd35e776e1fc96a52d062241c" "ff9e6deb9cfc908381c1267f407b8830bcad6028231a5f736246b9fc65e92b44" "a041a61c0387c57bb65150f002862ebcfe41135a3e3425268de24200b82d6ec9" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "powder blue")))))


;; Keyboard - Navigation
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)

;; Look'n Feel
(load-theme 'material t)
(set-face-attribute 'default nil :font "Ubuntu Mono" :height 110)
(tool-bar-mode -1)
(global-linum-mode 1)
(hl-line-mode 1)
(column-number-mode 1)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(global-visual-line-mode)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; Smartline
(smart-mode-line-enable)
(powerline-center-theme)
(sml/apply-theme 'respectful)

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

;; Running automatically in server-mode when not already started
(if (and window-system
	 (not (boundp 'server-process)))
    (server-start))

;; Haskell
;; =======
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)

;; GHC Mod
(if (string-equal system-type "windows-nt")
    (add-to-list 'exec-path "%appdata%\\cabal\\bin")
    (add-to-list 'exec-path "~/.cabal/bin"))

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; Completion with company-ghc
(add-hook 'after-init-hook 'global-company-mode)
