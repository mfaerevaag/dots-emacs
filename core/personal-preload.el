;;; personal-preload.el --- utility functions
;;; commentary:
;;; code:

(defun personal-load(file)
  (load (concat personal-dir file)))

(defun is-in-terminal()
  (not (display-graphic-p)))

(provide 'personal-preload)

;;; personal-preload.el ends here
