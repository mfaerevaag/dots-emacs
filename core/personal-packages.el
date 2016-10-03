;;; personal-packages.el --- packages
;;; commentary:
;;; code:

(require 'package)

;; add melpa repo
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; set package-user-dir to be relative to Prelude install path
(setq package-user-dir (expand-file-name "elpa" personal-dir))

(package-initialize)

;; use-package for package handling
(require 'use-package)

;; if not there, install
;; (setq use-package-always-ensure t)

(provide 'personal-packages)

;;; personal-packages.el ends here
