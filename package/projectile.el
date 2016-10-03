(use-package projectile
  :ensure projectile
  :ensure helm-projectile
  :config
  (setq projectile-cache-file (expand-file-name  "projectile.cache" personal-savefile-dir))
  (projectile-global-mode t)
  (helm-projectile-on))
