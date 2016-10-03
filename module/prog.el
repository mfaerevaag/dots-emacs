(defun personal-local-comment-auto-fill ()
  (set (make-local-variable 'comment-auto-fill-only-comments) t))

(defun personal-font-lock-comment-annotations ()
  "Highlight a bunch of well known comment annotations.

This functions should be added to the hooks of major modes for programming."
  (font-lock-add-keywords
   nil '(("\\<\\(\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|HACK\\|REFACTOR\\):\\)"
          1 font-lock-warning-face t))))

;; show the name of the current function definition in the modeline
(require 'which-func)
(which-function-mode 1)

;; in Emacs 24 programming major modes generally derive from a common
;; mode named prog-mode; for others, we'll arrange for our mode
;; defaults function to run personal-prog-mode-hook directly.  To
;; augment and/or counteract these defaults your own function
;; to personal-prog-mode-hook, using:
;;
;;     (add-hook 'personal-prog-mode-hook 'my-prog-mode-defaults t)
;;
;; (the final optional t sets the *append* argument)

;; smart curly braces
(sp-pair "{" nil :post-handlers
         '(((lambda (&rest _ignored)
              (personal-smart-open-line-above)) "RET")))

;; enlist a more liberal guru
(setq guru-warn-only t)

(defun personal-prog-mode-defaults ()
  "Default coding hook, useful with any programming language."
  (when (and (executable-find ispell-program-name)
             personal-flyspell)
    (flyspell-prog-mode))
  (when personal-guru
    (guru-mode +1))
  (smartparens-mode +1)
  (personal-enable-whitespace)
  (personal-local-comment-auto-fill)
  (personal-font-lock-comment-annotations))

(setq personal-prog-mode-hook 'personal-prog-mode-defaults)

(add-hook 'prog-mode-hook (lambda ()
                            (run-hooks 'personal-prog-mode-hook)))

;; enable on-the-fly syntax checking
(if (fboundp 'global-flycheck-mode)
    (global-flycheck-mode +1)
  (add-hook 'prog-mode-hook 'flycheck-mode))
