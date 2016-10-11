;;; personal-bindings.el --- core
;;; commentary:
;;; code:

;; personal key map
(defvar personal-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c o") 'personal-open-with)
    (define-key map (kbd "C-c n") 'personal-cleanup-buffer-or-region)
    (define-key map (kbd "C-c s") 'personal-swap-windows)
    (define-key map (kbd "C-c D") 'personal-delete-file-and-buffer)
    (define-key map (kbd "C-c d") 'personal-duplicate-current-line-or-region)
    (define-key map (kbd "C-c r") 'personal-rename-buffer-and-file)
    (define-key map (kbd "C-c k") 'personal-kill-other-buffers)
    (define-key map (kbd "C-c I") 'personal-find-user-init-file)
    (define-key map (kbd "C-x C-n") 'personal-create-scratch-buffer)

    (define-key map (kbd "C-c e") 'emojify-insert-emoji)

    (define-key map (kbd "M-s-n") '(lambda () (interactive) (shrink-window -1)))
    (define-key map (kbd "M-s-p") '(lambda () (interactive) (shrink-window 1)))
    (define-key map (kbd "M-s-f") '(lambda () (interactive) (shrink-window-horizontally -1)))
    (define-key map (kbd "M-s-b") '(lambda () (interactive) (shrink-window-horizontally 1)))
    map))

;; registers
(set-register ?t (cons 'file personal-todo-file))

(provide 'personal-bindings)

;;; personal-bindings.el ends here
