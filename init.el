;; Basic Configurations
(defun ethan-font-size-func ()
  (interactive)
  (setq ethan-font-size (cond ((string= system-type "gnu/linux") 120)
				  ((string= system-type "mac") 130))))
(setq inhibit-startup-message t) ;; stops showing startup screen when we start emacs
(setq pixel-scroll-mode 1)            ;; pixel scrolling
(scroll-bar-mode -1)             ;; disable scroll scrool
(tool-bar-mode -1)                 ;; disable toolbar
(tooltip-mode -1)                 ;; disable tooltios
(set-fringe-mode 10)              ;; gives some breathing room
(electric-pair-mode 1)           ;; Pair Parentheses
;; (menu-bar-mode -1)                ;; disable menubar
(set-face-attribute 'default nil
		    :font "JetBrainsMono Nerd Font Mono"
		    :height (eval (ethan-font-size-func))) ;; set font and font-size
(setq ring-bell-function 'ignore)
(setq persp-suppress-no-prefix-key-warning t)
(recentf-mode 1) ;; Maintains a list of recent files
(setq history-length 25) ;; saves history of minibuffer upto 25 length
(savehist-mode 1) ;; initiate above mode
(save-place-mode 1) ;; saves cursor location in files
(global-auto-revert-mode 1) ;; Sync files if the file is edited outside emacs
(setq global-auto-revert-non-file-buffers t) ;; Revert Dired and other buffers (same as above for dired and non file buffers)
(column-number-mode 1) ;; Make column number visible in modeline
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

(add-to-list 'load-path "~/.emacs.d/themes/")

;; Write backups to ~/.emacs.d/backup/
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying      t  ; Don't de-link hard links
      version-control        t  ; Use version numbers on backups
      delete-old-versions    t  ; Automatically delete excess backups:
      kept-new-versions      20 ; how many of the newest versions to keep
      kept-old-versions      5) ; and how many of the old

;; Disable line numbers for some modes
(dolist (mode '(treemacs-mode-hook
		org-mode-hook
		vterm-mode-hook
		neotree-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Move package-list to separate file 
(setq custom-file "~/.emacs.d/package-list.el")
(load custom-file 'nomessage)

;; Move themes to separate files
(setq custom-file "~/.emacs.d/themes.el")
(load custom-file 'nomessage)

;; Move customizations variables to a separate file and load it
(setq custom-file "~/.emacs.d/custom-vars.el")
(load custom-file 'nomessage)

;; Move global bindings to bindings.el
(setq custom-file "~/.emacs.d/bindings.el")
(load custom-file 'nomessage)
