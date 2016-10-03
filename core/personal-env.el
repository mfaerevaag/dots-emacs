;;; personal-env.el --- environment config
;;; Commentary:
;;; Code:

;; platform specific
(cond
 ((string-equal system-type "windows-nt") ; Windowns
  (progn
    (message "Aah shit, fire ze missiles!") ))
 ((string-equal system-type "darwin") ; Mac OS X
  (progn
    (load-file (concat personal-core-dir "/personal-env-mac.el"))))
 ((string-equal system-type "gnu/linux") ; linux
  (progn
    (load-file (concat personal-core-dir "/personal-env-linux.el")))))

(provide 'personal-env)

;;; personal/env.el ends here
