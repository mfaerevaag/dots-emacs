(use-package emojify
  :if (not (eq 'min personal-init-type)) ;; all but min
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-emojify-mode))
