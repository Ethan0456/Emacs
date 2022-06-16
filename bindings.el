(general-evil-setup t)
(defconst my-leader "SPC")
(general-create-definer my-leader-def
  :prefix my-leader)
(general-override-mode) ;; https://github.com/noctuid/general.el/issues/99#issuecomment-360914335
;; doomesque hotkeys using spacebar as prefix
(my-leader-def
  :states '(motion normal visual treemacs) ;; NOTE the treemacs state
  :keymaps 'override ;; https://github.com/noctuid/general.el/issues/99#issuecomment-360914335

  ;; map universal argument to SPC-u
  "u" '(universal-argument :which-key "Universal argument")

  ;; Quick Access
  ";" '(eval-region :which-key "eval-region")
  "SPC ;" '(eval-buffer :which-key "eval-buffer")
  ;;"SPC" '(projectile-find-file :which-key "Projectile find file")
  ;;"SPC" '(+consult/find-file :which-key "+consult/find-file")
  "." '(find-file :which-key "Find file")
  "," '(counsel-switch-buffer :which-key "counsel-switch-buffer")
  ":" '(execute-extended-command :which-key "M-x")
;;  "x" '(open-scratch-buffer :which-key "Open scratch buffer")
  "d" '(dired-jump :which-key "dired-jump")
;;  "/" '(+consult/ripgrep :which-key "+consult/ripgrep")
  "[" '(persp-prev :which-key "persp-prev")
  "]" '(persp-next :which-key "persp-next")


  ;; editor
  "e" '(:ignore t :which-key "Editor")
;;  "eu" '(undo-tree-visualize :which-key "undo-tree-visualize")
;;  "et" '(hydra-theme/body :which-key "hydra-theme") ; not sure if this is the best place for this, perhaps toggles would be more appropriate?
  "er" '(query-replace :which-key "query-replace")
;;  "ec" '(consult-theme :which-key "consult-theme")

  ;; buffer
  ;"TAB" '(switch-to-prev-buffer :which-key "Prev buffer")
  "b" '(:ignore t :which-key "Buffer")
  "bb" '(consult-buffer :which-key "consult-buffer")
  "b[" '(previous-buffer :which-key "Previous buffer")
  "b]" '(next-buffer :which-key "Next buffer")
  "bd" '(kill-current-buffer :which-key "Kill buffer")
  "bk" '(kill-current-buffer :which-key "Kill buffer")
  "bl" '(evil-switch-to-windows-last-buffer :which-key "Switch to last buffer")
  "br" '(revert-buffer-no-confirm :which-key "Revert buffer")
  "bK" '(kill-other-buffers :which-key "Kill other buffers")

  ;; open
  "o" '(:ignore t :which-key "Open")
  "op" '(treemacs :which-key "Treemacs")
  "oP" '(treemacs-find-file :which-key "Treemacs find file")
  "oc" '(open-init-file :which-key "Open init.el")
  "ov" '(vterm :which-key "Open vterm")
  "on" '(neotree-show :which-key "Open Neotree")
  "om" '(minimap-mode :which-key "Open Minimap")
  
  ;; projectile
  "p" '(projectile-command-map :which-key "Projectile")

  ;; help
  "h" '(:ignore t :which-key "Help")
  "hf" '(helpful-callable :which-key "describe-function")
  "hk" '(helpful-key :which-key "describe-key")
  "hv" '(helpful-variable :which-key "describe-variable")
  "hm" '(describe-mode :which-key "describe-mode")
  "hF" '(describe-face :which-key "describe-face")
  "hw" '(where-is :which-key "where-is")

  ;; zoom
  ;; the hydra is nice but the rest is kind of jank, need to pla around with this more
  "=" '(text-scale-increase :which-key "text-scale-increase")
  "-" '(text-scale-decrease :which-key "text-scale-decrease")
  "z" '(:ignore t :which-key "zoom")
  "z=" '(zoom-in :which-key "zoom-in")
  "z-" '(zoom-out :which-key "zoom-out")
  "zz" '(hydra-zoom/body :which-key "hydra-zoom")

  ;; window
  "w" '(evil-window-map :which-key "Window")

  ;; toggles
  "t" '(:ignore t :which-key "Toggles")
  "ta" '(corfu-mode :which-key "corfu-mode") ;; 'a' for autocomplete
  "ts" '(flyspell-mode :which-key "flyspell-mode")
  "tf" '(flyspell-mode :which-key "flyspell-mode")
  "tc" '(flycheck-mode :which-key "flycheck-mode")
  "tm" '(minimap-mode :which-key "minimap-mode")
  "tg" '(evil-goggles-mode :which-key "evil-goggles")
  "tI" '(toggle-indent-style :which-key "Indent style")
  "tv" '(visual-line-mode  :which-key "visual-line-mode")
  "th" '(counsel-load-theme :which-key "counsel-load-theme")
  
  ;; notes/org
  "n" '(:ignore t :which-key "Notes")
  "nf" '(org-roam-node-find :which-key "find-node")
  "ni" '(org-roam-node-insert :which-key "insert-node")
  "nt" '(org-roam-dailies-goto-today :which-key "org-roam-dailies-goto-today")
  "n/" '(+consult/org-roam-ripgrep :which-key "+consult/org-roam-ripgrep")
  "na" '(org-agenda :which-key "org-agenda")

  ;; persps
  "TAB" '(perspective-map :which-key "Persp" :config (persp-mode))
  ;; "TAB" '(:ignore t :which-key "Perspective")
  ;; "TAB TAB" '(persp-switch :which-key "persp-switch")
  ;; "TAB [" '(persp-prev :which-key "persp-prev")
  ;; "TAB ]" '(persp-next :which-key "persp-next")
  ;; "TAB n" '(+persp/add-new :which-key "+persp/add-new")
  ;; "TAB N" '(+persp/add-new-import-buffer :which-key "+persp/add-new-import-buffer")
  ;; "TAB k" '(+persp/kill-current :which-key "+persp/kill-current")
  ;; "TAB d" '(+persp/kill-current :which-key "+persp/kill-current")
  ;; "TAB K" '(+persp/kill-all-except-default :which-key "+persp/kill-all-except-default")
  ;; "TAB r" '(+persp/rename :which-key "+persp/rename")
  ;; "TAB a" '(+persp/add-buffer-switch :which-key "+persp/add-buffer-switch")
  ;; "TAB b" '(persp-ivy-switch-buffer :which-key "list-or-switch-buffer")
  
  ;; quick persp switching
  "1" '((lambda () (interactive) (persp-switch-by-index insert (0))) :which-key nil)
  "2" '((lambda () (interactive) (persp-switch-by-index insert (1))) :which-key nil)
  "3" '((lambda () (interactive) (persp-switch-by-index insert (2))) :which-key nil)
  "4" '((lambda () (interactive) (persp-switch-by-index insert (3))) :which-key nil)
  "5" '((lambda () (interactive) (persp-switch-by-index insert (4))) :which-key nil)
  "6" '((lambda () (interactive) (persp-switch-by-index insert (5))) :which-key nil)
  "7" '((lambda () (interactive) (persp-switch-by-index insert (6))) :which-key nil)
  "8" '((lambda () (interactive) (persp-switch-by-index insert (7))) :which-key nil)
  "9" '((lambda () (interactive) (persp-switch-by-index insert (8))) :which-key nil)

  ;; git
  "g" '(:ignore t :which-key "Git") ; prefix
  "gg" '(magit-status :which-key "Git status"))

;; minibuffer keybindings
;; (general-define-key
;;   :keymaps default-minibuffer-maps
;;   ;; [escape] 'abort-recursive-edit ;; escape should always quit

;;   "C-a" 'move-beginning-of-line
;;   "C-e" 'move-end-of-line

;;   "C-w" 'backward-delete-word
;;   "C-v" 'yank)

;; evil bindings
;; TODO this is a bit of a mess, I need to go through the state hierarchy to define hotkeys in highest priority
;; normal/visual mode hotkeys
(general-define-key
  :states '(normal visual)
  ;; evil numbers
  "g=" 'evil-numbers/inc-at-pt
  "g-" 'evil-numbers/dec-at-pt

  ;; Comment Text
  "M-" 'comment-region
  "M+" 'uncomment-region

  ;; flyspell correct
  "z=" 'flyspell-correct-wrapper
  "C-;" 'flyspell-correct-wrapper

  ;; movement
  "C-n" 'evil-next-visual-line ;; TODO should be in motion? doesn't seem to go down to these states?
  "C-p" 'evil-previous-visual-line
  "s" 'avy-goto-char)

;; insert mode hotkeys
(general-define-key
  :states 'insert
  ;"C-SPC" 'company-complete
  "C-SPC" 'completion-at-point ;; bring up corfu completion
  "C-v" 'yank ;; C-v should paste clipboard contents

  "C-<backspace>" 'my-backward-kill-word
  "M-<backspace>" 'my-backward-kill-line

  ;; some emacs editing hotkeys inside insert mode
  "C-a" 'evil-beginning-of-visual-line
  "C-e" 'evil-end-of-visual-line
  "C-n" 'evil-next-visual-line
  "C-p" 'evil-previous-visual-line)

;; motion mode hotkeys, inherited by normal/visual
(general-define-key
  :states 'motion
  "?" '+consult-line

  ;; window management
  "C-w C-u" 'winner-undo
  "C-w u" 'winner-undo

  "C-w a" 'ace-window
  "C-w C-w" 'ace-window
  "C-w w" 'ace-window

  "C-w C-l" 'evil-window-right
  "C-w C-h" 'evil-window-left)

;; company
;; DELETEME keeping for now to help configure corfu
(general-define-key
  :keymaps '(company-active-map)
  "C-w" nil ; allow C-w to act normally during completion
  "C-h" nil
  "C-n" #'company-select-next
  "C-p" #'company-select-previous
  "TAB" #'company-complete-selection
  "<tab>" #'company-complete-selection)

;; unbind C-z from evil
(general-unbind '(motion insert treemacs) "C-z")

;; key bindings for evil search ('/')
;; there could be a better way to do this, but this works so whatever
(general-define-key
  ;; NOTE evil-ex-map is different from evil-ex-search-keymap
  :keymaps 'evil-ex-search-keymap
  ;; C-v should paste clipboard contents
  "C-v" 'yank)

;; global
(general-define-key
  ;; more traditional zoom keys
  "C-=" 'text-scale-increase
  "C--" 'text-scale-decrease
  "C-M-=" 'zoom-in
  "C-M--" 'zoom-out

   ;; C-v to paste (or "yank" in emacs jargon) from clipboard, useful for minibuffers (such as query-replace and M-x)
  "C-v" 'yank

  ;; buffer management
  ;"C-a" 'bury-buffer
  ;"C-S-a" 'unbury-buffer
  "C-a" '+persp/previous-buffer
  "C-S-a" '+persp/next-buffer
  ;"C-z" 'consult-buffer

  ;; persp cycling
  "C-<tab>" 'persp-next
  "C-<iso-lefttab>" 'persp-prev
  "C-S-<tab>" 'persp-prev
  "<backtab>" '+persp/switch-to-last-accessed

  ;; quick persp switching
  "M-1" (lambda () (interactive) (+persp/switch-by-index 0))
  "M-2" (lambda () (interactive) (+persp/switch-by-index 1))
  "M-3" (lambda () (interactive) (+persp/switch-by-index 2))
  "M-4" (lambda () (interactive) (+persp/switch-by-index 3))
  "M-5" (lambda () (interactive) (+persp/switch-by-index 4))
  "M-6" (lambda () (interactive) (+persp/switch-by-index 5))
  "M-7" (lambda () (interactive) (+persp/switch-by-index 6))
  "M-8" (lambda () (interactive) (+persp/switch-by-index 7))
  "M-9" (lambda () (interactive) (+persp/switch-by-index 8)))

;; magit
(general-define-key
  ;; https://github.com/emacs-evil/evil-magit/issues/14#issuecomment-626583736
  :keymaps 'transient-base-map
  "<escape>" 'transient-quit-one)

;; magit keybindings
;; TODO refactor within use-package
(general-define-key
  :states '(normal visual)
  :keymaps 'magit-mode-map
  ;; rebind "q" in magit-status to kill the magit buffers instead of burying them
  "q" '+magit/quit

  ;; persp switching within magit
  "M-1" (lambda () (interactive) (+persp/switch-by-index 0))
  "M-2" (lambda () (interactive) (+persp/switch-by-index 1))
  "M-3" (lambda () (interactive) (+persp/switch-by-index 2))
  "M-4" (lambda () (interactive) (+persp/switch-by-index 3))
  "M-5" (lambda () (interactive) (+persp/switch-by-index 4))
  "M-6" (lambda () (interactive) (+persp/switch-by-index 5))
  "M-7" (lambda () (interactive) (+persp/switch-by-index 6))
  "M-8" (lambda () (interactive) (+persp/switch-by-index 7))
  "M-9" (lambda () (interactive) (+persp/switch-by-index 8)))

;; org mode specific evil binding
;; unbind the return (enter) key so it becomes org-return
;; the return key is not that useful here anyways
(general-define-key
  :states 'motion
  :keymaps 'org-mode-map
  :major-modes t
  "RET" 'org-return)
;;----
;;
;;
;;; LANGUAGES
;; lsp
;;se-package lsp-mode
;;:custom
;;(lsp-completion-provider :none) ;; we use Corfu!
;;:init
;;(defun +lsp-mode-setup-completion ()
;;  (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
;;        '(orderless))) ;; Configure orderless
;;:hook ((lsp-mode . lsp-enable-which-key-integration)
;;       (lsp-mode . lsp-ui-mode)
;;       (rustic-mode . lsp))
;;       (lsp-completion-mode . +lsp-mode-setup-completion)
;;:commands lsp
;;:config
;;(setq lsp-headerline-breadcrumb-enable nil
;;      lsp-enable-snippet nil)) ;; TODO this is broken
