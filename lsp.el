;; Java
(use-package lsp-java 
  :hook (java-mode. lsp-deferred))

;; Python
(use-package python-mode
  :hook (python-mode . lsp-deferred)
  :custom
  ;; NOTE: Set these if Python 3 is called "python3" on your system!
  ;; (python-shell-interpreter "python3")
  ;; (dap-python-executable "python3")
  (dap-python-debugger 'debugpy)
  :config (require 'dap-python))

;; Kotlin
(use-package kotlin-mode
  :hook (kotlin-mode .  lsp-deferred)) 

(use-package flycheck-kotlin
  :hook (flycheck-mode . lsp--buffer-deferred))

;; HTML/CSS/JS
(use-package web-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode)) ;; Open .html files in web-mode
  :config
  (setq web-mode-enable-current-element-highlight t
        web-mode-enable-current-column-highlight t)

  :general
  (general-def
  :prefix ","
  :states 'motion
  :keymaps 'web-mode-map
  "" nil
  "i" '(web-mode-buffer-indent :which-key "web mode indent")
  "c" '(web-mode-fold-or-unfold :which-key "web mode toggle fold")))
