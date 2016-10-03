(use-package python
  :if personal-init-full
  :ensure t
  :config
  (define-key python-mode-map (kbd "C-c C-c")
  (lambda () (interactive) (python-shell-send-buffer t)))
  (setq python-python-command "/usr/bin/python2")
  (setq python-shell-interpreter "/usr/bin/python2"))
