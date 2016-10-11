(use-package org-mode
  :bind (("C-c b" . org-iswitchb)
         ;; ("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         )
  :init
  (setq org-agenda-files '("~/org/cal/"))

  :config
  ;; (setq org-log-done t)

  ;; (defun personal-org-mode-defaults ()
  ;;   (let ((oldmap (cdr (assoc 'personal-mode minor-mode-map-alist)))
  ;;         (newmap (make-sparse-keymap)))
  ;;     (set-keymap-parent newmap oldmap)
  ;;     (define-key newmap (kbd "C-c +") nil)
  ;;     (define-key newmap (kbd "C-c -") nil)
  ;;     (make-local-variable 'minor-mode-overriding-map-alist)
  ;;     (push `(personal-mode . ,newmap) minor-mode-overriding-map-alist))
  ;;   )
  ;; (setq personal-org-mode-hook 'personal-org-mode-defaults)
  ;; (add-hook 'org-mode-hook (lambda () (run-hooks 'personal-org-mode-hook)))

  (add-hook 'org-mode-hook #'yas-minor-mode)
  )
