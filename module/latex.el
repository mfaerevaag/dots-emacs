(use-package latex
  :if personal-init-full
  :ensure auctex
  :ensure cdlatex
  :ensure company-auctex
  :config
  (require 'smartparens-latex)
  ;; for case
  (require 'cl)

  (eval-after-load "company"
    '(progn
       (company-auctex-init)))

  (defcustom personal-latex-fast-math-entry 'LaTeX-math-mode
    "Method used for fast math symbol entry in LaTeX."
    :link '(function-link :tag "AUCTeX Math Mode" LaTeX-math-mode)
    :link '(emacs-commentary-link :tag "CDLaTeX" "cdlatex.el")
    :group 'personal
    :type '(choice (const :tag "None" nil)
                   (const :tag "AUCTeX Math Mode" LaTeX-math-mode)
                   (const :tag "CDLaTeX" cdlatex)))

  ;; AUCTeX configuration
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)

  (setq-default TeX-master nil)

  ;; use pdflatex
  (setq TeX-PDF-mode t)

  ;; sensible defaults for OS X, other OSes should be covered out-of-the-box
  (when (eq system-type 'darwin)
    (setq TeX-view-program-selection
          '((output-dvi "DVI Viewer")
            (output-pdf "PDF Viewer")
            (output-html "HTML Viewer")))

    (setq TeX-view-program-list
          '(("DVI Viewer" "open %o")
            ("PDF Viewer" "open %o")
            ("HTML Viewer" "open %o"))))

  (defun personal-latex-mode-defaults ()
    "Default Personal hook for `LaTeX-mode'."
    (turn-on-auto-fill)
    (abbrev-mode +1)
    (smartparens-mode +1)
    (case personal-latex-fast-math-entry
      (LaTeX-math-mode (LaTeX-math-mode 1))
      (cdlatex (turn-on-cdlatex))))

  (setq personal-latex-mode-hook 'personal-latex-mode-defaults)

  (add-hook 'LaTeX-mode-hook (lambda ()
                               (run-hooks 'personal-latex-mode-hook)))
  )
