(use-package org-caldav
  :if (eq 'mail personal-init-type)
  :ensure t
  :config
  (setq org-caldav-url "https://caldav.fastmail.com/dav/calendars/user/markus@faerevaag.no")

  (setq org-caldav-calendars
        '((:calendar-id "75b188e3-ff1d-4081-8d19-b43a1a20272a"
                        :files ("~/org/cal/primary.org")
                        :inbox "~/org/cal/primary-inbox.org")
          ;; (:calendar-id "57cb0d33-8061-40fd-979c-f34a1f005bdb"
          ;;               :files ("~/org/cal/school.org")
          ;;               :inbox "~/org/cal/school-inbox.org")
          ;; (:calendar-id "31124ec8-1845-4ac9-b117-3aed2225eba8"
          ;;               :files ("~/org/cal/important.org")
          ;;               :inbox "~/org/cal/important-inbox.org")
          ))

  ;; list of your org files here
  (setq org-agenda-files '("~/org/cal/"))
  (setq org-caldav-files org-agenda-files)

  ;; get the time zone right
  (setq org-icalendar-timezone "Europe/Copenhagen")
  (setq org-icalendar-date-time-format ";TZID=%Z:%Y%m%dT%H%M%S")
  )
