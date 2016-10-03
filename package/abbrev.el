(use-package abbrev
  :diminish abbrev-mode
  :config
  (add-hook 'text-mode-hook 'abbrev-mode)
  (if (file-exists-p abbrev-file-name)
      (quietly-read-abbrev-file)))
