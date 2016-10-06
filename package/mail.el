(use-package mail-mode
  :config
  (add-hook 'mail-mode-hook 'turn-on-auto-fill)
  (add-to-list 'auto-mode-alist '("/mutt" . mail-mode)))
