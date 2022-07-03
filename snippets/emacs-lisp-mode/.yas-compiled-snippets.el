;;; Compiled snippets and support files for `emacs-lisp-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'emacs-lisp-mode
		     '(("yonp" "(yes-or-no-p \"${1:prompt} \")" "yes-or-no-p" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/yes-or-no-p" nil nil)
		       ("<" "\"\\\\_<${1:word}\\\\_>\"" "word_regexp" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/word_regexp" nil nil)
		       ("word-or-region" ";; example of a command that works on current word or text selection\n(defun down-case-word-or-region ()\n  \"Lower case the current word or text selection.\"\n(interactive)\n(let (pos1 pos2 meat)\n  (if (and transient-mark-mode mark-active)\n      (setq pos1 (region-beginning)\n            pos2 (region-end))\n    (setq pos1 (car (bounds-of-thing-at-point 'symbol))\n          pos2 (cdr (bounds-of-thing-at-point 'symbol))))\n\n  ; now, pos1 and pos2 are the starting and ending positions\n  ; of the current word, or current text selection if exists\n\n  ;; put your code here.\n  $0\n  ;; Some example of things you might want to do\n  (downcase-region pos1 pos2) ; example of a func that takes region as args\n  (setq meat (buffer-substring-no-properties pos1 pos2)) ; grab the text.\n  (delete-region pos1 pos2) ; get rid of it\n  (insert \"newText\") ; insert your new text\n\n  )\n)" "Command that works on region or word" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/word-or-region" nil nil)
		       ("wcb" "(with-current-buffer $0)" "with-current-buffer" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/with-current-buffer" nil nil)
		       ("wg" "(widget-get $0)" "widget-get" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/widget-get" nil nil)
		       ("w" "(when $0)" "when" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/when" nil nil)
		       ("v" "(vector $0)" "vector" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/vector" nil nil)
		       ("upb" ":bind (\"${1:binding}\" . ${2:function-name})" "use-package binding" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/use-package-binding" nil nil)
		       ("up" "(use-package ${1:package-name}\n:ensure t$0)" "use-package" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/use-package" nil nil)
		       ("tap" "(thing-at-point ${1:thing}${2: no-properties})" "thing-at-point" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/thing-at-point" nil nil)
		       ("substring" "(substring ${1:string} ${2:from}${3: to})" "substring" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/substring" nil nil)
		       ("string=" "(string= $0)" "string=" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/string=" nil nil)
		       ("stn" "(string-to-number $0)" "string-to-number" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/string-to-number" nil nil)
		       ("sm" "(string-match \"${1:regexp}\" \"${2:string}\"${3: start})" "string-match" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/string-match" nil nil)
		       ("ss" "(split-string ${1:string}${2: separators}${3: omit-nulls})" "split-string" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/split-string" nil nil)
		       ("scf" "(skip-chars-forward \"${1:string}\"${2: lim})" "skip-chars-forward" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/skip-chars-forward" nil nil)
		       ("scb" "(skip-chars-backward \"${1:string}\"${2: lim})" "skip-chars-backward" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/skip-chars-backward" nil nil)
		       ("sh" "(should $0)" "should" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/should" nil nil)
		       ("s" "(setq $0)" "setq" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/setq" nil nil)
		       ("sm" "(set-mark $0)" "set-mark" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/set-mark" nil nil)
		       ("sfm" "(set-file-modes ${1:filename} $0)" "set-file-modes" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/set-file-modes" nil nil)
		       ("sb" "(set-buffer $0)" "set-buffer" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/set-buffer" nil nil)
		       ("sfr" "(search-forward-regexp \"$1\"${2: ${3:bound}${4: ${5:noerror}${6: count}}})$0\n" "search-forward-regexp" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/search-forward-regexp" nil nil)
		       ("sf" "(search-forward \"$1\"${2: ${3:bound}${4: ${5:noerror}${6: count}}})$0\n" "search-forward" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/search-forward" nil nil)
		       ("sbr" "(search-backward-regexp \"$1\"${2: ${3:bound}${4: ${5:noerror}${6: count}}})$0\n" "search-backward-regexp" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/search-backward-regexp" nil nil)
		       ("sb" "(search-backward \"$1\"${2: ${3:bound}${4: ${5:noerror}${6: count}}})$0\n" "search-backward" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/search-backward" nil nil)
		       ("se" "(save-excursion $0)" "save-excursion" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/save-excursion" nil nil)
		       ("sb" "(save-buffer $0)" "save-buffer" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/save-buffer" nil nil)
		       ("rris" "(replace-regexp-in-string ${1:regexp} ${2:rep} ${3:string}${4: fixedcase}${5: literal}${6: subexp}${7: start})" "replace-regexp-in-string" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/replace-regexp-in-string" nil nil)
		       ("rr" "(replace-regexp ${1:regexp}${2: delimited}${3: start}${4: end})" "replace-regexp" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/replace-regexp" nil nil)
		       ("rf" "(rename-file ${1:file} ${2:newname}${3: ok-if-already-exists})" "rename-file" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/rename-file" nil nil)
		       ("re" "(region-end)" "region-end" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/region-end" nil nil)
		       ("rb" "(region-beginning)" "region-beginning" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/region-beginning" nil nil)
		       ("rap" "(region-active-p)" "region-active-p" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/region-active-p" nil nil)
		       ("rsf" "(re-search-forward ${1:regexp}${2: bound}${3: noerror}${4: count})" "re-search-forward" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/re-search-forward" nil nil)
		       ("rsb" "(re-search-backward ${1:regexp}${2: bound}${3: noerror}${4: count})" "re-search-backward" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/re-search-backward" nil nil)
		       ("put" "(put ${1:symbol} ${2:propname} ${3:value})" "put" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/put" nil nil)
		       ("pm" "(point-min)" "point-min" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/point-min" nil nil)
		       ("point-max" "(point-max)" "point-max" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/point-max" nil nil)
		       ("p" "(point)" "point" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/point" nil nil)
		       ("o" "(or $0)" "or" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/or" nil nil)
		       ("nts" "(number-to-string $0)" "number-to-string" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/number-to-string" nil nil)
		       ("nth" "(nth ${1:index} ${2:list})" "nth" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/nth" nil nil)
		       ("n" "(not $0)" "not" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/not" nil nil)
		       ("minor" "(defvar ${1:mode}-modeline-indicator \" ${2:indicator}\"\n  \"call ($1-install-mode) again if this is changed\")\n\n(defvar $1-mode nil)\n(make-variable-buffer-local '$1-mode)\n(put '$1-mode 'permanent-local t)\n\n(defun $1-mode (&optional arg)\n  \"$0\"\n  (interactive \"P\")\n  (setq $1-mode\n        (if (null arg) (not $1-mode)\n          (> (prefix-numeric-value arg) 0)))\n  (force-mode-line-update))\n\n(provide '$1-mode)" "minor_mode" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/minor_mode" nil nil)
		       ("m" "(message \"${1:message}\"${2: format-args})" "message" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/message" nil nil)
		       ("memq" "(memq ${1:element} ${2:list})" "memq" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/memq" nil nil)
		       ("ms" "(match-string $0)" "match-string" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/match-string" nil nil)
		       ("me" "(match-end $0)" "match-end" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/match-end" nil nil)
		       ("mb" "(match-beginning $0)" "match-beginning" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/match-beginning" nil nil)
		       ("mapc" "(mapc ${1:function} $0)" "mapc" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/mapc" nil nil)
		       ("mlv" "(make-local-variable $0)" "make-local-variable" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/make-local-variable" nil nil)
		       ("md" "(make-directory ${1:directory}${2: parents})" "make-directory" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/make-directory" nil nil)
		       ("la" "(looking-at $0)" "looking-at" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/looking-at" nil nil)
		       ("lep" "(line-end-position)" "line-end-position" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/line-end-position" nil nil)
		       ("lbp" "(line-beginning-position)" "line-beginning-position" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/line-beginning-position" nil nil)
		       ("l" "(let${1:*} (${2:args})\n  $0)" "let" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/let" nil nil)
		       ("lam" "(lambda ($1) ${2:(interactive${3: \"$4\"}) }$0)\n" "lambda" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/lambda" nil nil)
		       ("kb" "(kill-buffer $0)" "kill-buffer" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/kill-buffer" nil nil)
		       ("kbd" "(kbd \"$0\")" "kbd" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/kbd" nil nil)
		       ("interactive" "(interactive${1: \"${2:P}\"})" "interactive" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/interactive" nil nil)
		       ("ifc" "(insert-file-contents ${1:filename}${2: visit}${3: beg}${4: end}${5: replace})" "insert-file-contents" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/insert-file-contents" nil nil)
		       ("i" "(insert $0)" "insert" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/insert" nil nil)
		       ("header" ";;; ${1:name}.el --- ${2:summary} -*- lexical-binding: t -*-\n\n;; Author: ${3:`(user-full-name)`}\n;; Maintainer: ${4:`(user-full-name)`}\n;; Version: ${5:version}\n;; Package-Requires: (${6:dependencies})\n;; Homepage: ${7:homepage}\n;; Keywords: ${8:keywords}\n\n${9:\n;; This file is not part of GNU Emacs\n\n;; This program is free software: you can redistribute it and/or modify\n;; it under the terms of the GNU General Public License as published by\n;; the Free Software Foundation, either version 3 of the License, or\n;; (at your option) any later version.\n\n;; This program is distributed in the hope that it will be useful,\n;; but WITHOUT ANY WARRANTY; without even the implied warranty of\n;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n;; GNU General Public License for more details.\n\n;; You should have received a copy of the GNU General Public License\n;; along with this program.  If not, see <https://www.gnu.org/licenses/>.\n}\n\n;;; Commentary:\n\n;; ${10:commentary}\n\n;;; Code:\n\n${11:(message \"Hello World!\")}\n\n(provide '$1)\n\n;;; $1.el ends here" "package header" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/header" nil nil)
		       ("grabthing" "(setq $0 (thing-at-point 'symbol))" "grab word under cursor" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/grabthing" nil nil)
		       ("grabstring" "(setq $0 (buffer-substring-no-properties myStartPos myEndPos))" "grab buffer substring" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/grabstring" nil nil)
		       ("gc" "(goto-char $0)" "goto-char" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/goto-char" nil nil)
		       ("gsk" "(global-set-key (kbd \"${1:key}\") $0)" "global-set-key" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/global-set-key" nil nil)
		       ("get" "(get ${1:symbol} {2:propname})" "get" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/get" nil nil)
		       ("fl" "(forward-line $0)" "forward-line" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/forward-line" nil nil)
		       ("fc" "(forward-char $0)" "forward-char" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/forward-char" nil nil)
		       ("f" "(format \"${1:message}\" ${2:format-args})" "format" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/format" nil nil)
		       ("ff" "(find-file $0)" "find-file" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/find-file" nil nil)
		       ("file.read-lines" "(defun read-lines (filePath)\n  \"Return a list of lines in FILEPATH.\"\n  (with-temp-buffer\n    (insert-file-contents filePath)\n    (split-string\n     (buffer-string) \"\\n\" t)))\n\n;; process all lines\n(mapc\n (lambda (aLine)\n   (message aLine) ; do your stuff here\n   )\n (read-lines \"inputFilePath\")\n)" "read lines of a file" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/file.read-lines" nil nil)
		       ("file.process" "(defun doThisFile (fpath)\n  \"Process the file at path FPATH ...\"\n  (let ()\n    ;; create temp buffer without undo record or font lock. (more efficient)\n    ;; first space in temp buff name is necessary\n    (set-buffer (get-buffer-create \" myTemp\"))\n    (insert-file-contents fpath nil nil nil t)\n\n    ;; process it ...\n    ;; (goto-char 0) ; move to begining of file's content (in case it was open)\n    ;; ... do something here\n    ;; (write-file fpath) ;; write back to the file\n\n    (kill-buffer \" myTemp\")))" "a function that process a file" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/file.process" nil nil)
		       ("frn" "(file-relative-name $0)" "file-relative-name" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/file-relative-name" nil nil)
		       ("fnse" "(file-name-sans-extension $0)" "file-name-sans-extension" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/file-name-sans-extension" nil nil)
		       ("fnn" "(file-name-nondirectory $0)" "file-name-nondirectory" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/file-name-nondirectory" nil nil)
		       ("fne" "(file-name-extension ${1:filename}${2: period})" "file-name-extension" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/file-name-extension" nil nil)
		       ("fnd" "(file-name-directory $0)" "file-name-directory" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/file-name-directory" nil nil)
		       ("fboundp" "(fboundp '$0)" "fboundp" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/fboundp" nil nil)
		       ("efn" "(expand-file-name $0)" "expand-file-name" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/expand-file-name" nil nil)
		       ("edt" "(ert-deftest ${1:test-name} ()\n  $0)\n" "ert-deftest" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/ert-deftest" nil nil)
		       ("error" "(error \"${1:message}\"${2: format-args})" "error" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/error" nil nil)
		       ("eol" "(end-of-line)" "end-of-line" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/end-of-line" nil nil)
		       ("dired.process_marked" ";; idiom for processing a list of files in dired's marked files\n\n;; suppose myProcessFile is your function that takes a file path\n;; and do some processing on the file\n\n(defun dired-myProcessFile ()\n  \"apply myProcessFile function to marked files in dired.\"\n  (interactive)\n  (require 'dired)\n  (mapc 'myProcessFile (dired-get-marked-files))\n)\n\n;; to use it, type M-x dired-myProcessFile" "process marked files in dired" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/dired.process_marked" nil nil)
		       ("df" "(directory-files ${1:directory}${2: full}${3: match}${4: nosort})" "directory-files" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/directory-files" nil nil)
		       ("dr" "(delete-region $0)" "delete-region" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/delete-region" nil nil)
		       ("df" "(delete-file $0)" "delete-file" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/delete-file" nil nil)
		       ("dd" "(delete-directory ${1:directory}${2: recursive})\n" "delete-directory" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/delete-directory" nil nil)
		       ("dc" "(delete-char $0)" "delete-char" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/delete-char" nil nil)
		       ("defvar" "(defvar ${1:symbol} ${2:initvalue} \"${3:docstring}\")" "defvar" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/defvar" nil nil)
		       ("def" "(defun ${1:fun} (${2:args})\n  \"${3:docstring}\"\n  ${4:(interactive${5: \"${6:P}\"})}\n  $0)" "defun" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/defun" nil nil)
		       ("dk" "(define-key ${1:mode}-map (kbd \"${2:key}\") $0)" "define-key" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/define-key" nil nil)
		       ("defcustom" "(defcustom ${1:symbol} ${2:standard} \"${3:docstring}\"${4: args})" "defcustom" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/defcustom" nil nil)
		       ("defalias" "(defalias '${1:symbol} '${2:alias}${3: \"docstring\"})" "defalias" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/defalias" nil nil)
		       ("ca" "(custom-autoload ${1:symbol} ${2:load}${3: noset})" "custom-autoload" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/custom-autoload" nil nil)
		       ("cb" "(current-buffer)" "current-buffer" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/current-buffer" nil nil)
		       ("cf" "(copy-file ${1:filename} ${2:newname}${3: ok-if-already-exists}${4: keep-time}{5: preserve-uid-gid})" "copy-file" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/copy-file" nil nil)
		       ("cd" "(copy-directory ${1:directory} {2:target}${3: keep-time}${4: parents})" "copy-directory" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/copy-directory" nil nil)
		       ("const" "(defconst ${1:name} ${2:value}${3: \"${4:docstring}\"})$0" "defconst" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/const" nil nil)
		       ("cc" "(condition-case $0)" "condition-case" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/condition-case" nil nil)
		       ("cond" "(cond\n (${1:condition} ${2:body})$0)" "cond" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/cond" nil nil)
		       ("bsnp" "(buffer-substring-no-properties ${1:start} ${2:end})" "buffer-substring-no-properties" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/buffer-substring-no-properties" nil nil)
		       ("bs" "(buffer-substring ${1:start} ${2:end})" "buffer-substring" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/buffer-substring" nil nil)
		       ("bmp" "(buffer-modified-p $0)" "buffer-modified-p" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/buffer-modified-p" nil nil)
		       ("bfn" "(buffer-file-name)" "buffer-file-name" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/buffer-file-name" nil nil)
		       ("botap" "(bounds-of-thing-at-point $0)" "bounds-of-thing-at-point" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/bounds-of-thing-at-point" nil nil)
		       ("bol" "(beginning-of-line)" "beginning-of-line" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/beginning-of-line" nil nil)
		       ("bc" "(backward-char $0)" "backward-char" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/backward-char" nil nil)
		       ("autoload" "(autoload ${1:function} \"${2:filename}\"${3: \"docstring\"}${4: interactive}${5: type})" "autoload" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/autoload" nil nil)
		       ("assq" "(assq ${1:key} ${2:list})" "assq" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/assq" nil nil)
		       ("aset" "(aset ${1:array} ${2:index} ${3:element})" "aset" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/aset" nil nil)
		       ("aref" "(aref ${1:array} ${2:index})\n" "aref" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/aref" nil nil)
		       ("a" "(and $0)" "and" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/and" nil nil)
		       ("ah" "(add-hook '${1:name}-hook ${2:'${3:function}})$0\n" "add-hook" nil nil nil "/Users/abhijeetsingh/.emacs.d/snippets/emacs-lisp-mode/add-hook" nil nil)))


;;; Do not edit! File generated at Sat Jul  2 23:20:11 2022
