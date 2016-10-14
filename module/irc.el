(use-package rcirc
  :if (eq 'irc personal-init-type)

  :ensure rcirc
  :ensure rcirc-groups
  :ensure rcirc-alertify

  :config


  (add-hook 'rcirc-mode-hook #'(flyspell-mode
                                rcirc-track-minor-mode
                                winner-mode))

  ;; (ispell-change-dictionary "norsk")

  ;; formating
  (setq rcirc-prompt "»» "
        rcirc-fill-column 80
        ;; rcirc-fill-flag nil
        rcirc-buffer-maximum-lines 2048
        rcirc-omit-responses '("JOIN" "PART" "QUIT" "NICK" "AWAY" "MODE")
        rcirc-time-format "%Y-%m-%d %H:%M "
        rcirc-omit-threshold 20)

  (set (make-local-variable 'scroll-conservatively) 8192)

  ;; extensions
  (require 'rcirc-groups)

  (require 'rcirc-alertify)
  (rcirc-alertify-enable)
  (setq alert-default-style 'libnotify)

  (setq rcirc-server-alist '(
                             ("bitlbee"
                              :host "138.68.80.199"
                              :port 6668
                              :user-name "markus"
                              :auth "markus/bitlbee"
                              :encryption tls)
                             ))

  (add-hook 'after-init-hook (lambda ()
                               (setq rcirc-server-alist
                                     ;; This will replace :auth with the correct thing,
                                     ;; see the doc for that function
                                     (personal/znc-rcirc-server-alist-get-authinfo rcirc-server-alist))
                               (personal/znc-rcirc-connect)
                               ))
  )
