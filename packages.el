(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; straight integrate with use-package
(straight-use-package 'use-package)
;; always invoke straight when using use-package
(setq straight-use-package-by-default t)

(setq user-custom-package-list
    '(general
      evil
      evil-collection
      rainbow-delimiters
      ivy
      ivy-rich
      counsel
      helpful
      doom-modeline
      doom-themes
      which-key
      dashboard
      neotree
      treemacs
      perspective
      all-the-icons
      projectile
      counsel-projectile
      vterm
      minimap
      magit
      org
      org-bullets
      lsp-mode
      lsp-ui
      lsp-treemacs
      lsp-ivy
      flycheck
      yasnippet
      yasnippet-snippets
      company
      company-box
      dired-single
      dired-open
      dired-hide-dotfiles
      all-the-icons-dired
      dap-mode
      beacon
      ranger
      rainbow-mode
      savehist))

(dolist (package-name user-custom-package-list)
  (straight-use-package package-name))
