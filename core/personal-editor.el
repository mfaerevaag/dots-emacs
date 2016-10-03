;;; personal-editor.el --- editor
;;; commentary:
;;; code:

;; default directory
(setq default-directory personal-default-directory)

;; indents
(setq-default indent-tabs-mode nil)   ;; don't use tabs to indent
(setq-default tab-width 4)
;; fix yas-expand overwrite
;;(setq tab-always-indent t)
;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)         ;; but maintain correct appearance

;; newline at end of file
(setq require-final-newline t)

;; delete the selection with a keypress
(delete-selection-mode t)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; automatically save buffers associated with files on buffer switch
;; and on windows switch
(defun personal-auto-save-command ()
  "Save the current buffer if `personal-auto-save' is not nil."
  (when (and personal-auto-save
             buffer-file-name
             (buffer-modified-p (current-buffer))
             (file-writable-p buffer-file-name))
    (save-buffer)))
(add-hook 'mouse-leave-buffer-hook 'personal-auto-save-command)

(set-default 'imenu-auto-rescan t)

;; ediff - don't start another frame
(require 'ediff)


;; clean up obsolete buffers automatically
(require 'midnight)

;; overwrite C-a to go to beginning line with cursor on first
;; non-whitespace
(global-set-key [remap move-beginning-of-line]
                'personal-move-beginning-of-line)


(provide 'personal-editor)

;;; personal-editor.el ends here
