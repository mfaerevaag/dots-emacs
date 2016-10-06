(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :config
  (setq undo-tree-history-directory-alist
        `((".*" . ,temporary-file-directory)))
  (setq undo-tree-auto-save-history t)

  (global-undo-tree-mode))
