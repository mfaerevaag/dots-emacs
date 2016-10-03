(use-package dired+
  :ensure t
  :config
  ;; reuse current buffer
  (put 'dired-find-alternate-file 'disabled nil)
  (diredp-toggle-find-file-reuse-dir 1)

  ;; always delete and copy recursively
  (setq dired-recursive-deletes 'always)
  (setq dired-recursive-copies 'always)

  ;; if there is a dired buffer displayed in the next window, use its
  ;; current subdir, instead of the current subdir of this dired buffer
  (setq dired-dwim-target t))
