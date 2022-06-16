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
  (load-theme 'doom-city-lights t))

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
  (when (file-directory-p "~/Projects/Code")
    (setq projectile-project-search-path '("~/Projects/Code")))
  (setq projectile-switch-project-action #'projectile-dired))

;; Projectile has native support for using ivy as its completion system. Counsel-projectile provides further ivy integration into projectile by taking advantage of ivy's support for selecting from a list of actions and applying an action without leaving the completion session.
(use-package counsel-projectile 
  :config (counsel-projectile-mode))

;; Terminal for Emacs
(use-package vterm)

;; Normal Minimap
(use-package minimap)

;; Magit : git interface for emacs
(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; Evil bindings for Magit
(use-package evil-magit
  :after magit)
