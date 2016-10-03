(setq c-default-style "linux"
      c-basic-offset 4)

(add-hook 'c-mode-common-hook
          (lambda ()
            (auto-complete-mode -1)
            (company-mode t)
            (local-set-key (kbd "C-c o") 'ff-find-other-file)
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))
