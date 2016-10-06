(use-package flyspell
  :init
  (setq ispell-program-name "aspell" ; use aspell instead of ispell
        ispell-extra-args '("--sug-mode=ultra"))
  :config
  (add-hook 'text-mode-hook #'flyspell-mode))
