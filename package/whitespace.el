(use-package whitespace
  :diminish whitespace-mode
  :config
  (setq whitespace-line-column 80) ;; limit line length
  (setq whitespace-style '(face tabs empty trailing lines-tail))
  (whitespace-mode +1))
