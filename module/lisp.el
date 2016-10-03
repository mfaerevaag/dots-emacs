(use-package lisp
  :if personal-init-full
  :ensure slime
  :mode ("\\.lisp\\'" "\\.cl\\'")
  :config
  (setq inferior-lisp-program "sbcl")

  ;; Lisp configuration
  (define-key read-expression-map (kbd "TAB") 'completion-at-point)

  ;; a great lisp coding hook
  (defun personal-lisp-coding-defaults ()
    (smartparens-strict-mode +1)
    (rainbow-delimiters-mode +1))

  (setq personal-lisp-coding-hook 'personal-lisp-coding-defaults)

  ;; interactive modes don't need whitespace checks
  (defun personal-interactive-lisp-coding-defaults ()
    (smartparens-strict-mode +1)
    (rainbow-delimiters-mode +1)
    (whitespace-mode -1))

  (setq personal-interactive-lisp-coding-hook 'personal-interactive-lisp-coding-defaults))
