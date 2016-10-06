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

(defun personal-enable-flyspell ()
  "Enable command `flyspell-mode' if `personal-flyspell' is not nil."
  (when (and personal-flyspell (executable-find ispell-program-name))
    (flyspell-mode +1)))

(defun personal-cleanup-maybe ()
  "Invoke `whitespace-cleanup' if `personal-clean-whitespace-on-save' is not nil."
  (when personal-clean-whitespace-on-save
    (whitespace-cleanup)))

(defun personal-enable-whitespace ()
  "Enable `whitespace-mode' if `personal-whitespace' is not nil."
  (when personal-whitespace
    ;; keep the whitespace decent all the time (in this buffer)
    (add-hook 'before-save-hook 'personal-cleanup-maybe nil t)
    (whitespace-mode +1)))

;; fix kill-region
;; note - this should be after volatile-highlights is required
;; add the ability to cut the current line, without marking it
(defadvice kill-region (before smart-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

;; conditional init
(setq personal-init-type (intern (or "min" (getenv "EMACS_INIT"))))
(if (member 'full (list 'min 'full 'irc))
      (message "Initializing for %s..." (symbol-name personal-init-type))
    (error (concat "Unknown init type " (symbol-name personal-init-type))))
(setq personal-init-full (eq 'full personal-init-type))

(provide 'personal-core)

;;; personal-core.el ends here
