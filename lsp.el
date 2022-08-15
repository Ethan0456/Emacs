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
