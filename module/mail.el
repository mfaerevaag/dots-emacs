(use-package mu4e
  :if (eq 'mail personal-init-type)
  :ensure mu4e-alert
  :ensure mu4e-maildirs-extension
  :config
  ;; path to our Maildir directory
  (setq mu4e-maildir "/home/markus/mail")

  ;; the next are relative to `mu4e-maildir'
  ;; instead of strings, they can be functions too, see
  ;; their docstring or the chapter 'Dynamic folders'
  (setq mu4e-sent-folder   "/faerevaag/Sent Items"
        mu4e-drafts-folder "/faerevaag/Drafts"
        mu4e-trash-folder  "/faerevaag/Trash")

  ;; the maildirs you use frequently; access them with 'j' ('jump')
  (setq   mu4e-maildir-shortcuts
          '(("/faerevaag/Archive"     . ?a)
            ("/faerevaag/INBOX"       . ?i)
            ("/faerevaag/Drafts"      . ?d)
            ("/faerevaag/Sent Items"  . ?s)))

  ;; a  list of user's e-mail addresses
  (setq mu4e-user-mail-address-list '("markus@faerevaag.no"))

  ;; the headers to show in the headers list -- a pair of a field
  ;; and its width, with `nil' meaning 'unlimited'
  ;; (better only use that for the last field.
  ;; These are the defaults:
  (setq mu4e-headers-fields
        '( (:date          .  10)    ;; alternatively, use :human-date
           (:flags         .   6)
           (:from          .  25)
           (:subject       .  nil))) ;; alternatively, use :thread-subject

  ;; program to get mail; alternatives are 'fetchmail', 'getmail'
  ;; isync or your own shellscript. called when 'U' is pressed in
  ;; main view.

  ;; If you get your mail without an explicit command,
  ;; use "true" for the command (this is the default)
  ;; (setq mail-user-agent 'mu4e-user-agent)
  ;; (setq mu4e-get-mail-command "offlineimap"
  ;;       ;; mu4e-update-interval 1
  ;;       mu4e-headers-auto-update t)

  ;; general emacs mail settings; used when composing e-mail
  ;; the non-mu4e-* stuff is inherited from emacs/message-mode
  (setq mu4e-reply-to-address "markus@faerevaag.no"
        user-mail-address "markus@faerevaag.no"
        user-full-name  "Markus Færevaag")
  ;; (setq mu4e-compose-signature
  ;;       "Markus Færevaag\nhttps://faerevaag.no\n")
  (setq message-signature-file "~/docs/sign/faerevaag")

  ;; smtp mail setting
  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-smtp-server "smtp.fastmail.com"
        smtpmail-stream-type  'ssl
        smtpmail-smtp-service 465
        smtpmail-debug-info t

        ;; ;; if you need offline mode, set these -- and create the queue dir
        ;; ;; with 'mu mkdir', i.e.. mu mkdir /home/user/Maildir/queue
        ;; smtpmail-queue-mail  nil
        ;; smtpmail-queue-dir "/home/markus/mail/Queue/cur"
        )

  (setq mu4e-get-mail-command "offlineimap -o -q -u quiet"
        mu4e-compose-complete-addresse t
        mu4e-compose-dont-reply-to-self t
        mu4e-hide-index-messages t
        mu4e-use-fancy-chars t
        mu4e-headers-auto-update t
        mu4e-update-interval 60
        mu4e-headers-visible-lines 20
        mu4e-headers-leave-behavior 'ask
        mu4e~main-buffer-name "*mu4e-main*")

  ;; html
  (require 'mu4e-contrib)
  (setq
   mu4e-view-prefer-html nil
   mu4e-html2text-command 'mu4e-shr2text)
  (add-hook 'mu4e-view-mode-hook
            (lambda()
              ;; try to emulate some of the eww key-bindings
              (local-set-key (kbd "<tab>") 'shr-next-link)
              (local-set-key (kbd "<backtab>") 'shr-previous-link)))

  ;; alert
  (require 'mu4e-alert)
  (mu4e-alert-set-default-style 'libnotify)
  (setq mu4e-alert-interesting-mail-query
      (concat
       "flag:unread"
       " AND NOT flag:trashed"
       " AND maildir:"
       "\"/faerevaag/INBOX\""))

  ;; maildirs
  (require 'mu4e-maildirs-extension)
  (setq mu4e-maildirs-extension-custom-list '("/faerevaag/INBOX"
                                              "/faerevaag/Drafts"
                                              "/faerevaag/Sent items"
                                              "/faerevaag/Archive"
                                              "/faerevaag/Trash"))

  ;; org
  (require 'org-mu4e)
  (setq mu4e-org-contacts-file "~/org/contacts.org")
  (add-to-list 'mu4e-headers-actions
               '("org-contact-add" . mu4e-action-add-org-contact) t)
  (add-to-list 'mu4e-view-actions
               '("org-contact-add" . mu4e-action-add-org-contact) t)

  ;; don't keep message buffers around
  (setq message-kill-buffer-on-exit t)

  ;; spell check
  (add-hook 'mu4e-compose-mode-hook #'flyspell-mode)

  (add-hook 'after-init-hook (lambda ()
                               (message "Starting mu4e...")
                               (mu4e)
                               (mu4e-maildirs-extension)
                               (mu4e-alert-enable-notifications)))
  )
