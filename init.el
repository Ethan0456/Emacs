;; Basic Configurations

(setq inhibit-startup-message t) ;; stops showing startup screen when we start emacs
(scroll-bar-mode -1)             ;; disable scroll scrool
(tool-bar-mode -1)                 ;; disable toolbar
(tooltip-mode -1)                 ;; disable tooltios
(set-fringe-mode 10)              ;; gives some breathing room
;; (menu-bar-mode -1)                ;; disable menubar
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font Mono" :height 130) ;; set font and font-size
(setq ring-bell-function 'ignore)
(setq persp-suppress-no-prefix-key-warning t)
(recentf-mode 1) ;; Maintains a list of recent files
(setq history-length 25) ;; saves history of minibuffer upto 25 length
(savehist-mode 1) ;; initiate above mode
(save-place-mode 1) ;; saves cursor location in files
(global-auto-revert-mode 1) ;; Sync files if the file is edited outside emacs
(setq global-auto-revert-non-file-buffers t) ;; Revert Dired and other buffers (same as above for dired and non file buffers)
(column-number-mode) ;; Make column number visible in modeline
(global-display-line-numbers-mode t) ;; Enable line numbers

;; qWrite backups to ~/.emacs.d/backup/
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying      t  ; Don't de-link hard links
      version-control        t  ; Use version numbers on backups
      delete-old-versions    t  ; Automatically delete excess backups:
      kept-new-versions      20 ; how many of the newest versions to keep
      kept-old-versions      5) ; and how many of the old

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
		vterm-mode-hook
		neotree-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Move customizations variables to a separate file and load it
(setq custom-file "~/.emacs.d/custom-vars.el")
(load custom-file 'noerror 'nomessage)

;; Move package-list to package-list.el
(setq custom-file "~/.emacs.d/package-list.el")
(load custom-file 'noerror 'nomessage)

;; Move global bindings to bindings.el
(setq custom-file "~/.emacs.d/bindings.el")
(load custom-file 'noerror 'nomessage)
