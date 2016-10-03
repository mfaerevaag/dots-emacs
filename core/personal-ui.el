;;; personal-ui.el --- ui
;;; commentary:
;;; code:

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; set theme
(load-theme personal-theme t)

;; highlight line
(global-hl-line-mode +1)
(set-face-attribute hl-line-face nil :underline nil)
(set-face-attribute hl-line-face nil :background "#393939")
(set-face-foreground 'highlight nil)

;; the blinking cursor is nothing, but an annoyance
(blink-cursor-mode -1)
(setq visible-bell 1)

(set-mouse-color "dark orange")

;; disable startup screen
(setq inhibit-startup-screen t)
;; (setq inhibit-startup-message t)
(defun display-startup-echo-area-message ()
  (message "Ready to do thy bidding, Master %s!" current-user))

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; make the fringe (gutter) smaller
;; the argument is a width in pixels (the default is 8)
(if (fboundp 'fringe-mode)
    (fringe-mode 4))

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '("" invocation-name " - " (:eval (if (buffer-file-name)
                                            (abbreviate-file-name (buffer-file-name))
                                          "%b"))))

(provide 'personal-ui)

;;; personal-ui.el ends here
