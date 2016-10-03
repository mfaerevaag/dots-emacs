(use-package projectile
             :config
             (setq projectile-cache-file (expand-file-name  "projectile.cache" personal-savefile-dir))
             (projectile-global-mode t))
