;; ;; package.el initialization code

;; ;; Initialize package sources
;; (require 'package) ;; brings all package management functions in the environment
;; (setq package-archives '(("melpa" . "https://melpa.org/packages/") ;; a alist of archives to fetch packages from
;; 			 ("org"   . "https://orgmode.org/elpa/")
;; 	       		 ("elpa"  . "https://elpa.gnu.org/packages/")))
;; (package-initialize) ;; Initializes the package system and prepares it to be used
;; (unless package-archive-contents (package-refresh-contents)) ;; checks if packages is already cloned or not

;; ;; Initialize use-package on Non Linux Platforms
;; (unless (package-installed-p 'use-package) (package-install 'use-package)) ;; downloads use-package if not already installed (Note : -p after function return true or nil)

;; (require 'use-package) ;; loads use-package
;; (setq use-package-always-ensure t) ;; ensures that all the packages are downloaded locally


;; ;; straight.el initialization code
;; Bootstrap code to install straight.el
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
(use-package general) ;; general.el provides a more convenient method for binding keys in emacs (for both evil and non-evil users). 
(use-package evil ;; Evil is an extensible vi layer for Emacs. It emulates the main features of Vim, and provides facilities for writing custom extensions. 
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
  :init (doom-modeline-mode))

;; WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible key bindings of the command you started typing. Heavily inspired by the original emacs-which-key and vim-which-key.
(use-package which-key
  :init (which-key-mode))

;; DOOM Emacs Themes
(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-henna t))

;; An extensible Emacs Dashboard
(use-package dashboard
  :config
  (dashboard-setup-startup-hook))
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
  (setq dashboard-startup-banner "~/.emacs.d/images/black-hole.png")
 ;; Content is not centered by default. To center, set
  (setq dashboard-center-content t)
  ;; To disable shortcut "jump" indicators for each section, set
  (setq dashboard-show-shortcuts nil)

;; This package comes with rich transformers for commands from ivy and counsel. It should be easy enough to define your own transformers too.
(use-package ivy-rich
  :after (ivy)
  :config (ivy-rich-mode))

;; A Emacs Tree plugin like NerdTree for Vim
(use-package neotree)

;; The Perspective package provides multiple named workspaces (or "perspectives") in Emacs, similar to multiple desktops in window managers like Awesome and XMonad, and Spaces on the Mac.
(use-package perspective
  :init (persp-mode))

;; Icons for Emacs
(use-package all-the-icons)

