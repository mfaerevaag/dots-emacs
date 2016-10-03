(use-package flyspell
             :config
             (setq ispell-program-name "aspell" ; use aspell instead of ispell
                   ispell-extra-args '("--sug-mode=ultra")))
