;;; personal-core.el --- core
;;; commentary:
;;; code:

(package-initialize)
(require 'personal-packages)

(require 'personal-custom)
(require 'personal-utils)

;; config changes made through the customize UI will be store here
(setq custom-file (expand-file-name "custom.el" personal-dir))

;; dir for savefile
(defvar personal-savefile-dir (expand-file-name "savefile" personal-dir))

(require 'personal-mode)
(personal-global-mode t)

(require 'personal-ui)
(require 'personal-env)
(require 'personal-editor)

(provide 'personal-core)

;;; personal-core.el ends here
