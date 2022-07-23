;; This File defines basic keybindings

(general-evil-setup t)
(defconst my-leader "SPC")
(general-create-definer my-leader-def
  :prefix my-leader)
(general-override-mode)

(my-leader-def
  :states '(motion normal visual treemacs)
  :keymaps 'override

  ;; map universal argument to SPC-u
  "u" '(universal-argument :which-key "Universal argument")

  ;; Quick Access
  ";" '(eval-region :which-key "eval-region")
  "SPC ;" '(eval-buffer :which-key "eval-buffer")
  "SPC ." '(find-file :which-key "Find file")
  "SPC ," '(counsel-switch-buffer :which-key "counsel-switch-buffer")
  ":" '(execute-extended-command :which-key "M-x")
  "x" '(open-scratch-buffer :which-key "Open scratch buffer")
  "d" '(dired-jump :which-key "dired-jump")
  "r" '(ranger :which-key "ranger") 
  "[" '(persp-prev :which-key "persp-prev")
  "]" '(persp-next :which-key "persp-next")
  "," '(evil-window-left :which-key "evil-window-left")
  "." '(evil-window-right :which-key "evil-window-right")
  "<" '(evil-window-up :which-key "evil-window-up")
  ">" '(evil-window-down :which-key "evil-window-down")
  "k" '(comment-region :whick-key "comment-region")
  "K" '(uncomment-region :which-key "uncomment-region")
  "c" '(copy-region-as-kill :which-key "copy-region-as-kill")
  "r" '(ranger :which-key "ranger")
;;  "/" '(+consult/ripgrep :which-key "+consult/ripgrep")
;;  "SPC" '(projectile-find-file :which-key "Projectile find file")
;;  "SPC" '(+consult/find-file :which-key "+consult/find-file")

  ;; quick persp switching
  "1" '((lambda () (interactive) (persp-switch-by-number 1)) :which-key "switch-to-persp-1")
  "2" '((lambda () (interactive) (persp-switch-by-number 2)) :which-key "switch-to-persp-2")
  "3" '((lambda () (interactive) (persp-switch-by-number 3)) :which-key "switch-to-persp-3")
  "4" '((lambda () (interactive) (persp-switch-by-number 4)) :which-key "switch-to-persp-4")
  "5" '((lambda () (interactive) (persp-switch-by-number 5)) :which-key "switch-to-persp-5")
  "6" '((lambda () (interactive) (persp-switch-by-number 6)) :which-key "switch-to-persp-6")
  "7" '((lambda () (interactive) (persp-switch-by-number 7)) :which-key "switch-to-persp-7")
  "8" '((lambda () (interactive) (persp-switch-by-number 8)) :which-key "switch-to-persp-8")
  "9" '((lambda () (interactive) (persp-switch-by-number 9)) :which-key "switch-to-persp-9")

  ;; editor
  "e" '(:ignore t :which-key "Editor")
  "ef" '(swiper :whick-key "swiper")
  "em" '(swiper-mc :which-key "swiper-multi-cursor")
  "er" '(query-replace :which-key "query-replace")
;;  "eu" '(undo-tree-visualize :which-key "undo-tree-visualize")
;;  "et" '(hydra-theme/body :which-key "hydra-theme") ; not sure if this is the best place for this, perhaps toggles would be more appropriate?
;;  "ec" '(consult-theme :which-key "consult-theme")

  ;; buffer management
  "b" '(:ignore t :which-key "Buffer")
  "bp" '(switch-to-prev-buffer :which-key "Prev buffer")
  "b[" '(previous-buffer :which-key "Previous buffer")
  "b]" '(next-buffer :which-key "Next buffer")
  "bd" '(kill-current-buffer :which-key "Kill buffer")
  "bk" '(kill-current-buffer :which-key "Kill buffer")
  "bl" '(evil-switch-to-windows-last-buffer :which-key "Switch to last buffer")
  "br" '(revert-buffer-no-confirm :which-key "Revert buffer")
  "bK" '(kill-other-buffers :which-key "Kill other buffers")
  "bs" '(save-buffer :which-key "Save Buffer")
  "ba" '(bury-buffer :which-key "Bury Buffer")
  "bA" '(unbury-buffer :which-key "Unbury Buffer")
  ;; "bb" '(consult-buffer :which-key "consult-buffer")
  ;; "C-a" '+persp/previous-buffer
  ;; "C-S-a" '+persp/next-buffer
  ;; "C-z" 'consult-buffer

  ;; file
  "f" '(:ignore t :whick-key "Files")
  "fc" '((lambda () compile file-compile-command) :whick-key "compile-file")
  "fr" '(recompile :which-key "recompile-file")
  "fd" '(delete-blank-lines :which-key "delete-blank-lines")
  
  ;; open
  "o" '(:ignore t :which-key "Open")
  "ot" '(treemacs :which-key "Treemacs")
  "oT" '(treemacs-find-file :which-key "Treemacs find file")
  "ov" '(multi-vterm :which-key "Open multi-vterm")
  "on" '(neotree-toggle :which-key "Open Neotree")
  "om" '(minimap-mode :which-key "Open Minimap")
  
  ;; projectile
  "p" '(projectile-command-map :which-key "Projectile")

  ;; help
  "h" '(:ignore t :which-key "Help")
  "hm" '(describe-mode :which-key "describe-mode")
  "hF" '(describe-face :which-key "describe-face")
  "hw" '(where-is :which-key "where-is")
  "hf" '(helpful-callable :which-key "helpful-callable")
  "hk" '(helpful-key :which-key "helpful-key")
  "hv" '(helpful-variable :which-key "helpful-variable")
  "hs" '(helpful-symbol :which-key "helpful-symbol")
  "hp" '(helpful-at-point :which-key "helpful-at-point")

  ;; zoom
  "=" '(text-scale-increase :which-key "text-scale-increase")
  "-" '(text-scale-decrease :which-key "text-scale-decrease")
  ;; ;; "z" '(:ignore t :which-key "zoom")
  ;; ;; "z=" '(zoom-in :which-key "zoom-in")
  ;; ;; "z-" '(zoom-out :which-key "zoom-out")
  ;; ;; "zz" '(hydra-zoom/body :which-key "hydra-zoom")
  ;; ;; the hydra is nice but the rest is kind of jank, need to pla around with this more

  ;; lsp
  "l" '((lambda () (lsp-command-map)) :which-key "LSP")

  ;; window
  "w" '(evil-window-map :which-key "Window")

  ;; toggles
  "t" '(:ignore t :which-key "Toggles")
  "th" '(counsel-load-theme :which-key "counsel-load-theme")
  "tf" '(flyspell-mode :which-key "flyspell-mode")
  "tc" '(flycheck-mode :which-key "flycheck-mode")
  "tm" '(minimap-mode :which-key "minimap-mode")
  "ts" '(toggle-scroll-bar :which-key "toggle-scroll-bar")
  "tl" '(lsp :which-key "toggle-lsp")
  "tc" '(company-mode :which-key "toggle-company-mode")
  "ty" '(yas-minor-mode :whick-key "toggle-yas-mode")

  ;; notes/org
  "n" '(:ignore t :which-key "Notes")
  "nf" '(org-roam-node-find :which-key "find-node")
  "ni" '(org-roam-node-insert :which-key "insert-node")
  "nt" '(org-roam-dailies-goto-today :which-key "org-roam-dailies-goto-today")
  "n/" '(+consult/org-roam-ripgrep :which-key "+consult/org-roam-ripgrep")
  "na" '(org-agenda :which-key "org-agenda")

  ;; persps
  "TAB" '(perspective-map :which-key "Persp" :config (persp-mode))
  
  ;; git
  "g" '(magit-status-here :which-key "Git")) ; prefix

;; Other bindings

;; normal/visual mode hotkeys
(general-define-key
 :states '(normal visual)
  "U" 'evil-scroll-up
  "Y" 'evil-scroll-down) 

;; Some Other Evil And Flycheck Bindings
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
  "C-v" 'yank)

;; magit
(general-define-key
  ;; https://github.com/emacs-evil/evil-magit/issues/14#issuecomment-626583736
  :keymaps 'transient-base-map
  "<escape>" 'transient-quit-one)

(general-define-key
  :states '(normal visual)
  :keymaps 'magit-mode-map
  ;; rebind "q" in magit-status to kill the magit buffers instead of burying them
  "q" '+magit/quit)

;; org mode specific evil binding
;; unbind the return (enter) key so it becomes org-return
;; the return key is not that useful here anyways
(general-define-key
  :states 'motion
  :keymaps 'org-mode-map
  :major-modes t
  "RET" 'org-return)

;; neotree
(general-define-key
 :states '(normal visual insert)
 :keymaps 'neotree-mode-map
 "RET" 'neotree-enter
 "j" 'neotree-next-line
 "k" 'neotree-previous-line
 "p" 'neotree-select-up-node
 "d" 'neotree-select-down-node
 "c" 'neotree-create-node
 "r" 'neotree-rename-node
 "f" 'neotree-find
 "o" 'neotree-collapse-all
 "C" 'neotree-copy-node
 "R" 'neotree-refresh
 "J" 'neotree-select-next-sibling-node
 "K" 'neotree-select-previous-sibling-node
 "P" 'neotree-copy-filepath-to-yank-ring
 "D" 'neotree-delete-node)

;; treemacs
(general-define-key
 :states 'treemacs-mode
 "RET" 'treemacs-RET-action
 "j" 'treemacs-next-line
 "k" 'treemacs-previous-line
 "F" 'treemacs-create-file
 "d" 'treemacs-create-dir
 "D" 'treemacs-delete-file
 "W" 'treemacs-create-workspace
 "r" 'treemacs-rename-file
 "c" 'treemacs-collapse-parent-node
 "i" 'treemacs-increase-width
 "I" 'treemacs-decrease-width
 "C" 'treemacs-copy-file
 "M" 'treemacs-move-file
 "R" 'treemacs-refresh)

               ;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;; Old Config ;;;;;;;;;;;;;;;;;;;
               ;;;;;;;;;;;;;;;;
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
;; minibuffer keybindings
;; (general-define-key
;;   :keymaps  
;;   ;; [escape] 'abort-recursive-edit ;; escape should always quit
;;   "C-j" 'move
;;   "C-a" 'move-beginning-of-line
;;   "C-e" 'move-end-of-line
;;   "C-w" 'backward-delete-word
;;   "C-v" 'yank)
;; evil bindings
;; TODO this is a bit of a mess, I need to go through the state hierarchy to define hotkeys in highest priority
;; insert mode hotkeys
;; (general-define-key
;;   :states 'insert
;;   ;"C-SPC" 'company-complete
;;   "C-SPC" 'completion-at-point ;; bring up corfu completion
;;   "C-v" 'yank ;; C-v should paste clipboard contents
;;   "C-<backspace>" 'backward-kill-word
;;   "C-S-<backspace>" 'backward-kill-line
;;   ;; some emacs editing hotkeys inside insert mode
;;   "C-a" 'evil-beginning-of-visual-line
;;   "C-e" 'evil-end-of-visual-line
;;   "C-n" 'evil-next-visual-line
;;   "C-p" 'evil-previous-visual-line)
;; motion mode hotkeys, inherited by normal/visual
;; (general-define-key
;;   :states 'motion
;;   "?" '+consult-line
;;   ;; window management
;;   "C-w C-u" 'winner-undo
;;   "C-w u" 'winner-undo
;;   "C-w a" 'ace-window
;;   "C-w C-w" 'ace-window
;;   "C-w w" 'ace-window
;;   "C-w C-l" 'evil-window-right
;;   "C-w C-h" 'evil-window-left)
;; company
;; DELETEME keeping for now to help configure corfu
;; (general-define-key
;;   :keymaps '(company-active-map)
;;   "C-w" nil ; allow C-w to act normally during completion
;;   "C-h" nil
;;   "C-n" #'company-select-next
;;   "C-p" #'company-select-previous
;;   "TAB" #'company-complete-selection
;;   "<tab>" #'company-complete-selection)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
