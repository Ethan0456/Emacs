(use-package shanty-themes)

(use-package moe-theme
  :config (show-paren-mode t)
  :custom (show-paren-style 'expression)
          (moe-theme-mode-line-color nil))

(use-package afternoon-theme)

(use-package color-theme-modern)

(use-package material-theme)

(use-package kaolin-themes)

(use-package cyberpunk-theme)

(use-package zerodark-theme)

;; (use-package spacemacs-theme)

(use-package color-theme-sanityinc-tomorrow)

(use-package ujelly-theme)

(use-package atom-one-dark-theme)

(use-package darktooth-theme)

(use-package twilight-theme)

(use-package spacemacs-theme
  :defer t)

(use-package bespoke-themes
  :straight (:host github :repo "mclear-tools/bespoke-themes" :branch "main")
  :config
  ;; Set evil cursor colors
  (setq bespoke-set-evil-cursors t)
  ;; Set use of italics
  (setq bespoke-set-italic-comments t
        bespoke-set-italic-keywords t)
  ;; Set variable pitch
  (setq bespoke-set-variable-pitch t)
  ;; Set initial theme variant
  (setq bespoke-set-theme 'dark)
  ;; Load theme
  (load-theme 'bespoke t))

(use-package lambda-themes
  :straight (:type git :host github :repo "lambda-emacs/lambda-themes") 
  :custom
  (lambda-themes-set-italic-comments t)
  (lambda-themes-set-italic-keywords t)
  (lambda-themes-set-variable-pitch t) 
  :config
  ;; load preferred theme 
  (load-theme 'lambda-dark t))

(use-package ample-theme)

(use-package sublime-themes)

(use-package base16-theme)

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t)) ; if nil, italics is universally disabled

(use-package ef-themes
  :straight (:type git :host github :repo "protesilaos/ef-themes"))
