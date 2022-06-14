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
(use-package general)
(use-package evil
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

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))
(use-package rainbow-delimiters :init (rainbow-delimiters-mode))
(use-package ivy :init (ivy-mode))
(use-package counsel :init (counsel-mode))
(use-package helpful :config (helpful-mode))
(use-package doom-modeline :init (doom-modeline-mode))
(use-package which-key :init (which-key-mode))
(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-henna t))
(use-package dashboard
  :config
  (dashboard-setup-startup-hook))
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
  (setq dashboard-startup-banner "~/.emacs.d/images/black-hole.png")
 ;; Content is not centered by default. To center, set
  (setq dashboard-center-content t)
  ;; To disable shortcut "jump" indicators for each section, set
  (setq dashboard-show-shortcuts nil)
(use-package ivy-rich :init (ivy-rich))
(use-package neotree :init (neotree-show))
(use-package perspective
  :init (persp-mode)
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))) 
