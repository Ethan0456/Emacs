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

;; Packages and their configs

(use-package general) ;; general.el provides a more convenient method for binding keys in emacs (for both evil and non-evil users)

(use-package evil ;; Evil is an extensible vi layer for Emacs. It emulates the main features of Vim, and provides facilities for writing custom extensions
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

;; This is a collection of Evil bindings for the parts of Emacs that Evil does not cover properly by default, such as help-mode, M-x calendar, Eshell and more.
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; rainbow-delimiters is a "rainbow parentheses"-like mode which highlights delimiters such as parentheses, brackets or braces according to their depth.
(use-package rainbow-delimiters
  :init (rainbow-delimiters-mode))

;; Ivy is a generic completion mechanism for Emacs. 
(use-package ivy
  :init (ivy-mode))

;; Counsel takes this further, providing versions of common Emacs commands that are customised to make the best use of Ivy. 
(use-package counsel
  :init (counsel-mode))

;; Helpful is an alternative to the built-in Emacs help that provides much more contextual information.
(use-package helpful
  :config (helpful-mode))

;; A fancy and fast mode-line inspired by minimalism design.
(use-package doom-modeline
  :init (doom-modeline-mode)
  :custom
  (doom-modeline-icon t)
  ())

;; WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible key bindings of the command you started typing. Heavily inspired by the original emacs-which-key and vim-which-key.
(use-package which-key
  :init (which-key-mode))

;; An extensible Emacs Dashboard
(use-package dashboard
  :config
  (dashboard-setup-startup-hook))
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
  (setq dashboard-startup-banner "~/.emacs.d/images/black-hole.png")
  ;; Dashboard items
  (setq dashboard-items '((recents  . 5)
                         (bookmarks . 5)
                         (projects . 5)))
                         ;; (agenda . 5)
                         ;; (registers . 5)))
  ;; Content is not centered by default. To center, set
  (setq dashboard-center-content t)
  ;; To disable shortcut "jump" indicators for each section, set
  (setq dashboard-show-shortcuts nil)

;; This package comes with rich transformers for commands from ivy and counsel. It should be easy enough to define your own transformers too.
(use-package ivy-rich
  :after (ivy)
  :config (ivy-rich-mode))

