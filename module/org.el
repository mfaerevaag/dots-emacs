(use-package org-mode
  :bind (("C-c b" . org-iswitchb)
         ;; ("C-c l" . org-store-link)
         ;; ("C-c a" . org-agenda)
         )
  :config
  (setq org-log-done t)

  (defun prelude-org-mode-defaults ()
    (let ((oldmap (cdr (assoc 'prelude-mode minor-mode-map-alist)))
          (newmap (make-sparse-keymap)))
      (set-keymap-parent newmap oldmap)
      (define-key newmap (kbd "C-c +") nil)
      (define-key newmap (kbd "C-c -") nil)
      (make-local-variable 'minor-mode-overriding-map-alist)
      (push `(prelude-mode . ,newmap) minor-mode-overriding-map-alist))
    )

  (setq prelude-org-mode-hook 'prelude-org-mode-defaults)

  (add-hook 'org-mode-hook (lambda () (run-hooks 'prelude-org-mode-hook))))

