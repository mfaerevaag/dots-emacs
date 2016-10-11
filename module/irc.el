(use-package rcirc
  :if (eq 'irc personal-init-type)

  :ensure rcirc
  :ensure rcirc-groups
  :ensure rcirc-alertify

  :config

  (setq-default rcirc-server-alist '(("irc.freenode.net"
                                      :channels ()
                                      :nick "slevin"
                                      :encryption tls
                                      :port 6697)
                                     ("localhost"
                                      :nick "markus"
                                      :port 6667
                                      :channels ("&facebook"))))
  (setq-default rcirc-authinfo '(("freenode" nickserv "slevin" "GdFuudT7FefG4XK2Gn1RnjamyoS0L3D83RaROic1k10ajy5zxr")
                                 ("localhost" bitlbee "markus" "B2i2L.kjas.")))

  (add-hook 'rcirc-mode-hook
            (lambda ()
              ;; keep input line at bottom.
              (set (make-local-variable 'scroll-conservatively) 8192)
              ;; spellcheck
              (flyspell-mode 1)
              (ispell-change-dictionary "norsk")
              ;; window config
              (winner-mode 1)))

  ;; formating
  (setq rcirc-prompt      "»» "
        rcirc-time-format "%H:%M "
        ;; autofill off
        rcirc-fill-flag   nil)

  ;; extensions
  (require 'rcirc-groups)
  ;; (setq rcirc-groups:display-all t)
  (defun rcirc-groups:switch-to-conversation-buffer ()
    "switch from *rcirc-groups* buffer to referenced one"
    (interactive)
    (let ((conversation-buffer
           (buffer-substring (line-beginning-position) (line-end-position))))
      (rcirc-groups:catchup-conversation)
      (set-window-buffer (other-window 1) conversation-buffer)))

  (require 'rcirc-alertify)
  (rcirc-alertify-enable)
  (setq alert-default-style 'libnotify)

  (add-hook 'after-init-hook (lambda ()
                               (rcirc-connect "irc.freenode.net")
                               (rcirc-connect "localhost")
                               ))
  )