;; A Emacs Tree plugin like NerdTree for Vim
(use-package neotree
  :custom
  ((neo-theme 'icons)))

;; The Perspective package provides multiple named workspaces (or "perspectives") in Emacs, similar to multiple desktops in window managers like Awesome and XMonad, and Spaces on the Mac.
(use-package perspective
  :init (persp-mode))

;; Icons for Emacs
(use-package all-the-icons)

;; Projectile is a project interaction library for Emacs. Its goal is to provide a nice set of features operating on a project level without introducing external dependencies (when feasible).
(use-package projectile 
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy)
  (add-to-list 'straight-x-pinned-packages
               '("projectile" . "4d6da873ae54dbf6043b015efd9b737e2ce152c6")))
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "/home/ethan/Projects")
    (setq projectile-project-search-path '("/home/ethan/Projects")))
  (setq projectile-switch-project-action #'projectile-dired))

;; Projectile has native support for using ivy as its completion system. Counsel-projectile provides further ivy integration into projectile by taking advantage of ivy's support for selecting from a list of actions and applying an action without leaving the completion session.
(use-package counsel-projectile 
  :config (counsel-projectile-mode))

;; Terminal for Emacs
(use-package vterm
  :commands vterm
  :config
  (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *")  ;; Set this to match your custom shell prompt
  ;;(setq vterm-shell "zsh")                       ;; Set this to customize the shell to launch
  (setq vterm-max-scrollback 10000))

;; Normal Minimap
(use-package minimap)

;; Magit : git interface for emacs
(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; ;; Evil bindings for Magit
;; (use-package evil-magit
;;   :after magit)

;; Org Mode
(use-package org
  :straight (:type built-in)
  :hook (org-mode . ethan/org-mode-setup)
  :config
  (ethan/org-font-setup))

;; Org Bullets
(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

;; Visual Fill Column 
(use-package visual-fill-column
  :hook (org-mode . ethan/org-mode-visual-fill))

;; Hook to run lsp-mode for all prog-mode's
(add-hook 'prog-mode-hook 'lsp-mode)

;; Language Server Protocol Mode 
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook ((lsp-mode . ethan/lsp-mode-setup)
	 (lsp-mode . lsp-enable-which-key-integration))
  :custom
  ((lsp-server-trace t)
  (lsp-log-io-mode t)
  (lsp-enable-which-key-integration t)
  (setq lsp-clients-clangd-args '("-j=4" "-background-index" "-log=error"))
;; if you are adding the support for your language server in separate repo use
;; Use shopify-cli / theme-check-language-server for Shopify's liquid syntax
  (add-to-list 'lsp-language-id-configuration '(kotlin-mode . "kotlin-ls"))
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "kotlin-language-server")
                     :activation-fn (lsp-activate-on "kotlin-ls")
                     :server-id 'kotlin))))

;; Gives various ui features for lsp mode
(use-package lsp-ui
  :hook (prog-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-use-childframe t)
  (lsp-ui-doc-position 'top)
  (lsp-ui-doc-include-signature t)
  (lsp-ui-sideline-enable t)
  (lsp-ui-flycheck-enable t)
  (lsp-ui-flycheck-list-position 'right)
  (lsp-ui-flycheck-live-reporting t)
  (lsp-ui-peek-enable t)
  (lsp-ui-peek-list-width 60)
  (lsp-ui-peek-peek-height 25)
  (lsp-ui-doc-position 'bottom))

;; Flycheck for errors before compiling
(use-package flycheck
  :hook (prog-mode . flycheck-mode))

(add-to-list 'load-path "~/.emacs.d/snippets")

;; yasnippet
(use-package yasnippet
  :hook (prog-mode . yas-minor-mode)
  :custom
   ((yas-snippet-dirs '("~/.emacs.d/snippets"))
    (yas-global-mode 1)))

;; Predefined yasnippets
(use-package yasnippet-snippets)

;; Treemacs to view different methods and variables of file in a tree view
(use-package lsp-treemacs
  :hook (prog-mode . lsp-treemacs-sync-mode)
  :after lsp)

;; Better lsp viewer
(use-package lsp-ivy)

;; Nice Completions
(use-package company
  :after lsp-mode
  :hook (prog-mode . company-mode)
  :bind (:map company-active-map
	      ("<tab>" . company-complete-selection))
  (:map lsp-mode-map
	      ("<tab>" . company-indent-or-complete-common))
  :custom
  (yas-recompile-all)
  (yas-reload-all)
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))
  (setq company-backends
        '((company-yasnippet
	   :with company-files
	   :with company-capf
	   :with company-dabbrev-code
	   :with company-gtags
	   :with company-etags
	   :with company-keywords)))

;; Nice Completions viewer for lsp
(use-package company-box
  :hook (company-mode . company-box-mode))

;; Dired and its packages
(use-package dired
  :straight nil
  :commands (dired dired-jump)
  :custom ((insert-directory-program ethan/set-ls-variable dired-use-ls-dired t) 
	   (dired-listing-switches "-alhg --group-directories-first"))
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-single-up-directory
    "l" 'dired-single-buffer))

;; To open only single dired buffer
(use-package dired-single)

;; Icon pack for dired
(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

;; To open other files with appropriate app
(use-package dired-open)
  ;; :config
  ;; Doesn't work as expected!
  ;;(add-to-list 'dired-open-functions #'dired-open-xdg t)
  ;; (setq dired-open-extensions '(("png" . "feh")
  ;;                               ("mkv" . "mpv"))))

;; To hide dotfiles
(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "H" 'dired-hide-dotfiles-mode))

;; Debugger package
(use-package dap-mode
  ;; Uncomment the config below if you want all UI panes to be hidden by default!
  ;; :custom
  ;; (lsp-enable-dap-auto-configure nil)
  ;; :config
  ;; (dap-ui-mode 1)
  :config
  ;; Set up Node debugging
  (require 'dap-node)
  (dap-node-setup) ;; Automatically installs Node debug adapter if needed

  ;; Bind `C-c l d` to `dap-hydra` for easy access
  (general-define-key
    :keymaps 'lsp-mode-map
    :prefix lsp-keymap-prefix
    "d" '(dap-hydra t :wk "debugger")))

;; To illuminate the cursor position
(use-package beacon
  :custom
  ((beacon-color "#009f00")
  (beacon-size 40)
  (beacon-blink-when-window-scrolls t)
  (beacon-blink-when-window-changes t)
  (beacon-blink-when-point-moves t)
  (beacon-mode t)))

;; Minimap for quick buffer overview
(use-package minimap
  :custom
  ((minimap-window-location 'right) ; Minimap on the right side
   (minimap-width-fraction 0.0) ; slightly smaller minimap
   (minimap-minimum-width 20) ; also slightly smaller minimap
   (minimap-dedicated-window t) ; seems to work better
   (minimap-enlarge-certain-faces nil))) ; enlarge breaks BlockFont

;; Ranger file manager
(use-package ranger)

;; Package to support Multi vterm
(use-package multi-vterm)

;; Multiple cursor package
(use-package multiple-cursors)

;; Pulsing cursor animation
(use-package pulsing-cursor
  :straight (pulsing-cursor
	       :type git
	       :host github
	       :repo "jasonjckn/pulsing-cursor")
  :config
  (pulsing-cursor-mode +1))

;; To get color for rgb and texts
(use-package rainbow-mode)

;; All the icons for ivy-rich
(use-package all-the-icons-ivy-rich
  :init (all-the-icons-ivy-rich-mode 1)
  :custom (all-the-icons-ivy-rich-icon-size 1.0))

;; pdf-tools
(use-package pdf-tools
  ;; stop pdf-tools being automatically updated when I update the
  ;; rest of my packages, since it would need the installation command and restart
  ;; each time it updated.
  :mode  ("\\.pdf\\'" . pdf-view-mode)
  :config
  (pdf-loader-install)
  (setq-default pdf-view-display-size 'fit-height)
  (setq pdf-view-continuous nil) ;; Makes it so scrolling down to the bottom/top of a page doesn't switch to the next page
  (setq pdf-view-midnight-colors '("#ffffff" . "#121212" )) ;; I use midnight mode as dark mode, dark mode doesn't seem to work
  :general
  (general-define-key :states 'motion :keymaps 'pdf-view-mode-map
                      "j" 'pdf-view-next-page
                      "k" 'pdf-view-previous-page

                      "C-j" 'pdf-view-next-line-or-next-page
                      "C-k" 'pdf-view-previous-line-or-previous-page

                      ;; Arrows for movement as well
                      (kbd "<down>") 'pdf-view-next-line-or-next-page
                      (kbd "<up>") 'pdf-view-previous-line-or-previous-page

                      (kbd "<down>") 'pdf-view-next-line-or-next-page
                      (kbd "<up>") 'pdf-view-previous-line-or-previous-page

                      (kbd "<left>") 'image-backward-hscroll
                      (kbd "<right>") 'image-forward-hscroll

                      "H" 'pdf-view-fit-height-to-window
                      "0" 'pdf-view-fit-height-to-window
                      "W" 'pdf-view-fit-width-to-window
                      "=" 'pdf-view-enlarge
                      "-" 'pdf-view-shrink

                      "q" 'quit-window
                      "Q" 'kill-this-buffer
                      "g" 'revert-buffer

                      "C-s" 'isearch-forward
                      )
  )
