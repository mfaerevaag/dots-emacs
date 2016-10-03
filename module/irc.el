(use-package irc
  :if personal-init-irc
  :ensure circe
  :ensure helm-circe

  :config

  (add-hook 'after-init-hook (lambda ()

                               (setq freenode-pass (password-store-get "irc/freenode-slevin"))

                               (setq circe-network-options
                                     '(("Freenode"
                                        :nick "slevin"
                                        :channels ("#emacs")
                                        :nickserv-password ,freenode-pass
                                        )))

                               ;; grey out bot text
                               (defvar personal-circe-bot-list '("phrik" "q"))
                               (defun personal-circe-message-option-bot (nick &rest ignored)
                                 (when (member nick personal-circe-bot-list)
                                   '((text-properties . (face circe-fool-face
                                                              lui-do-not-track t)))))
                               (add-hook 'circe-message-option-functions 'personal-circe-message-option-bot)

                               ;; spellcheck
                               (flyspell-mode 1)

                               (circe "Freenode")
                               )))
