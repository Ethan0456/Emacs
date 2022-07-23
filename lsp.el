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

;; C/C++
;; (use-package ccls
;;   :if (not *sys/win32*)
;;   :hook ((c-mode c++-mode objc-mode) .
;;          (lambda () (require 'ccls) (lsp)))
;;   :custom
;;   (ccls-executable "/usr/bin/clangd") ; Add ccls to path if you haven't done so
;;   (ccls-sem-highlight-method 'font-lock)
;;   (ccls-enable-skipped-ranges nil)
;;   :config
;;   (lsp-register-client
;;    (make-lsp-client
;;     :new-connection (lsp-tramp-connection (cons ccls-executable ccls-args))
;;     :major-modes '(c-mode c++-mode cuda-mode objc-mode)
;;     :server-id 'ccls-remote
;;     :multi-root nil
;;     :remote? t
;;     :notification-handlers
;;     (lsp-ht ("$ccls/publishSkippedRanges" #'ccls--publish-skipped-ranges)
;;             ("$ccls/publishSemanticHighlight" #'ccls--publish-semantic-highlight))
;;     :initialization-options (lambda () ccls-initialization-options)
;;     :library-folders-fn nil)))
