;;; pulsing-cursor-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:


;;;### (autoloads nil "pulsing-cursor" "pulsing-cursor.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from pulsing-cursor.el

(autoload 'pulsing-cursor--start-idle-timer "pulsing-cursor" "\
Start the `pulsing-cursor-idle-timer'." nil nil)

(autoload 'pulsing-cursor--start-timer "pulsing-cursor" "\
Start the `pulsing-cursor-timer'." nil nil)

(autoload 'pulsing-cursor-start "pulsing-cursor" "\
Timer function called from the timer `pulsing-cursor-idle-timer'.
This starts the timer `pulsing-cursor-timer', which makes the cursor blink
if appropriate.  It also arranges to cancel that timer when the next
command starts, by installing a pre-command hook." nil nil)

(autoload 'pulsing-cursor-timer-function "pulsing-cursor" "\
Timer function of timer `pulsing-cursor-timer'." nil nil)

(autoload 'pulsing-cursor-end "pulsing-cursor" "\
Stop cursor blinking.
This is installed as a pre-command hook by `pulsing-cursor-start'.
When run, it cancels the timer `pulsing-cursor-timer' and removes
itself as a pre-command hook." nil nil)

(autoload 'pulsing-cursor-suspend "pulsing-cursor" "\
Suspend cursor blinking.
This is called when no frame has focus and timers can be suspended.
Timers are restarted by `pulsing-cursor-check', which is called when a
frame receives focus." nil nil)

(autoload 'pulsing-cursor--should-blink "pulsing-cursor" "\
Determine whether we should be blinking.
Returns whether we have any focused non-TTY frame." nil nil)

(autoload 'pulsing-cursor-check "pulsing-cursor" "\
Check if cursor blinking shall be restarted.
This is done when a frame gets focus.  Blink timers may be
stopped by `pulsing-cursor-suspend'.  Internally calls
`pulsing-cursor--should-blink' and returns its result." nil nil)

(autoload 'pulsing-cursor--rescan-frames "pulsing-cursor" "\
Called when the set of focused frames changes or when we delete a frame.

\(fn &optional IGN)" nil nil)

(register-definition-prefixes "pulsing-cursor" '("pulsing-cursor-"))

;;;***

(provide 'pulsing-cursor-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; pulsing-cursor-autoloads.el ends here
