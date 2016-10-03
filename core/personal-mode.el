;;; personal-mode.el --- mode
;;; commentary:
;;; code:

(require 'personal-bindings)

(define-minor-mode personal-mode
  "Personal minor-mode"
  t " P" 'personal-mode-map)

(define-globalized-minor-mode personal-global-mode personal-mode personal-on)

(defun personal-minibuffer-setup-hook ()
  "Custom personal-mode hook"
  (personal-mode 0))

(add-hook 'minibuffer-setup-hook 'personal-minibuffer-setup-hook)

(defun personal-on ()
  "Turn on `personal-mode'."
  (personal-mode +1))

(defun personal-off ()
  "Turn off `personal-mode'."
  (personal-mode -1))

(provide 'personal-mode)

;;; personal-mode.el ends here
