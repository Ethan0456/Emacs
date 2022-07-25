;; Add custom theme path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

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
(defun ethan/file-compile-command ()
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
							     file-name-without-extension))))))
