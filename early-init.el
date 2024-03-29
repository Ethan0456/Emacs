;; Setting straight.el
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

;; Custom Variables and Functions
;; set font size based on system-type
(defun ethan-font-size-func ()
  (interactive)
  (setq ethan-font-size (cond ((string= system-type "gnu/linux") 120)
				  ((string= system-type "darwin") 130))))

;; set ls command based on system-type
(defun ethan/set-ls-command ()
  (interactive)
  (cond ((string= system-type "gnu/linux") (setq ethan/set-ls-variable "ls"))
	((string= system-type "darwin") (setq ethan/set-ls-variable "gls"))))
(eval (ethan/set-ls-command))

;; set compile-command based on file extension
(defun ethan/file-set-compile-command ()
  (interactive)
  (let* ((file-name-full buffer-file-name)
         (file-ext (file-name-extension buffer-file-name))
         (file-name-without-extension (file-name-sans-extension buffer-file-name))
         (file-name-without-extension-and-path (file-name-base buffer-file-name)))
    
    (cond ((string= file-ext "c") (setq compile-command (format "gcc -o %s %s && ./%s"
							      file-name-without-extension
							      file-name-full
							      file-name-without-extension-and-path)))
	  ((string= file-ext "cpp") (setq compile-command (format "g++ -o %s %s && ./%s"
							     file-name-without-extension
							     file-name-full
							     file-name-without-extension-and-path))) 
	  ((string= file-ext "java") (setq compile-command (format "javac %s && java %s"
						             file-name-full
						             file-name-without-extension)))
	  ((string= file-ext "kt") (setq compile-command (format "kotlinc %s -include-runtime -d %s.jar && java -jar %s.jar"
							     file-name-full
							     file-name-without-extension
							     file-name-without-extension)))
	  ((string= file-ext "py") (setq compile-command (format "python3 %s"
								 file-name-full))))))

;; To compile and recompile with universal argument
(defun ethan/universal-compile-command ()
  (interactive)
  (setq current-prefix-arg '(4))
   (call-interactively 'compile))

(defun ethan/universal-recompile-command ()
  (interactive)
  (setq current-prefix-arg '(4))
   (call-interactively 'recompile))