;; Projectile is a project interaction library for Emacs. Its goal is to provide a nice set of features operating on a project level without introducing external dependencies (when feasible).
(use-package projectile 
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
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
  :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")

  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)

  (setq org-agenda-files
        '("Users/abhijeetsingh/Projects/Code/emacs-from-scratch/OrgFiles/Tasks.org"
          "Users/abhijeetsingh/Projects/Code/emacs-from-scratch/OrgFiles/Habits.org"
          "Users/abhijeetsingh/Projects/Code/emacs-from-scratch/OrgFiles/Birthdays.org"))

  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-graph-column 60)

  (setq org-todo-keywords
    '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
      (sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANC(k@)")))

  (setq org-refile-targets
    '(("Archive.org" :maxlevel . 1)
      ("Tasks.org" :maxlevel . 1)))

  ;; Save Org buffers after refiling!
  (advice-add 'org-refile :after 'org-save-all-org-buffers)

  (setq org-tag-alist
    '((:startgroup)
       ; Put mutually exclusive tags here
       (:endgroup)
       ("@errand" . ?E)
       ("@home" . ?H)
       ("@work" . ?W)
       ("agenda" . ?a)
       ("planning" . ?p)
       ("publish" . ?P)
       ("batch" . ?b)
       ("note" . ?n)
       ("idea" . ?i)))

  ;; Configure custom agenda views
  (setq org-agenda-custom-commands
   '(("d" "Dashboard"
     ((agenda "" ((org-deadline-warning-days 7)))
      (todo "NEXT"
        ((org-agenda-overriding-header "Next Tasks")))
      (tags-todo "agenda/ACTIVE" ((org-agenda-overriding-header "Active Projects")))))

    ("n" "Next Tasks"
     ((todo "NEXT"
        ((org-agenda-overriding-header "Next Tasks")))))

    ("W" "Work Tasks" tags-todo "+work-email")

    ;; Low-effort next actions
    ("e" tags-todo "+TODO=\"NEXT\"+Effort<15&+Effort>0"
     ((org-agenda-overriding-header "Low Effort Tasks")
      (org-agenda-max-todos 20)
      (org-agenda-files org-agenda-files)))

    ("w" "Workflow Status"
     ((todo "WAIT"
            ((org-agenda-overriding-header "Waiting on External")
             (org-agenda-files org-agenda-files)))
      (todo "REVIEW"
            ((org-agenda-overriding-header "In Review")
             (org-agenda-files org-agenda-files)))
      (todo "PLAN"
            ((org-agenda-overriding-header "In Planning")
             (org-agenda-todo-list-sublevels nil)
             (org-agenda-files org-agenda-files)))
      (todo "BACKLOG"
            ((org-agenda-overriding-header "Project Backlog")
             (org-agenda-todo-list-sublevels nil)
             (org-agenda-files org-agenda-files)))
      (todo "READY"
            ((org-agenda-overriding-header "Ready for Work")
             (org-agenda-files org-agenda-files)))
      (todo "ACTIVE"
            ((org-agenda-overriding-header "Active Projects")
             (org-agenda-files org-agenda-files)))
      (todo "COMPLETED"
            ((org-agenda-overriding-header "Completed Projects")
             (org-agenda-files org-agenda-files)))
      (todo "CANC"
            ((org-agenda-overriding-header "Cancelled Projects")
             (org-agenda-files org-agenda-files)))))))

  (setq org-capture-templates
    `(("t" "Tasks / Projects")
      ("tt" "Task" entry (file+olp "Users/abhijeetsingh/Projects/Code/emacs-from-scratch/OrgFiles/Tasks.org" "Inbox")
           "* TODO %?\n  %U\n  %a\n  %i" :empty-lines 1)

      ("j" "Journal Entries")
      ("jj" "Journal" entry
           (file+olp+datetree "Users/abhijeetsingh/Projects/Code/emacs-from-scratch/OrgFiles/Journal.org")
           "\n* %<%I:%M %p> - Journal :journal:\n\n%?\n\n"
           ;; ,(dw/read-file-as-string "~/Notes/Templates/Daily.org")
           :clock-in :clock-resume
           :empty-lines 1)
      ("jm" "Meeting" entry
           (file+olp+datetree "Users/abhijeetsingh/Projects/Code/emacs-from-scratch/OrgFiles/Journal.org")
           "* %<%I:%M %p> - %a :meetings:\n\n%?\n\n"
           :clock-in :clock-resume
           :empty-lines 1)

      ("w" "Workflows")
      ("we" "Checking Email" entry (file+olp+datetree "Users/abhijeetsingh/Projects/Code/emacs-from-scratch/OrgFiles/Journal.org")
           "* Checking Email :email:\n\n%?" :clock-in :clock-resume :empty-lines 1)

      ("m" "Metrics Capture")
      ("mw" "Weight" table-line (file+headline "Users/abhijeetsingh/Projects/Code/emacs-from-scratch/OrgFiles/Metrics.org" "Weight")
       "| %U | %^{Weight} | %^{Notes} |" :kill-buffer t)))

  (define-key global-map (kbd "C-c j")
    (lambda () (interactive) (org-capture nil "jj")))

  (efs/org-font-setup))

;; Org Bullets
(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

;; Visual Fill Column 
(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill))

;; Language Server Protocol Mode 
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . efs/lsp-mode-setup)
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :config
  (lsp-enable-which-key-integration t))

;; Gives various ui features for lsp mode
(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))

;; Flycheck for errors before compiling
(use-package flycheck)

;; yasnippet
(use-package yasnippet :config (yas-global-mode))

;; Treemacs to view different methods and variables of file in a tree view
(use-package lsp-treemacs
  :after lsp)

;; Better lsp viewer
(use-package lsp-ivy)

;; Nice Completions 
(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

;; Nice Completions viewer for lsp
(use-package company-box
  :hook (company-mode . company-box-mode))

;; Dired and its packages
(use-package dired
  :straight nil
  :commands (dired dired-jump)
  :custom ((dired-listing-switches "-al"))
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-single-up-directory
    "l" 'dired-single-buffer))

(use-package ranger)

(use-package dired-single)

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package dired-open)
  ;; :config
  ;; Doesn't work as expected!
  ;;(add-to-list 'dired-open-functions #'dired-open-xdg t)
  ;; (setq dired-open-extensions '(("png" . "feh")
  ;;                               ("mkv" . "mpv"))))


(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "H" 'dired-hide-dotfiles-mode))

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

(use-package beacon
  :custom
  ((beacon-color "#009f00")
  (beacon-size 100)
  (beacon-blink-when-window-scrolls t)
  (beacon-blink-when-window-changes t)
  (beacon-blink-when-point-moves t)
  (beacon-mode t)))

(use-package minimap
  :custom
  (( minimap-window-location 'right) ; Minimap on the right side
  (minimap-width-fraction 0.0) ; slightly smaller minimap
  (minimap-minimum-width 20) ; also slightly smaller minimap
  (minimap-dedicated-window t) ; seems to work better
  (minimap-enlarge-certain-faces nil))) ; enlarge breaks BlockFont
