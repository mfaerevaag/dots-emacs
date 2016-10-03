(use-package yasnippet
  :diminish yas-minor-mode
  :config
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  (add-to-list 'yas-snippet-dirs (concat personal-dir "snippets"))
  (yas-reload-all))
