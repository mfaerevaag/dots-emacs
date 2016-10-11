;;; init.el --- Personal Emacs config
;;
;; Author: Markus Færevaag
;; URL: https://github.com/mfaerevaag/dots-emacs
;;
;;; Commentary:
;;
;; Based on Emacs Prelude by Bozhidar Batsov
;; https://github.com/bbatsov/prelude
;;
;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defvar current-user
  (getenv (if (equal system-type 'windows-nt) "USERNAME" "USER"))
  "Name of current user.")

;; define paths
(defvar personal-dir (file-name-directory load-file-name)
  "The root dir of personal Emacs config.")
(defvar personal-vendor-dir (expand-file-name "vendor" personal-dir))
(defvar personal-core-dir (expand-file-name "core" personal-dir))
(defvar personal-package-dir (expand-file-name "package" personal-dir))
(defvar personal-module-dir (expand-file-name "module" personal-dir))

;; add to load-path
(add-to-list 'load-path personal-core-dir)
(add-to-list 'load-path personal-vendor-dir)

;; load
(require 'personal-core)

;; loading packages
(message "Loading packages...")
(mapc 'load (directory-files personal-package-dir 't "^[^#].*el$"))

;; loading modules
(message "Loading modules...")
(mapc 'load (directory-files personal-module-dir 't "^[^#].*el$"))
;;; init.el ends here
