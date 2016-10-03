;;; personal-custom.el --- custom
;;; commentary:
;;; code:

(defgroup personal nil
  "Personal Emacs configuration."
  :prefix "personal-"
  :group 'convenience)

(defcustom personal-auto-save t
  "Non-nil values enable auto save."
  :type 'boolean
  :group 'personal)

(defcustom personal-guru t
  "Non-nil values enable `guru-mode'."
  :type 'boolean
  :group 'prelude)

(defcustom personal-whitespace t
  "Non-nil values enable Personal's whitespace visualization."
  :type 'boolean
  :group 'personal)

(defcustom personal-clean-whitespace-on-save t
  "Cleanup whitespace from file before it's saved.
Will only occur if `personal-whitespace' is also enabled."
  :type 'boolean
  :group 'personal)

(defcustom personal-flyspell t
  "Non-nil values enable Personal's flyspell support."
  :type 'boolean
  :group 'personal)

(defcustom personal-indent-sensitive-modes
  '(conf-mode coffee-mode haml-mode python-mode slim-mode yaml-mode)
  "Modes for which auto-indenting is suppressed."
  :type 'list
  :group 'personal)

(defcustom personal-theme 'wombat
  "The default color theme"
  :type 'symbol
  :group 'personal)

(defcustom personal-default-directory "~/dev/code/"
  "The default directory"
  :type 'string
  :group 'personal)

(provide 'personal-custom)

;;; personal-custom.el ends here
