(use-package key-chord
             :ensure t
             :config
             (key-chord-define-global "jj" 'ace-jump-word-mode)
             (key-chord-define-global "JJ" 'personal-switch-to-previous-buffer)
             (key-chord-mode +1))
