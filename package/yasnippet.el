(use-package yasnippet
  :diminish yas-minor-mode
  :config
  (add-to-list 'yas-snippet-dirs (concat personal-dir "snippets"))
  (yas-reload-all)

  (add-hook 'fundamental-mode-hook #'yas-minor-mode)
  (add-hook 'prog-mode-hook #'yas-minor-mode))
